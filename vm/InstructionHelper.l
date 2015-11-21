#import system.

#class InstructionHelper
{
    #constructor new []
    
    #method decodeInstruction &instruction:aIns &ref:aReg1 &ref:aReg2 &ref:aReg3
    [
        aReg1 << (aIns shift &index:08) and: 00Fh.
        aReg2 << (aIns shift &index:12) and: 00Fh.
        aReg3 << (aIns shift &index:16) and: 00Fh.
    ]
    
    #method decodeInstruction &instruction:aIns &ref:aReg
    [
    ]
    
    #method decodeInstruction &instruction:aIns &vshort:aReg
    [
        aReg << 1.
    ]
}