#import system.

#class InstructionOr
{
	#constructor new []

	#method interpret &ins:aInstruction &cpuvm:aVm
    [
        #var(type:byte)register1.
        #var(type:byte)register2.
        #var(type:byte)destRegister.
        
        destRegister := ((aInstruction shift &index:08) and: 00Fh).
        register1    := ((aInstruction shift &index:12) and: 00Fh).
        register2    := ((aInstruction shift &index:16) and: 00Fh).
        
        #var op1 := aVm getRegister:register1.
        #var op2 := aVm getRegister:register2.
        #var flags := aVm getRegister:12.
        #var result := op1 or: op2.

        aVm setRegister &register:destRegister &value:result.
    ]
}
