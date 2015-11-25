#import system.
#import system'collections.

#class AssemblerSb
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "sb".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
