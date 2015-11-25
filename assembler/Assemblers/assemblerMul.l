#import system.
#import system'collections.

#class AssemblerMul
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "mul".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
