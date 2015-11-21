#import system.
#import system'routines.
#import system'collections.
#import extensions.

#symbol(const, type:int) UserMode           = 1.
#symbol(const, type:int) EnablePaging       = 2.
#symbol(const, type:int) EnableBoundryCheck = 4.

#class Cpu
{
    #field physicalMemory.
    #field registersSupervisor.
    #field registersUser.
    #field halted.
    #field speed.
    #field instructions.
    #field controlRegister.
    
    #constructor new
    [
        physicalMemory := vm'MemoryPhysical new.
        instructions := Dictionary new.
        registersUser := ByteArray new &int:16.
        registersSupervisor := ByteArray new &int:16.
        
        controlRegister := 0.
        halted := false.
        speed := 100000.
        
        $self setOpcodes.      
    ]
    
    #method setOpcodes
    [
        instructions@00h := vm'instructions'InstructionAddi new.
        instructions@80h := vm'instructions'InstructionAdd new.
//        instructions@81h := vm'instructions'InstructionAdc new.
//        instructions@82h := vm'instructions'InstructionAddu new.
//        instructions@83h := vm'instructions'InstructionSub new.
//        instructions@03h := vm'instructions'InstructionSubi new.
//        instructions@84h := vm'instructions'InstructionSbc new.
//        instructions@85h := vm'instructions'InstructionSubu new.
//        instructions@86h := vm'instructions'InstructionMul new.
//        instructions@88h := vm'instructions'InstructionDiv new.
//        instructions@59h := vm'instructions'InstructionBr new.
//        instructions@5Ah := vm'instructions'InstructionBl new.
//        instructions@91h := vm'instructions'InstructionOr new.
//        instructions@14h := vm'instructions'InstructionLi new.
//        instructions@15h := vm'instructions'InstructionLb new.
//        instructions@16h := vm'instructions'InstructionLw new.
//        instructions@17h := vm'instructions'InstructionSb new.
//        instructions@18h := vm'instructions'InstructionSw new.
//        instructions@9Bh := vm'instructions'InstructionCmp new.
//        instructions@1Bh := vm'instructions'InstructionCmpi new.
//        instructions@21h := vm'instructions'InstructionPush new.
//        instructions@22h := vm'instructions'InstructionPop new.
//        instructions@0Eh := vm'instructions'InstructionSli new.
//        instructions@0Fh := vm'instructions'InstructionSri new.
    ]
    
    #method loadProgram : aProgram
    [
        #var i := 0.
        #loop (i < aProgram length) ?
        [
            physicalMemory writeByte &address:i &byt:(aProgram@i). 
            i := i + 1.
        ].
    ]
    
    #method setRegister &register:aRegister &value:aValue
    [
        ((controlRegister and: UserMode) == 0)
            ? [ registersSupervisor@aRegister := aValue. ]
            ! [ registersUser@aRegister := aValue. ].
    ]
    
    #method getRegister : aRegister
    [
        ((controlRegister and: UserMode) == 0)
            ? [ ^registersSupervisor@aRegister. ]
            ! [ ^registersUser@aRegister. ].
    ]
    
    #method emulate
    [
        #loop (halted != true) ?
        [
            $self cpuTick.
        ].
    ]
    
    #method cpuTick
    [
        #var i := 0.
        //#var instruction := -1.
        #loop ((i < (speed / 100)) and: (halted != true))?
        [
            //instruction := $self fetchInstruction.
            //$self decodeInstruction:instruction.
            halted := $self decodeInstruction:($self fetchInstruction) not.
            i := i + 1.
        ].
    ]
    
    #method fetchInstruction
    [
        #var pc := $self getRegister:15.
        $self setRegister &register:15 &value:(pc + 4).
        ^($self getMemory readWord:pc).
        //^(physicalMemory readWord:pc).
    ]
    
    #method decodeInstruction : instruction
    [
        #var lRet := false.
        #var opcode := instruction and: 0FFh.
        #var inst := instructions@opcode.
        ($nil != inst)?
            [ 
                inst interpret &vm:($self).
                lRet := true.
            ].
        ^lRet.
    ]
    
    #method reset
    [
        #var i := 0.
        #loop (i < 16)?
        [
            $self setRegister &register:i &value:0.
            i := i + 1.
        ].
        halted := false.
    ]
    
    #method getMemory = physicalMemory.
    #method controlRegister = controlRegister.
}