#import system.
#import system'routines.
#import system'collections.
#import extensions.

#symbol(const, type:int) R_PC = 0.

#class Cpu
{
    #field memory.
    #field registers.
    #field halted.
    #field speed.
    #field instructions.
    
    #constructor new
    [
        memory := vm'Memory new &size:500.
        registers := vm'Registers new &numberOfRegisters:10.
        instructions := Dictionary new.
        
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
            memory writeByte &address:i &bt:(aProgram@i). 
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