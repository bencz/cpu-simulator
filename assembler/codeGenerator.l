#import system.
#import system'routines.
#import system'collections.
#import extensions.

#class CodeGenerator
{
    #field output.
    #field assemblers.
    
    #constructor new : aOutput
    [
        assemblers := List new.
        output := aOutput.
        
        $self registerAssembler.
    ]
    
    #method assemble : instructions
    [
        instructions run &each: ins
        [
            (ins Type) =>
                (assembler'TypeInstruction Instruction)
                ? [
                    #var tmp := $self searchForMnemonics:(ins Name).
                    ($nil == tmp)
                        ? [ console writeLine:(ins Name + " not found"). ]
                        ! [ tmp assemble &codeGen:($self) &instruction:ins &byteCodeStream:(output). ].
                  ]
                
                (assembler'TypeInstruction Label)
                ? [
                    #var cpuSymbol := assembler'CpuSymbol new:ins Name.
                    output emit &cpuSymbol:cpuSymbol.
                  ].
        ].
    ]
    
    #method registerAssembler
    [
        assemblers += (assembler'Assemblers'AssembleAdd new).
        assemblers += (assembler'Assemblers'AssembleLi new).
    ]
    
    #method searchForMnemonics : aMn
    [        
        #var i := 0.
        #var j := 0.
        #loop (i < assemblers length)?
        [
            #var asb := assemblers@i.
            #loop (j < asb Mnemonic length)?
            [
                ((asb Mnemonic)@j == aMn)
                    ? [ ^assemblers@i. ].
                j := j + 1.
            ].
            i := i + 1.
            j := 0.
        ].
        ^$nil.
    ]
}