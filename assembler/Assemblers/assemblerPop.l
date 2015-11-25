#import system.
#import system'collections.

#class AssemblerPop
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "pop".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
