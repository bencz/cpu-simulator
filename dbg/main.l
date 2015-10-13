#import system.
#import forms.
#import extensions.

#class Window
{
    #field form.
    
    #constructor new
    [
        form := SDIDialog new.
        
        form set &caption:"CPU-Simulator -- Debugger".
        form set &x:100 &y:100.
        form set &width:800 &height:600.
    ]
}