#import system.
#import system'collections.

#class AssemblerAddu
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "addu".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
