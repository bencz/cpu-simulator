#import system.
#import system'collections.

#class AssemblerDiv
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "div".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
