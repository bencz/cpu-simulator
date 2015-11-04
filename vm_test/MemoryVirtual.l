#import system.
#import system'math.
#import system'collections.
#import extensions.
#import extensions'math.

#class MemoryVirtual
{
    #field host.
    #field lookasideBuffer.
    #field pageDirectory.
    
    #constructor new &host:aHost
    [
        host := aHost.
        lookasideBuffer := Dictionary new.
        pageDirectory := 0.
    ]
    
    #method writeWord &address:aAddress &word:aWord
    [   
    ]
    
    #method getPhysicalAddress : aAddress
    [
        #var vaddr := aAddress / 01000h.
        #var table := host readWord:(pageDirectory + (vaddr / 1024)).
        ^(host readWord:(table + 4 * (vaddr mod:1024))).
    ]
}