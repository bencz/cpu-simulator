#import system.
#import system'routines.
#import system'collections.
#import extensions.

#class Cpu
{
    #field memory.
    #field registers.
    #field halted.
    #field speed.
    #field instructions.
    
    #constructor new &program:aProgram
    [
        memory := Memory new &size:500.
        registers := Registers new &numberOfRegisters:10.
        instructions := Dictionary new.
        
        halted := false.
        speed := 100000.
        
        // Test code...
        $self setOpcodes.      
        instructions getAt &key:05 interpret &instruction:05 &vm:05 &memory:05.
    ]
    
    #method setOpcodes
    [
        instructions insert &key:0 &object:(InstructionXor new).
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
        #loop (i < (speed / 100))?
        [
            i := i + 1.
        ].
    ]
}

#class Memory
{
    #field size.
    #field memoryBlock.
    
    #constructor new &size:aSize
    [
        memoryBlock := ArrayList new.
        size := aSize.
        #var i := 0.
        #loop (i < aSize) ? [ memoryBlock += 0. i := i + 1. ].
    ]
    
    #method readWord &address:addr
    [
        (addr < size) ?
            [ ^memoryBlock getAt:addr. ]
    ]
    
    #method writeWord &address:addr &word:aWord 
    [
        (addr < size) ?
            [ memoryBlock insert:aWord &at:addr. ]
    ]
    
    #method readByte &address:addr []
    #method writeByte &address:addr &byte:aByte []
    
    #method readBytes[]
    #method writeBytes &address:addr &bytes:aBytes []
}

#class Registers
{
    #field register.
    
    #constructor new &numberOfRegisters:nRegisters
    [
        #var i := 0.
        register := List new.
        #loop (i < nRegisters) ? 
            [ 
                register append:(Memory new &size:32).
                i := i + 1.
            ].
    ]
    
    #method read []
    #method write []
}

#class InstructionXor
{
    #constructor new []
    
    #method interpret &instruction:aInstruction &vm:aVm &memory:aMemory
    [
        console writeLine:"Processou o XOR!!".
    ]
}

#class Stack
{
    #field size.
    #field memory.
    #field topStack.
    
    #constructor new &size:aSize
    [
        memory := Memory new &size:aSize.
        size := aSize.
        topStack := -1.
    ]
    
    #method pop
    [
        (topStack > 0) ? 
            [ topStack := topStack - 1. ].
    ]
    
    #method pop &ref:aDest
    [
        (topStack >= 0) ? 
            [ 
                aDest << memory readWord &address:topStack.
                topStack := topStack - 1.
            ].
    ]
    
    #method push &value:aValue
    [
        (topStack < size) ?
            [ 
                topStack := topStack + 1.
                memory writeWord &address:topStack &word:aValue.
            ].
    ]
}

#symbol program =
[
    #var stack := Stack new &size:300.
    stack push &value:10.
    stack push &value:300.
    stack pop.
    #var tmp := 0.
    stack pop &ref:tmp.
    
    //#var cpu := Cpu new &program:"00010203040506".
    //cpu emulate.
].