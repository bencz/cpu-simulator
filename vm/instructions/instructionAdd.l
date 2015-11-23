#import system.

#class InstructionAdd
{
	#constructor new []

	#method interpret &ins:aInstruction &vm:aVm
    [
        #var(type:bytearray,size:8)dump.
        #var(type:byte)register1.
        #var(type:byte)register2.
        #var(type:byte)destRegister.
        
        dump write &int:0 &long:(aInstruction long).
        dump read &int:1 &vbyte:register1.
        dump read &int:2 &vbyte:register2.
        dump read &int:3 &vbyte:destRegister.
        
        
    ]
}
