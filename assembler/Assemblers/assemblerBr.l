#import system.
#import system'collections.

#class AssemblerBr
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "br".
        mnemonic += "bs".
        mnemonic += "bv".
        mnemonic += "bc".
        mnemonic += "bz".
        mnemonic += "be".
        mnemonic += "bne".
        mnemonic += "ba".
        mnemonic += "bb".
        mnemonic += "blt".
        mnemonic += "bgt".
        mnemonic += "ble".
        mnemonic += "bge".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
