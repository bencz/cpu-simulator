#import system.
#import system'collections.

#class AssemblerAdd
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "add".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
