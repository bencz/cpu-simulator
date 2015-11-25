#import system.
#import system'collections.

#class AssemblerSub
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "sub".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
