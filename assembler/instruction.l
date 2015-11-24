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