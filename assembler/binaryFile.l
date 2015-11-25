#import system.
#import system'io.
#import system'routines.
#import system'collections.
#import extensions.

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
    
    #method finalizeExecutable
    [
        #var i := 0.
        #loop (i < instructions length) ?
        [
            #var tmp := (instructions@i).
            (tmp Type == assembler'TypeInstruction CpuInstruction)?
                [
                    ($nil != tmp Symbol)?
                    [
                        #var key := symbolTable@(tmp Symbol).
                        ($nil != key)
                        ? [ tmp resolveSymbol &sym:(tmp Symbol) &address:key. ].
                    ].
                ]
                ! [].
            i := i + 1.
        ].
    ]
    
    #method generate : outPutFile
    [
        #var(type:bytearray,size:4) auxWriter.
        #var aWriter := BinaryFileWriter new &path:outPutFile.
        
        instructions run &each: data
        [
            #var(type:int) tmp := data toMachineCode.
            auxWriter write &int:0 &int:tmp.
            
            #var(type:byte)v1.
            auxWriter read &int:0 &vbyte:v1.
            aWriter write &byte:(v1).
            
            auxWriter read &int:1 &vbyte:v1.
            aWriter write &byte:(v1).
            
            auxWriter read &int:2 &vbyte:v1.
            aWriter write &byte:(v1).
            
            auxWriter read &int:3 &vbyte:v1.
            aWriter write &byte:(v1).
        ].
        
        aWriter close.
    ]
}