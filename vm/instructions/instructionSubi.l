#import system.

#class InstructionSubi
{
	#constructor new []

	#method interpret &ins:aInstruction &vm:aVm
    [
        #var(type:bytearray,size:8)dump.
        #var(type:byte)register1.
        #var(type:byte)destRegister.
        #var(type:short)op2.
        
        destRegister := ((aInstruction shift &index:08) and: 00Fh).
        register1    := ((aInstruction shift &index:12) and: 00Fh).
        op2          := ((aInstruction shift &index:16) and: 0FFFFh).
        
        #var flags  := aVm getRegister:12.
        #var op1    := aVm getRegister:(register1).
        #var result := op1 - op2.
        
        flags := flags and: (vm'Flags Carry not).
        flags := flags and: (vm'Flags Overflow not).
        flags := flags and: (vm'Flags Sign not).
        
        (result == 0)
            ? [ flags := flags or: (vm'Flags Zero). ]
            ! [ flags := flags and: ((vm'Flags Zero) not). ].
            
        aVm setRegister &register:destRegister &value:result.
        aVm setRegister &register:12 &value:flags.        
    ]
}
