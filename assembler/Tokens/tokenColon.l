#class TokenColon
{
    #field line.
    
    #constructor new &line:aLine
    [
        line := aLine.
    ]
    
    #method literal
    [
        ^(":").
    ]
}