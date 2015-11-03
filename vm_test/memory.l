#import system.
#import system'routines.
#import system'collections.
#import extensions.

#class Memory
{
    #field size.
    #field memoryBlock.
    
    #constructor new &size:aSize
    [
        memoryBlock := ArrayList new.
        size := aSize.
        #var i := 0.
        #loop (i < aSize) ? [ memoryBlock += ByteNumber new. i := i + 1. ].
    ]
    
    #method readByte &address:addr
    [
        (addr < size) ?
            [ ^memoryBlock getAt:addr. ]
    ]
    
    #method writeByte &address:addr &bt:aByte
    [
        (addr < size) ?
            [ memoryBlock insert:aByte &at:addr. ]
    ]
    
    #method readBytes
    [
    ]
    
    #method writeBytes &address:addr &bytes:aBytes
    [
    ]
}