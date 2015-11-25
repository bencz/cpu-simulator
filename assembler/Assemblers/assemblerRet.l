#import system.
#import system'collections.

#class AssemblerRet
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "rtn".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
