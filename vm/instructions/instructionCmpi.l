#import system.

#class InstructionCmpi
{
	#constructor new []

	#method interpret &ins:aInstruction &vm:aVm
    [
        #var(type:byte)register1.
        #var(type:short)op2.
        
        register1 := ((aInstruction shift &index:08) and: 00Fh).
        op2       := ((aInstruction shift &index:16) and: 0FFFFh).
        
        #var op1 := aVm getRegister:register1.
        #var flags := aVm getRegister:12.
        #var result := op1 - op2.
        
        flags := flags and: (vm'Flags Carry not).
        flags := flags and: (vm'Flags Overflow not).
        flags := flags and: (vm'Flags Sign not).
        
        (result == 0)
            ? [ flags := flags or: (vm'Flags Zero). ]
            ! [ flags := flags and: ((vm'Flags Zero) not). ].
            
        (result < 0)
            ? [ flags := flags or: (vm'Flags Sign). ]
            ! [ flags := flags and: ((vm'Flags Sign) not). ].
            
        aVm setRegister &register:12 &value:flags.   
    ]
}
