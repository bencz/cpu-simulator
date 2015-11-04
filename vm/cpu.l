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
        instructions@00h := vm'instructions'InstructionAdd new.
        instructions@01h := vm'instructions'InstructionXor new.
        instructions@02h := vm'instructions'InstructionCc new.
        instructions@14h := vm'instructions'InstructionCc new.
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
        ^(physicalMemory readWord:pc).
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
}