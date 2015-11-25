#import system.
#import system'collections.

#class AssemblerSri
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "rshi".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
