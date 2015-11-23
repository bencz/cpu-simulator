#import system.

#class InstructionBr
{
    #constructor new []

	#method interpret &ins:aInstruction &vm:aVm
    [
        #var(type:byte) code.
        #var(type:short) jump.
        
        code := ((aInstruction shift &index:08) and: 00Fh).
        jump := ((aInstruction shift &index:16) and: 0FFFFh).
        
        #var flags := aVm getRegister:12.
        #var shouldJump := true.
        #var ip := aVm getRegister:15.
        ip := ip + jump.
        
        (code int) =>
            (vm'ConditionCode Carry)
                ? [ shouldJump := (flags and: (vm'Flags Carry) != 0). ]
                
            (vm'ConditionCode Zero)
                ? [ shouldJump := (flags and: (vm'Flags Zero) != 0). ]
                
            (vm'ConditionCode Equal) 
                ? [ shouldJump := (flags and: (vm'Flags Zero) != 0). ]   
             
            (vm'ConditionCode NotEqual)
                ? [ shouldJump := (flags and: (vm'Flags Zero) == 0). ]
                
            (vm'ConditionCode GreaterThan)
                ? [ shouldJump := (flags and: (vm'Flags Sign) == 0). ]
                
            (vm'ConditionCode GreaterThanOrEqual)
                ? [ shouldJump := (flags and: ((vm'Flags Sign) == 0) or: (flags and: (vm'Flags Zero) != 0)). ]
                
            (vm'ConditionCode Sign)
                ? [ shouldJump := (flags and: (vm'Flags Zero) != 0). ]
            
            (vm'ConditionCode LessThan)
                ? [ shouldJump := (flags and: (vm'Flags Zero) != 0). ]
                
            (vm'ConditionCode LessThanOrEqual)
                ? [ shouldJump := (flags and: ((vm'Flags Sign) != 0) or: (flags and: (vm'Flags Zero) == 0)). ]
                
            (vm'ConditionCode Overflow)
                ? [ shouldJump := (flags and: (vm'Flags Overflow) != 0). ]
                
            ! [ shouldJump := true. ].
            
        (shouldJump)?
            [ aVm setRegister &register:15 &value:ip. ].
    ]
}