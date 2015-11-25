#import system.
#import system'collections.

#class AssemblerLb
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "lb".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
