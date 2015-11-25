#import system.
#import system'collections.

#class AssemblerCmp
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "cmp".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
