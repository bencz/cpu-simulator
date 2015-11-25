#import system.
#import system'collections.

#class AssemblerSli
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "lshi".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
