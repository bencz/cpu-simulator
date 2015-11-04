#import system.
#import system'io.
#import system'collections.

#symbol $loadBytes = aProgram 
[
    #var i := 0.
    #var(type:vbyte) byte := 0.
    #var br := BinaryFileReader new &path:aProgram.   
    #var bta := List new.
    #loop (br available) ?
    [
        br read &vbyte:byte.
        bta += byte.
        i := i + 1.
    ].
    br close.  
    ^bta. 
].

#symbol program =
[      
    #var cpu := vm'Cpu new.
    cpu loadProgram : ($loadBytes:"test.bin").
    cpu emulate.
].