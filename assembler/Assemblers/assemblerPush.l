#import system.
#import system'collections.

#class AssemblerPush
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "push".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
