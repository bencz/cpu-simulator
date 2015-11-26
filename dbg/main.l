#import forms.
#import system.
#import system'io.
#import system'routines.
#import system'collections.
#import extensions.

#symbol $loadBytes = aProgram 
[
    #var(type:vbyte) byte := 0.
    #var br := BinaryFileReader new &path:aProgram.   
    #var bta := List new.
    #loop (br available) ?
    [
        br read &vbyte:byte.
        bta += byte.
    ].
    br close.  
    ^bta. 
].

#symbol $padZeros = aValue
[
    ^((aValue literal) padLeft &char:(CharValue new &char:#48) &int:8).
].

#symbol $getRegisterName = registerCode
[
    (registerCode int) =>
        11 ? [ ^"LR". ]
        12 ? [ ^"FLAGS". ]
        13 ? [ ^"BP". ]
        14 ? [ ^"SP". ]
        15 ? [ ^"IP". ]
        16 ? [ ^"CTL". ]
        17 ? [ ^"IVT". ]
        ! [ ^(registerCode literal). ].
].

#class Window
{
    #field form.
    // cpu vm instance
    #field cpu.
        
    // Labels of registers!
    #field listLabelsRegisters.
    
    #field stepButton.
    
    #constructor new
    [        
        cpu := cpuvm'Cpu new.
        
        form := SDIDialog new.
        
        stepButton := Button new.
        form controls 
            += stepButton.
        
        form set &caption:"CPU-Simulator -- Debugger".
        form set &x:100 &y:100.
        form set &width:800 &height:600.    
        
        stepButton set &x:190 &y:10.
        stepButton set &width:140 &height:25.
        stepButton set &caption:"Step".
        stepButton set &onClick:args
            [ $self $makeStep. ].
          
        
        // Generate the labels
        #var zero := $padZeros:"0".
        #var i := 0.
        #var(type:int) y := 10.
        listLabelsRegisters := List new.
        #loop (i <= 17) ?
        [
            #var tmp := Label new.
            listLabelsRegisters += tmp.
            form controls += tmp.
            
            #var regName := "".
            (i <= 10)
            ? [
                regName := "R" + (i literal) + ": 0x" + zero
              ]
            ! [
                regName := ($getRegisterName:i) + ": 0x" + zero.
              ].
              
            tmp set &x:30 &y:(y int).
            tmp set &width:170 &height:30.
            tmp set &caption:(regName).
            y := y + 20.
            i := i + 1.
        ].
    ]
    
    #method $makeStep
    [
        cpu doStep.
        $self updateRegisterLabels.
    ]
    
    #method updateRegisterLabels
    [
        #var i := 0.      
        #loop (i <= 17)?
        [
            #var regValue := "".
            ( i <= 14) 
                ? [ regValue := $padZeros:(((cpu getRegister:i) toLiteral &base:16) literal). ].
            
            #var regName := "".
            (i <= 10)
            ? [
                regName := "R" + (i literal) + ": 0x" + regValue.
              ]
            ! [
                (i >= 15)
                ? [ 
                    regValue := $padZeros:(((cpu getRegister:15) toLiteral &base:16) literal).
                    regName := ($getRegisterName:i) + ": 0x" + regValue.
                  ]
                ! [ regName := ($getRegisterName:i) + ": 0x" + regValue. ].
                regName := ($getRegisterName:i) + ": 0x" + regValue.
              ].
            
            (listLabelsRegisters@i) set &caption:(regName).
            i := i + 1.
        ].
    ]
    
    #method => form.
}