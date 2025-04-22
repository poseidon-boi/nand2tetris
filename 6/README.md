# Hack Assembler

## hack_assembler

The compiled binary for the hack assembler.
To use this, enter into a shell the following command:

```
./hack_assembler <hack_assembly_filename>.asm
```

## hack_assembler.c

The hack assembler implementation, written in C. To build the hack assembler, run the following command in a shell:

For GCC:

```
gcc -o hack_assembler.out hack_assembler.c symbol_table.o
```

For CLANG:

```
clang -o hack_assembler.out hack_assembler.c symbol_table.o
```

## symbol_table.o

An object file compiled from symbol_table.c, used by the linker to build the final hack assembler

## symbol_table.c

Contains a standard symbol table implementation using a binary tree, which is then used in the assembler for various things

## symbol_table.h

Header file for the functions and macros in symbol_table.c

## symbol_table.out

Binary which can be run to test the symbol table implementation, compiled from symbol_table.c. It tests using the main function in symbol_table.c (which is currently commented out).

Run command:

```
./symbol_table.out
```

## hack_assembler.s

Contains the compiled hack_assembler.c as assembly code. This was just created for fun.
