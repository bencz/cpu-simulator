#import system.
#import system'collections.

#class AssemblerDivu
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "divu".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
