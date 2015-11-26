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

#class Window
{
    // cpu vm instance
    #field cpu.
    
    #field form.
    
    // Labels of registers!
    #field listLabelsRegisters.
    
    #field stepButton.
    
    #constructor new
    [
        cpu := cpuvm'Cpu new.
        cpu loadProgram : ($loadBytes:"test.bin").
        
        form := SDIDialog new.
        stepButton := Button new.
        form controls += stepButton.
        
        form set &caption:"CPU-Simulator -- Debugger".
        form set &x:100 &y:100.
        form set &width:800 &height:600.    
        
        stepButton set &x:170 &y:10.
        stepButton set &width:140 &height:25.
        stepButton set &caption:"Step".
        stepButton set &onClick:args
            [ $self $makeStep. ].
          
        
        // Generate the labels
        #var zero := (("0" literal) padLeft &char:(CharValue new &char:#48) &int:8).
        #var i := 0.
        #var x := 30.
        #var y := 10.
        listLabelsRegisters := List new.
        #loop (i <= 15) ?
        [
            #var tmp := Label new.
            listLabelsRegisters += tmp.
            form controls += tmp.
            
            tmp set &x:(x int) &y:(y int).
            tmp set &width:150 &height:30.
            tmp set &caption:("R" + (i literal) + ": 0x" + zero).
            y := y + 20.
            i := i + 1.
        ].
    ]
    
    #method $makeStep
    [
        cpu step.
        $self updateRegisterLabels.
    ]
    
    #method updateRegisterLabels
    [
        #var i := 0.
        #loop (i <= 15)?
        [
            #var regValue := (((cpu getRegister:i) toLiteral &base:16) literal) padLeft &char:(CharValue new &char:#48) &int:8.
            (listLabelsRegisters@i) set &caption:("R" + (i literal) + ": 0x" + regValue).
            i := i + 1.
        ].
    ]
    
    #method => form.
}