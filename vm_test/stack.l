#import system.
#import system'routines.
#import system'collections.
#import extensions.

#class Stack
{
    #field size.
    #field memory.
    #field topStack.
    
    #constructor new &size:aSize
    [
        memory := vm'Memory new &size:aSize.
        size := aSize.
        topStack := -1.
    ]
    
    #method pop
    [
        (topStack > 0) ? 
            [ topStack := topStack - 1. ].
    ]
    
    #method pop &ref:aDest
    [
        (topStack >= 0) ? 
            [ 
                aDest << memory readWord &address:topStack.
                topStack := topStack - 1.
            ].
    ]
    
    #method push &value:aValue
    [
        (topStack < size) ?
            [ 
                topStack := topStack + 1.
                memory writeWord &address:topStack &word:aValue.
            ].
    ]
}