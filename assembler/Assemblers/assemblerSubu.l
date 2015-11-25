#import system.
#import system'collections.

#class AssemblerSubu
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "subu".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
