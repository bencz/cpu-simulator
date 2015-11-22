#class TokenIntLiteral
{
    #field line.
    #field value.
    
    #constructor new &value:aVal &line:aLine
    [
        line := aLine.
        value := aVal.
    ]
    
    #method literal
    [
        ^(value literal).
    ]
    
    #method getValue = value.
}