// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

    @R0
    D=M
    @n // The multiplier
    M=D

    @R2 // Sets result to 0
    M=0

    @i // Iteration variable
    M=0


(LOOP)

    // Ends if i-n >= 0
    @i
    D=M
    @n
    D=D-M
    @END
    D;JGE

    // Adds R1 to R2
    @R1
    D=M
    @R2
    M=D+M

    // Moves to next iteration
    @i
    M=M+1
    @LOOP
    0;JMP

(END)
    @END
    0;JMP
