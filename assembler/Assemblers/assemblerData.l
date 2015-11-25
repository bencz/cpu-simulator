#import system.
#import system'collections.

#class AssemblerData
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "data".
        mnemonic += ".data".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
