#import system.
#import system'routines.
#import system'collections.
#import extensions.

#class Registers
{
    #field register.
    
    #constructor new &numberOfRegisters:nRegisters
    [
        #var i := 0.
        register := List new.
        #loop (i < nRegisters) ? 
            [ 
                register append:(vm'Memory new &size:1).
                i := i + 1.
            ].
    ]
    
    #method read : nRegister 
    [
        ^register@nRegister readWord &address:0.
    ]
    
    #method write &register:nRegister &value:aValue
    [
        register@nRegister writeWord &address:0 &word:aValue.
    ]
}