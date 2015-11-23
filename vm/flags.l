#import system.

#symbol(const,type:int)$Sign     = 001h.
#symbol(const,type:int)$Zero     = 002h.
#symbol(const,type:int)$Carry    = 004h.
#symbol(const,type:int)$Overflow = 008h.

#class(extension) Flags
{
    #method Sign = $Sign.
    #method Zero = $Zero.
    #method Carry = $Carry.
    #method Overflow = $Overflow.
}