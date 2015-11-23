#import system.
#import extensions.

#class InstructionLi
{
	#constructor new []

	#method interpret &ins:aInstruction &vm:aVm
    [
        /*#var destRegister := ByteNumber new.
        #var data := ShortNumber new.
        
        #var ret := vm'InstructionHelper decondeInstructionDataShort &instruction:aInstruction.
        
        destRegister := (ret@0) byte.
        data := (ret@1) short.*/
        
        #var(type:bytearray,size:8)dump.
        #var(type:byte)destRegister.
        #var(type:short)data.
        
        dump write &int:0 &long:(aInstruction long).        
        
        dump read &int:1 &vbyte:destRegister.
        dump read &int:2 &vshort:data.
        
        aVm setRegister &register:destRegister &value:data.
    ]
}