#import system.

#class MemoryBlock
{
    #field memory.
    #field address.
    
    #constructor new &address:addr
    [
        memory := Array new &length:01000h.
        address := addr.
    ]
    
    #method memoryBlock &address:addr
    [
        address := addr.
    ]
}