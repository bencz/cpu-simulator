#import system.

#symbol(const,type:int) NOP  = 00h.
#symbol(const,type:int) MOV  = 01h.

// Logical operators
#symbol(const,type:int) AND  = 02h.
#symbol(const,type:int) OR   = 03h.
#symbol(const,type:int) NOT  = 04h.
#symbol(const,type:int) NAND = 05h.
#symbol(const,type:int) NOR  = 06h.
#symbol(const,type:int) XOR  = 07h.
#symbol(const,type:int) XNOR = 08h.
#symbol(const,type:int) NEG  = 09h.
#symbol(const,type:int) SHIFT= 0Ah.

// Arithmetic operators
#symbol(const,type:int) ADD  = 0Bh.
#symbol(const,type:int) SUB  = 0Ch.
#symbol(const,type:int) DIV  = 0Dh.
#symbol(const,type:int) MUL  = 0Eh.

// Arithmetic operators with signal
#symbol(const,type:int) SADD = 0Fh.
#symbol(const,type:int) SSUB = 10h.
#symbol(const,type:int) SDIV = 11h.
#symbol(const,type:int) SMUL = 12h.

// Others....
#symbol(const,type:int) CMP  = 13h.
#symbol(const,type:int) JMP  = 14h.

#class InvalidOpcodeException :: Exception
{
    #constructor new &message:aMessage
        <= %new &literal:(aMessage literal) &subject: %OPError.
}