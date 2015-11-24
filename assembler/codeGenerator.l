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
                  ].
        ].
    ]
    
    #method registerAssembler : asm
    [
        assemblers += asm.
    ]
    
    #method searchForMnemonics : aMn
    [        
        #var i := 0.
        #loop (i < assemblers length)?
        [
            #var asb := assemblers@i.
            (asb Mnemonic == aMn)
                ? [ ^assemblers@i. ].
            i := i + 1.
        ].
        ^$nil.
    ]
}