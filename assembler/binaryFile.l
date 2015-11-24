#import system.
#import system'collections.

#class BinaryFile
{
    #field instructions.
    #field symbolTable.
    #field position.
    
    #constructor new
    [
        instructions := List new.
        symbolTable := Dictionary new.
        position := 0.
    ]
    
    #method emit : aData
    [
        aData setPosition 
    ]
}