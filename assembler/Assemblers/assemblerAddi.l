#import system.
#import system'collections.

#class AssemblerAddi
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "addi".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
