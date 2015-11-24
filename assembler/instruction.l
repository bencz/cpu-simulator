#import system.

#symbol(const,type:int)TY_Label       = 0.
#symbol(const,type:int)TY_Instruction = 1.

#class(extension) TypeInstruction
{
    #method Label = TY_Label.
    #method Instruction = TY_Instruction.
}

#class Instruction
{
    #field name.
    #field operands.
    #field line.
    #field type.
    
    #constructor new &line:aLine &name:aName &operands:aOperands
    [
        line := aLine.
        name := aName.
        operands := aOperands.
        type := assembler'TypeInstruction Instruction.
    ]
    
    #method Name = name.
    #method Line = line.
    #method Operands = operands.
    #method Type = type.
}

#class CpuInstruction
{
    #field address.
    #field symbol.
    
    #field opcode.
    #field reg1.
    #field reg2.
    #field immediate.
    #field immediateIsRegister.
    #field operandIsConditionCode.
    #field relative.
    
    #method init
    [
        opcode := ByteNumber new.
        reg1 := ByteNumber new.
        reg2 := ByteNumber new.
        immediate := ByteArray new &length:4.       
        immediateIsRegister := false.
        operandIsConditionCode := false.
        relative := false.
    ]
    
    #constructor new &opcode:aOpcode &cpuRegister:aRegister
    [
        $self init.
        opcode := aOpcode byte.
        reg1 := aRegister byte.
    ]
    
    #constructor new &opcode:aOpcode &regList:aRegisterList
    [
        $self init.
        opcode := aOpcode byte.
        immediate := aRegisterList.
    ]    
    
    #constructor new &opcode:aOpcode &cpuReg1:aReg1 &cpuReg2:aReg2
    [
        $self init.
        opcode := aOpcode byte.
        reg1 := aReg1 byte.
        reg2 := aReg2 byte.
    ]
    
    #constructor new &opcode:aOpcode &cpuReg1:aReg1 &cpuReg2:aReg2 &cpuReg3:aReg3
    [
        $self init.
        opcode := aOpcode byte.
        reg1 := aReg1 byte.
        reg2 := aReg2 byte.
        immediate := aReg3 short.
        immediateIsRegister := true.
    ]
    
    #constructor new &opcode:aOpcode &cpuReg1:aReg1 &cpuReg2:aReg2 &imm:aImm
    [
        $self init.
        opcode := aOpcode byte.
        reg1 := aReg1 byte.
        reg2 := aReg2 byte.
        immediate := aImm short.
    ]
    
    #constructor new &opcode:aOpcode &cpuReg1:aReg1 &cpuReg2:aReg2 &strImm:aImm
    [
        $self init.
        opcode := aOpcode byte.
        reg1 := aReg1 byte.
        reg2 := aReg2 byte.
        symbol := aImm literal.
    ]
    
    #constructor new &opcode:aOpcode &cpuReg1:aReg1 &imm:aImm
    [
        $self init.
        opcode := aOpcode byte.
        reg1 := aReg1 byte.
        immediate := aImm short.
    ]
    
    #constructor new &opcode:aOpcode &cpuReg1:aReg1 &strImm:aImm
    [
        $self init.
        opcode := aOpcode byte.
        reg1 := aReg1 byte.
        symbol := aImm.
    ]
    
    #constructor new &opcode:aOpcode &conditionCode:code &sym:aSym &relative:aRelative
    [
        $self init.
        opcode := aOpcode byte.
        reg1 := code byte.
        symbol := aSym.
        operandIsConditionCode := true.
        relative := relative.
    ]
    
    #method resolveSymbol &sym:aSym &address:aAddr
    [
        (symbol == aSym)
        ? [
            (relative == true)
                ? [ immediate := ((aAddr short) - ((address short)+4)). ]
                ! [ immediate := aAddr. ].
          ]
        ! [ ^false. ].
    ]
    
    #method toMachineCode
    [
        #var final := opcode int.
        (immediateIsRegister == true)
            ? [ final := final or: 080h. ].
        (operandIsConditionCode == true)
            ? [ final := final or: 040h. ].
            
        final := final or: ((reg1 int) shift &index:(-8)).
        final := final or: ((reg2 int) shift &index:(-12)).
        final := final or: (immediate   shift &index:(-16)).
        ^final.
    ]
    
    #method setPosition : addr
    [
        address := addr.
    ]
    
    #method writeData : stream
    [
    ]
    
    #method GetLength = 4.
    
    #method Address = address.
    #method Address : aAddress [ address := aAddress. ]
    
    #method Symbol = symbol.
}