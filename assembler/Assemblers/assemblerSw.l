#import system.
#import system'collections.

#class AssemblerSw
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "sw".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
