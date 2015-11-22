#import system.
#import system'routines.
#import system'io.
#import extensions.

#symbol program =
[
    #var source := $nil.
    #var output := $nil.
    
    #var i := 1.
    #var arg := $nil.
    #loop (i < 'program'arguments length)?
    [
        arg := 'program'arguments@i.
        (arg == "-o")
            ? [ 
                i := i + 1. 
                output := 'program'arguments@i. 
              ]
            ! [ source := 'program'arguments@i. ].
        i := i + 1.
    ].

    #var lexer := assembler'Lexer new &sourceFile:source.
    lexer scan.
    
    (lexer getList) run &each: element
    [
        #var tt := element.
    ].
].