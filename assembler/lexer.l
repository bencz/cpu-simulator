#import system.
#import system'routines.
#import system'collections.
#import system'io.
#define extensions.
#define extensions'routines.
#define extensions'text.

#symbol(const,type:int) LF  = 0Ah.
#symbol(const,type:int) TAB = 09h.
#symbol(const,type:int) SPACE = 20h.

#symbol $readAllText = aProgram 
[
    #var bta := List new.
    File new &path:(aProgram) run &eachLine: aLine
    [
        aLine run &each: aChar
        [
            bta += aChar.
        ].
    ].
    ^bta. 
].

#symbol $isWhiteSpace = ch
[
    #var c := ch toInt.
    ^((c == SPACE) or: (c == TAB)).
].

#symbol $isDigit = ch
[
    #var c := ch toInt.
    ^((c >= 30h) and: (c <= 39h)).
].

#symbol $isLetter = ch
[
    #var c := ch toInt.
    ^(((c >= 41h) and: (c <= 5Ah)) or: ((c >= 61h) and: (c <= 7Ah))).
].

#class Lexer
{
    #field lineNumber.
    #field sourceFile.
    #field position.
    #field tokenList.
    
    #constructor new &sourceFile:aSource
    [
        sourceFile := aSource.
        position := 0.
        lineNumber := 0.
        tokenList := List new.
    ]
    
    #method scan
    [
        #var skipThis := false.
        sourceFile := $readAllText:sourceFile.
        #loop (position < sourceFile length)?
        [
            #loop (($self peekChar != LF) and: ($isWhiteSpace:($self peekChar)))
                ? [ $self readChar. ].
         
            skipThis := false.   
                    
            (($self peekChar toInt) == LF) ?
            [
                #loop (($self peekChar toInt) == LF)?
                [
                    $self readChar.
                    lineNumber := lineNumber + 1.
                ].
                skipThis := true.
            ].
                   
            ((skipThis == false) and: ($isDigit:($self peekChar)))?
            [
                $self scanIntLiteral.
                skipThis := true.
            ].
            
            ((skipThis == false) and: (($self peekChar toInt) == 022h)) ? // 0x22 == '\"'
            [
                skipThis := true.
            ].
            
            ((skipThis == false) and: (($self peekChar toInt) == 03Bh)) ? // 0x3B == ';'
            [
                #loop (($self peekChar toInt) != LF) ? [ $self readChar. ]. 
                skipThis := true.
            ].
            
            ((skipThis == false) and: ($isLetter:($self peekChar)) or: (($self peekChar toInt) == 2Eh)) ? // 0x2E == '.'
            [
                skipThis := true.
            ].
            
            (skipThis == false) ?
            [
                /*($self peekChar) =>
                    "%" ? []
                    "@" ? []
                    "," ? []
                    "#" ? []
                    ":" ? [].*/
            ].
            $self readChar.
        ].
    ]
    
    #method peekChar
    [
        ^($self peekChar:0).
    ]
    
    #method peekChar : pos
    [
        #var ret := -1.
        ((pos + position) < sourceFile length)
           ? [ ret := sourceFile@(pos + position) /*toInt*/. ].
        ^ret.
    ]
    
    #method readChar
    [
        #var ret := -1.
        (position < sourceFile length)
            ? [ ret := sourceFile@(position). position := position + 1. ].
        ^ret.        
    ]
    
    #method scanIntLiteral
    [
        #var v1 := $self peekChar:0.
        #var v2 := $self peekChar:1.
        
        ((v1 literal == "0") and: (v2 literal == "x"))
            ? [ ^($self scanHexNumber). ]
            ! [
                #var accum := "".
                accum := accum + ($self readChar) literal.
                #loop ($isDigit:($self peekChar))?
                [
                    accum := accum + ($self readChar) literal.
                ].
              ].
        
    ]
    
    #method scanHexNumber
    [
        // skip the 0x
        $self readChar.
        $self readChar.
        
        #var accum := "".
        #var hexAlpha := "abcdefABCDEF".
        accum := accum + ($self readChar) literal. 
        #loop (($isDigit:($self peekChar)) or: (hexAlpha containing:($self peekChar)))?
        [
            accum := accum + ($self readChar) literal.
        ].
    ]
}