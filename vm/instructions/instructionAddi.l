#import system.

#class InstructionAddi
{
	#constructor new []

	#method interpret &ins:aInstruction &vm:aVm
    [
        #var(type:bytearray,size:8)dump.
        #var(type:byte)register1.
        #var(type:byte)destRegister.
        #var(type:short)op2.
        
        destRegister := ((aInstruction shift &index:08) and: 00Fh).
        register1 := ((aInstruction shift &index:12) and: 00Fh).
        op2 := ((aInstruction shift &index:16) and: 0FFFFh).
        
        #var flags := aVm getRegister:12.
        #var op1 := aVm getRegister:(register1).
        #var result := op1 + op2.
        
        flags := flags and: (vm'Flags Carry not).
        (result == 0)
            ? [ flags := flags or: (002h). ]
            ! [ flags := flags and: ((002h) not). ].
        
    ]
}
