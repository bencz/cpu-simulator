#class TokenStringLiteral
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
        ^(value).
    ]
}