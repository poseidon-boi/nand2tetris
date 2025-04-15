#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "symbol_table.h"

/** Checks whether the entered file is of type .asm
 * @param filename The name of the file
 * @return 1 if file is of type .asm, 0 if not
 */
int is_valid_filetype(char* filename);

/** Adds the predefined symbols to the symbol table
 * @param root_ST The root node of the symbol table
 * @return The updated root node of the symbol table
 */
node* add_predefined_symbols(node* root_ST);

/** Adds the jump loacation symbols in the file to the symbol table
 * @param root_ST The root node of the symbol table
 * @param fp Pointer to the start of the file, in read mode
 * @return The updated root node of the symbol table.
 */
node* add_file_symbols(node* root_ST, FILE* fp);

/** Adds the dest symbols to the dest symbol table
 * @param root_destST The root node of the dest symbol table
 * @return The updated root node of the dest symbol table
 */
node* add_dest_symbols(node* root_destST);

/** Adds the jump symbols to the jump symbol table
 * @param root_jumpST The root node of the jump symbol table
 * @return The updated root node of the jump symbol table
 */
node* add_jump_symbols(node* root_jumpST);

/** Adds the comp symbols to the comp symbol table
 * @param root_compST The root node of the comp symbol table
 * @return The updated root node of the comp symbol table
 */
node* add_comp_symbols(node* root_compST);

/** Assembles the .asm file to the .hack file
 * @param asm_reader Reading file pointer to the .asm file
 * @param hack_writer Writing file pointer to the .hack file
 * @return 1 if assembled successfully, 0 otherwise
 */
int assemble_to_hack(FILE* asm_reader, FILE* hack_writer);

/** Removes the first newline character from the entered string
 *  (Intended to be used on fgets strings)
 * @param str The string to remove the newline character from
 */
void removenewline(char* str);

/** Converts the given integer to a binary number string with the specified
 *  length
 * @param num The number to convert
 * @param length The length of the specified binary number
 * @param str The character array to store the result in
 * @return 1 if successfully converted, 0 if not
 */
int convert_to_binary(int num, int length, char* str);

int main(int argc, char** argv) {

    if (argc == 1) {
        printf("No file entered\n");
        return EXIT_FAILURE;
    }
    if (argc > 2) {
        printf("Can assemble only one file at a time\n");
        return EXIT_FAILURE;
    }
    if (!is_valid_filetype(argv[1])) {
        printf("File must have extension .asm\n");
        return EXIT_FAILURE;
    }

    FILE *asm_reader = fopen(argv[1], "r");
    if (!asm_reader) {
        perror("Cannot open file");
        return EXIT_FAILURE;
    }
    // printf("File opened successfully!\n");

    // node* root_ST = NULL;
    // root_ST = add_predefined_symbols(root_ST);

    // root_ST = add_file_symbols(root_ST, asm_reader);
    // if (!root_ST)
    //     return EXIT_FAILURE;
    
    // rewind(asm_reader);

    char hack_filename[strlen(argv[1])+2];
    int i;
    for (i = 0; argv[1][i] != '.'; i++)
        hack_filename[i] = argv[1][i];
    hack_filename[i] = '.';
    hack_filename[i+1] = 'h';
    hack_filename[i+2] = 'a';
    hack_filename[i+3] = 'c';
    hack_filename[i+4] = 'k';
    hack_filename[i+5] = '\0';
    FILE* hack_writer = fopen(hack_filename, "w");

    int success = assemble_to_hack(asm_reader, hack_writer);
    if (fclose(hack_writer) != 0) {
        perror("Error occured while closing .hack file");
        return EXIT_FAILURE;
    }
    if (fclose(asm_reader) != 0) {
        perror("Error occured while closing .asm file");
        return EXIT_FAILURE;
    }
    if (!success)
        return EXIT_FAILURE;
    return EXIT_SUCCESS;
}

void removenewline(char* str) {
    for (int i=0; str[i] != '\0'; i++)
        if (str[i] == '\n' || str[i] == '\r') {
            str[i] = '\0';
            break;
        }
}

int convert_to_binary(int num, int length, char* str) {
    if (num < 0 || length <= 0)
        return 0;
    for (int i = 0; i < length; i++) {
        str[length-i-1] = (num % 2) + '0';
        num /= 2;
    }
    str[length] = '\0';
    if (num > 0)
        return 0;
    return 1;
}

int is_valid_filetype(char* filename) {
    int i;
    for (i = 0; filename[i] != '\0' && filename[i] != '.'; i++);
    if (filename[i] == '\0')
        return 0;
    char* filetype = ".asm";
    int j;
    for (j = 0; filetype[j] != '\0' && filename[i+j] != '\0'; j++) {
        if (filetype[j] != filename[i+j])
            return 0;
    }
    if (filetype[j] == filename[i+j])
        return 1;
    return 0;
}

node* add_predefined_symbols(node* root_ST) {
    root_ST = insert_ST(root_ST, "R7", 7);
    root_ST = insert_ST(root_ST, "R3", 3);
    root_ST = insert_ST(root_ST, "R1", 1);
    root_ST = insert_ST(root_ST, "R2", 2);
    root_ST = insert_ST(root_ST, "R5", 5);
    root_ST = insert_ST(root_ST, "R6", 6);
    root_ST = insert_ST(root_ST, "R4", 4);
    root_ST = insert_ST(root_ST, "R9", 9);
    root_ST = insert_ST(root_ST, "R8", 8);
    root_ST = insert_ST(root_ST, "R0", 0);
    root_ST = insert_ST(root_ST, "R13", 13);
    root_ST = insert_ST(root_ST, "R11", 11);
    root_ST = insert_ST(root_ST, "R10", 10);
    root_ST = insert_ST(root_ST, "R12", 12);
    root_ST = insert_ST(root_ST, "R14", 14);
    root_ST = insert_ST(root_ST, "R15", 15);
    root_ST = insert_ST(root_ST, "SCREEN", 16384);
    root_ST = insert_ST(root_ST, "KBD", 24576);
    root_ST = insert_ST(root_ST, "SP", 0);
    root_ST = insert_ST(root_ST, "LCL", 1);
    root_ST = insert_ST(root_ST, "ARG", 2);
    root_ST = insert_ST(root_ST, "THIS", 3);
    root_ST = insert_ST(root_ST, "THAT", 4);
    return root_ST;
}

node* add_file_symbols(node* root_ST, FILE* asm_reader) {
    
    int i, line_no_in_hack_file = 0;
    char line[1024];
    for (i = 0; fgets(line, 1024, asm_reader); i++) {

        // printf("%s", line);
        removenewline(line);
        int j;
        for (j = 0; line[j] == ' ' || line[j] == '\t'; j++);
        if (line[j] != '(') {
            if (line[j] == '\0')
                continue;
            if (line[j] != '/') {
                line_no_in_hack_file++;
                continue;
            }
            if (line[j+1] != '/') {
                printf("Syntax error in line %d: Expected a '/'\n", (i+1));
                return NULL;
            }
            continue;
        }
        char new_symbol[strlen(line)];
        int k;
        if (line[j+1] >= '0' && line[j+1] < '9') {
            printf("Syntax error in line %d: Symbol cannot start with a number",
                    (i+1));
        }
        for (k = 0; line[j+k+1] != ')' && line[j+k+1] != '\0'; k++) {
            if (line[j+k+1] == ' ' || line[j+k+1] == '\t') {
                printf("Syntax error in line %d: "
                       "Illegal whitespace, expected a ')'\n", (i+1));
                return NULL;
            }
            new_symbol[k] = line[j+k+1];
        }
        if (k == 0) {
            printf("Syntax error in line %d: No symbol defined\n", (i+1));
            return NULL;
        }
        if (line[j+k+1] == '\0') {
            printf("Syntax error in line %d: Expected a ')'\n", (i+1));
            return NULL;
        }
        new_symbol[k] = '\0';
        if (search_ST(root_ST, new_symbol) != -1) {
            printf("Syntax error in line %d: Same symbol defined twice\n",
                    (i+1));
            return NULL;
        }
        root_ST = insert_ST(root_ST, new_symbol, line_no_in_hack_file);
        // printf("%s:\t%d\n", new_symbol, line_no_in_hack_file);
    }
    return root_ST;
}

node* add_dest_symbols(node* root_destST) {
    root_destST = insert_ST(root_destST, "M", 1);
    root_destST = insert_ST(root_destST, "D", 2);
    root_destST = insert_ST(root_destST, "DM", 3);
    root_destST = insert_ST(root_destST, "MD", 3);
    root_destST = insert_ST(root_destST, "A", 4);
    root_destST = insert_ST(root_destST, "AM", 5);
    root_destST = insert_ST(root_destST, "MA", 5);
    root_destST = insert_ST(root_destST, "AD", 6);
    root_destST = insert_ST(root_destST, "DA", 6);
    root_destST = insert_ST(root_destST, "ADM", 7);
    root_destST = insert_ST(root_destST, "AMD", 7);
    root_destST = insert_ST(root_destST, "DAM", 7);
    root_destST = insert_ST(root_destST, "DMA", 7);
    root_destST = insert_ST(root_destST, "MAD", 7);
    root_destST = insert_ST(root_destST, "MDA", 7);
    return root_destST;
}

node* add_jump_symbols(node* root_jumpST) {
    root_jumpST = insert_ST(root_jumpST, "JGT", 1);
    root_jumpST = insert_ST(root_jumpST, "JEQ", 2);
    root_jumpST = insert_ST(root_jumpST, "JGE", 3);
    root_jumpST = insert_ST(root_jumpST, "JLT", 4);
    root_jumpST = insert_ST(root_jumpST, "JNE", 5);
    root_jumpST = insert_ST(root_jumpST, "JLE", 6);
    root_jumpST = insert_ST(root_jumpST, "JMP", 7);
    return root_jumpST;
}

node* add_comp_symbols(node* root_compST) {
    root_compST = insert_ST(root_compST, "0", 42);      //0101010
    root_compST = insert_ST(root_compST, "1", 63);      //0111111
    root_compST = insert_ST(root_compST, "-1", 58);     //0111010
    root_compST = insert_ST(root_compST, "D", 12);      //0001100
    root_compST = insert_ST(root_compST, "A", 48);      //0110000
    root_compST = insert_ST(root_compST, "M", 112);     //1110000
    root_compST = insert_ST(root_compST, "!D", 13);     //0001101
    root_compST = insert_ST(root_compST, "!A", 49);     //0110001
    root_compST = insert_ST(root_compST, "!M", 113);    //1110001
    root_compST = insert_ST(root_compST, "-D", 15);     //0001111
    root_compST = insert_ST(root_compST, "-A", 51);     //0110011
    root_compST = insert_ST(root_compST, "-M", 115);    //1110011
    root_compST = insert_ST(root_compST, "D+1", 31);    //0011111
    root_compST = insert_ST(root_compST, "A+1", 55);    //0110111
    root_compST = insert_ST(root_compST, "M+1", 119);   //1110111
    root_compST = insert_ST(root_compST, "D-1", 14);    //0001110
    root_compST = insert_ST(root_compST, "A-1", 50);    //0110010
    root_compST = insert_ST(root_compST, "M-1", 114);   //1110010
    root_compST = insert_ST(root_compST, "D+A", 2);     //0000010
    root_compST = insert_ST(root_compST, "D+M", 66);    //1000010
    root_compST = insert_ST(root_compST, "D-A", 19);    //0010011
    root_compST = insert_ST(root_compST, "D-M", 83);    //1010011
    root_compST = insert_ST(root_compST, "A-D", 7);     //0000111
    root_compST = insert_ST(root_compST, "M-D", 71);    //1000111
    root_compST = insert_ST(root_compST, "D&A", 0);     //0000000
    root_compST = insert_ST(root_compST, "D&M", 64);    //1000000
    root_compST = insert_ST(root_compST, "D|A", 21);    //0010101
    root_compST = insert_ST(root_compST, "D|M", 85);    //1010101
    return root_compST;
}

int assemble_to_hack(FILE* asm_reader, FILE* hack_writer) {

    node* root_ST, *root_jumpST, *root_compST, *root_destST;
    root_ST = root_jumpST = root_compST = root_destST = NULL;
    root_ST = add_predefined_symbols(root_ST);
    root_ST = add_file_symbols(root_ST, asm_reader);
    if (!root_ST)
        return 0;
    rewind(asm_reader);
    root_destST = add_dest_symbols(root_destST);
    root_jumpST = add_jump_symbols(root_jumpST);
    root_compST = add_comp_symbols(root_compST);
    // print_ST(root_ST);
    // print_tree(root_ST, 0);
    // print_tree(root_jumpST, 0);
    // print_tree(root_compST, 0);
    // print_tree(root_destST, 0);
    // printf("%d\n", depth_tree(root_ST, 0));

    int i, current_variable = 16;
    char line[1024];
    // for (int iter = 0; iter < 5; iter++) {
    //     for (i = 0; success || (i==0); i++) {
    //         success = fgets(line, 1024, asm_reader);
    //         printf("%s", line);
    //     }
    //     rewind(asm_reader);
    // }
    // printf("Reached actual assembler\n");
    for (i = 0; fgets(line, 1024, asm_reader); i++) {

        // printf("%d\t%s", i, line);
        removenewline(line);
        int j = 0;
        for (j = 0; line[j] == ' ' || line[j] == '\t'; j++);

        if (line[j] == '/' || line[j] == '\0' || line[j] == '(')
            continue;
        
        if (line[j] == '@') {

            j++;
            fprintf(hack_writer, "0");
            int num = 0;
            char binary_num[16];

            if (line[j] >= '0' && line[j] <= '9') {

                for (; line[j] >= '0' && line[j] <= '9'; j++)
                    num = num * 10 + (line[j] - '0');

                if (line[j] == ' ' || line[j] == '\t' || line[j] == '\0') {
                    int conv_success = convert_to_binary(num, 15, binary_num);
                    if (!conv_success) {
                        printf("Error at line %d: Number too large\n", (i+1));
                        // printf("Number: %d\tBinary: %s\n", num, binary_num);
                        return 0;
                    } // else {
                        // printf("Number: %d\tBinary: %s\n", num, binary_num);
                    // }

                    for (; line[j] == ' ' || line[j] == '\t'; j++);
                    if (line[j] == '\0') {
                        fprintf(hack_writer, "%s\n", binary_num);
                        continue;
                    }

                    if (line[j] == '/') {
                        if (line[j+1] == '/') {
                            fprintf(hack_writer, "%s\n", binary_num);
                            continue;
                        }
                        printf("Syntax error at line %d: Expected a '/'",(i+1));
                        return 0;
                    }
                    printf("Syntax error at line %d: Unexpected symbol %c\n",
                    (i+1), line[j]);
                    return 0;
                }

                printf("Syntax error at line %d: Unexpected symbol %c\n",
                (i+1), line[j]);
                return 0;
            }

            char new_symbol[strlen(line)];
            int k = 0;
            for (; line[j+k]!=' ' && line[j+k]!='\0' && line[j+k]!='\t'; k++) {
                switch (line[j+k]) {
                case '@':
                case '=':
                case ';':
                case '+':
                case '-':
                case '&':
                case '|':
                case '!':
                    printf("Syntax error: Line %d: %c not allowed in symbol\n",
                    (i+1), line[j+k]);
                    return 0;
                default:
                    new_symbol[k] = line[j+k];
                    // printf("%c", new_symbol[k]);
                }
            }
            new_symbol[k] = '\0';
            // printf("%s\n", new_symbol);
            for (; line[j+k] == ' ' || line[j+k] == '\t'; k++);

            if (line[j+k] == '\0') {
                if ((num = search_ST(root_ST, new_symbol)) == -1) {
                    if (search_ST(root_destST, new_symbol) != -1 ||
                        search_ST(root_compST, new_symbol) != -1 ||
                        search_ST(root_jumpST, new_symbol) != -1) {
                            printf("Syntax error: Line %d: Illegal symbol",
                            (i+1));
                            return 0;
                        }
                    num = current_variable++;
                    root_ST = insert_ST(root_ST, new_symbol, num);
                }
                convert_to_binary(num, 15, binary_num);
                // printf("%s\n", new_symbol);
                // for (int l = 0; new_symbol[l] != '\0'; l++) {
                //     printf("%d ", new_symbol[l]);
                // }
                // printf("\n");
                fprintf(hack_writer, "%s\n", binary_num);
                // printf("%s\n", binary_num);
                continue;
            }

            if (line[j+k] != '/') {
                printf("Syntax error at line %d: Unexpected symbol %c\n",
                (i+1), line[j+k]);
                return 0;
            }
            if (line[j+k+1] != '/') {
                printf("Syntax error at line %d: Unexpected symbol %c\n",
                (i+1), line[j+k+1]);
                return 0;
            }
        }

        fprintf(hack_writer, "111");
        int has_dest = 0, has_jump = 0, k;
        for (k = 0; line[j+k]!=' ' && line[j+k]!='\t' && line[j+k]!='\0'; k++) {
            if (line[j+k] == '=') {
                if (!has_dest) {
                    has_dest = 1;
                } else {
                    printf("Syntax error at line %d: Unexpected '='\n", (i+1));
                    return 0;
                }
            }

            if (line[j+k] == ';') {
                if (!has_jump) {
                    has_jump = 1;
                } else {
                    printf("Syntax error at line %d: Unexpected ';'\n", (i+1));
                    return 0;
                }
            }
        }
        int line_len = k;

        for (; line[j+k] == ' ' || line[j+k] == '\t'; k++);
        if (line[j+k] != '/' && line[j+k] != '\0') {
            printf("Syntax error at line %d: Unexpected symbol %c\n", (i+1));
            return 0;
        }
        if (line[j+k] == '/') {
            if (line[j+k+1] != '/') {
                printf("Syntax error at line %d: Expected a '/'", (i+1));
                return 0;
            }
        }

        k = 0;
        int dest_num = 0, jump_num = 0, comp_num = 0;
        char dest_bin[4], jump_bin[4], comp_bin[8];
        if (has_dest) {
            char dest_str[4];
            for (; k < 3 && line[j+k] != '='; k++)
                dest_str[k] = line[j+k];
            if (line[j+k] != '=') {
                printf("Syntax error at line %d: Invalid dest symbol\n", (i+1));
                return 0;
            }
            dest_str[k] = '\0';
            dest_num = search_ST(root_destST, dest_str);
            if (dest_num == -1) {
                printf("Syntax error at line %d: Invalid dest symbol %s\n",
                (i+1), dest_str);
                return 0;
            } else {
                convert_to_binary(dest_num, 3, dest_bin);
                // printf("Deststr:%s Len:%d Num:%d\n", dest_str,
                // strlen(dest_str), dest_num);
            }
            k++;
        } else {
            convert_to_binary(0, 3, dest_bin);
        }

        int dest_len = k;
        k = 0;
        char comp_str[4];
        for (; k < 3 && line[j+k+dest_len] != '\0' && 
             line[j+k+dest_len] != ';'; k++)
            comp_str[k] = line[j+k+dest_len];
        comp_str[k] = '\0';
        if ((comp_num = search_ST(root_compST, comp_str)) == -1) {
            printf("Syntax error: Line %d: Invalid comp symbol %s\n", (i+1),
            comp_str);
            return 0;
        }
        convert_to_binary(comp_num, 7, comp_bin);
        
        if (has_jump) {
            int comp_len = k, jump_start = j+dest_len+comp_len+1;
            k = 0;
            char jump_str[4];
            for (; k < 3 && line[jump_start+k] != '\0'; k++) {
                if (line[jump_start+k] == ' ' || line[jump_start+k] == '\t')
                    break;
                jump_str[k] = line[jump_start+k];
            }
            jump_str[k] = '\0';
            if ((jump_num = search_ST(root_jumpST, jump_str)) == -1) {
                printf("Syntax error: Line %d: Invalid jump symbol %s\n",
                (i+1), jump_str);
                return 0;
            }
            convert_to_binary(jump_num, 3, jump_bin);
        } else {
            convert_to_binary(0, 3, jump_bin);
        }
        fprintf(hack_writer, "%s%s%s\n", comp_bin, dest_bin, jump_bin);
        // printf("Comp:%s\nDest:%s\nJump:%s\n", comp_bin, dest_bin, jump_bin);
    }
    // print_ST(root_ST);
    // printf("Depth: %d\n", depth_tree(root_ST, 1));
    return 1;
}