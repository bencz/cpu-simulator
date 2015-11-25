#import system.
#import system'collections.

#class AssemblerMultu
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "multu".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
