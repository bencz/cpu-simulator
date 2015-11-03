#import system.
#import system'io.
#import system'routines.
#import system'collections.
#import extensions.

#class MemoryBlock
{
    #field memory.
    #constructor new
    [
        memory := ByteArray new &int:1000h.
    ]
    
    #method getAt : anIndex
    [
        ^memory@(anIndex and: 0FFFh).
    ]
    
    #method setAt : anIndex : anObject
    [
        memory@(anIndex and: 0FFFh) := anObject.
    ]
}

#class MemoryPhysical
{
    #field allocatedMemory.
    #field wordReg.
    
    #constructor new
    [
        allocatedMemory := Dictionary new.
        wordReg := ByteArray new &int:4.
    ]
    
    #method writeWord : address : word
    [
    ]
    
    #method readWord : address
    [
        $self readBytes &buffer:wordReg &start:address &offset:0 &size:4.
        $self test_c.
    ]
    
    #method test_c
    [
        #var wr := ByteArray new &int:4.
        wr@0 := 14h.
        wr@1 := 0Eh.
        wr@2 := 0FFh.
        wr@3 := 0FFh.
        
        #var rtl := 0l.
        #var i := 3.
        #loop (i >= 0) ?
        [
            rtl := rtl shift &index:(-1*(4*i)).
            rtl := rtl or: (wr@i).
            i := i - 1.
        ].
        ^rtl. 
    ]
   
    #method writeByte : address : byte
    [
        #var block := address and: 0FFFFF000h.
        #var blk := allocatedMemory@block.
        ($nil == blk) 
            ? [ allocatedMemory@block := MemoryBlock new. ].
        (allocatedMemory@block)@address := byte.
    ]
    
    #method readByte : address
    [
        #var block := address and: 0FFFFF000h.
        #var blk := allocatedMemory@block.
        ($nil == blk) ? [ ^0FFh. ].
        ^(allocatedMemory@block)@address.
    ]
    
    #method readBytes &buffer:aBuf &start:aStart &offset:aOffset &size:aSize
    [
        #var i := 0.
        #loop (i<aSize) ?
        [
            aBuf@i := $self readByte:(aStart+i).
            i := i+1.
        ].
    ]

    #method writeBytes &buffer:aBuf &start:aStart &offset:aOffset &size:aSize
    [
        #var i := 0.
        #loop (i<aSize) ?
        [
            $self writeByte:(aStart + i):(aBuf@i).
            i := i+1.
        ].
    ]
}

#symbol program =
[
    /*#var stack := Stack new &size:300.
    stack push &value:10.
    stack push &value:300.
    stack pop.
    #var tmp := 0.
    stack pop &ref:tmp.
    
    #var cpu := vm'Cpu new.
    cpu loadProgram : "1000010002".
    cpu emulate.*/
    
    #var i := 0.
    #var(type:vbyte) byte := 0.
    #var br := BinaryFileReader new &path:"test.bin".   
    #var mem := MemoryPhysical new.
    #loop (br available) ?
    [
        br read &vbyte:byte.
        mem writeByte:i:byte.
        i := i + 1.
    ].
    br close.
    
    #var coisa := mem readWord:0.
].