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
    
    #method emit &data:aData
    [
        aData setPosition:position.
        instructions += aData.
        position := position + aData GetLength.
    ]
    
    #method emit &cpuSymbol:aCpu
    [
        symbolTable@(aCpu Name) := position int.
    ]
}