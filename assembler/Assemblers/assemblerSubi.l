#import system.
#import system'collections.

#class AssemblerSubi
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "subi".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
