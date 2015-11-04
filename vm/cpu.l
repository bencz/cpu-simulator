#import system.
#import system'routines.
#import system'collections.
#import extensions.

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
    
    #method emulate
    [
        #loop (halted != true) ?
        [
            halted := true.
            $self cpuTick.
        ].
    ]
    
    #method cpuTick
    [
        #var i := 0.
        #loop (i < (speed / 100))?
        [
            i := i + 1.
        ].
    ]
}