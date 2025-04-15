// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

    @KBD
    D=M // Takes data from keyboard

    @i
    M=0

    @WHITEN // Goes to loop that whitens the screen, if KBD=0
    D;JEQ
    @BLACKEN // Goes to loop that blackens the screen, if KBD!=0
    D;JNE

(WHITEN)

    @i
    D=M
    @8192 // Number of words in the screen
    D=D-A
    @START // Goes to START if all the pixels have been whitened
    D;JGE

    @i
    D=M
    @SCREEN
    A=D+A
    M=0 // Whitens a word
    @i
    M=M+1
    @WHITEN
    0;JMP

(BLACKEN)

    @i
    D=M
    @8192 // Number of words in the screen
    D=D-A
    @START // Goes to START if all the pixels have been whitened
    D;JGE

    @i
    D=M
    @SCREEN
    A=D+A
    M=-1 // Blackens a word
    @i
    M=M+1
    @BLACKEN
    0;JMP

(START)
    @R0
    0;JMP // Jumps to the start, to do an infinite loop
