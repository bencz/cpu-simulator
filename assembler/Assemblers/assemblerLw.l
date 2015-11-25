#import system.
#import system'collections.

#class AssemblerLw
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "lw".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
