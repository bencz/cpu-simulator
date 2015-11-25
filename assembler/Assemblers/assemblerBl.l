#import system.
#import system'collections.

#class AssemblerBl
{
    #field mnemonic.

    #constructor new
    [
        mnemonic := List new.
        mnemonic += "bl".
        mnemonic += "bls".
        mnemonic += "blv".
        mnemonic += "blc".
        mnemonic += "blz".
        mnemonic += "ble".
        mnemonic += "blne".
        mnemonic += "bll".
        mnemonic += "blg".
        mnemonic += "blle".
        mnemonic += "blge".
    ]

    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]

    #method Mnemonic = mnemonic.
}
