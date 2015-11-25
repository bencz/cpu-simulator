#import system.
#import system'collections.

#class AssembleAdd
{
    #field mnemonic.
    
    #constructor new
    [
        mnemonic := List new.
        mnemonic += "add".
    ]
    
    #method assemble &codeGen:aCodeGen &instruction:aIns &byteCodeStream:aStr
    [
    ]
    
    #method Mnemonic = mnemonic.
}