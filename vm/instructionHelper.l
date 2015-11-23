#import system.
#import system'collections.
#import extensions.

#class(extension) InstructionHelper
{
    //constructor new []
    
    #method decodeInstruction &instruction:aIns
    [
        #var ret := Array new &length:3.
        ret@0 := (aIns shift &index:08) and: 00Fh.
        ret@1 := (aIns shift &index:12) and: 00Fh.
        ret@2 := (aIns shift &index:16) and: 00Fh.
        ^ret.
    ]
    
    #method decodeInstruction &instruction:aIns &ref:aReg
    [
    ]
    
    #method decodeInstruction &instruction:aIns &vshort:aReg
    [
        aReg << 1.
    ]
    
    #method decondeInstructionDataShort &instruction:aIns
    [
        #var ret := Array new &length:2.
        ret@0 := ((aIns shift &index:08) and: 00Fh).
        ret@1 := ((aIns shift &index:16) and: 0FFFFh).
        ^ret.
    ]
}