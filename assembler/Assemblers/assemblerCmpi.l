#import system.
#import system'collections.

#class AssemblerCmpi
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "cmpi".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
