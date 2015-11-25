#import system.
#import system'collections.

#class AssemblerMov
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "mov".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
