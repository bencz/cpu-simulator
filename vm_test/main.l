#import system.
#import system'io.

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
    #var mem := vm'MemoryPhysical new.
    #loop (br available) ?
    [
        br read &vbyte:byte.
        mem writeByte:i:byte.
        i := i + 1.
    ].
    br close.
    
    #var coisa := mem readWord:0.
    mem writeWord:0:0000ffbfh.
    console writeLine:(mem readWord:70).

].