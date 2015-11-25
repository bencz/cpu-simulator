#import system.
#import system'collections.

#class AssemblerOr
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "or".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
