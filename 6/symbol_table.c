#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_SYMBOL_SIZE 1024

/** A node of the symbol table
 * @param symbol
 * @param translation
 * @param left
 * @param right
 */
typedef struct node {
    /** The symbol stored in the node */
    char* symbol;
    /** The translated value of the symbol */
    int value;
    /** The left child current node */
    struct node* left;
    /** The right child of the current node */
    struct node* right;
} node;

/** Inserts a new symbol into the symbol table, if it does not already exist
 * @param root The root node of the symbol table
 * @param symbol The symbol in the node
 * @param value The translated value of the symbol
 */
node* insert_ST(node* root, char* symbol, int value);

/** Prints the symbol table
 * @param root The root node of the symbol table
 */
void print_ST(node* root);

/** Searches for the entered key in the symbol table
 * @param root The root node of the symbol table
 * @param symbol The symbol to search for
 * @return The translation of the symbol, returns -1 if not found
 */
int search_ST(node* root, char* symbol);

/** Prints the tree stored by the symbol table
 * (This function is to understand how well the BST is working)
 * @param root The root node of the tree
 * @param curdepth The current depth of the root
 */
void print_tree(node* root, int curdepth);

/** Returns the max depth of the tree
 *  (This function is to understand how well the BST is working)
 * @param root The root of the tree
 * @param curdepth The current depth of the root
 */
int depth_tree(node* root, int curdepth);

// int main() {
//     printf("1. Insert symbol value pair\n"
//         "2. Print tree\n"
//         "3. Print symbol table\n"
//         "4. Search value of symbol\n"
//         "5. Exit\n");
//     node* root = NULL;
//     // root = insert_ST(root, "R3", 3);
//     // root = insert_ST(root, "R2", 2);
//     // root = insert_ST(root, "R0", 0);
//     // root = insert_ST(root, "R10", 10);
//     // root = insert_ST(root, "R1", 1);
//     // root = insert_ST(root, "R5", 5);
//     // root = insert_ST(root, "R7", 7);
//     // root = insert_ST(root, "R6", 6);
//     // printf("Tree:\n");
//     // print_tree(root, 0);
//     // printf("Table:\n");
//     // print_ST(root);
//     while (1) {
//         int ch, input_value, translated_value = 0;
//         char symbol[MAX_SYMBOL_SIZE];
//         printf("Enter choice: ");
//         if (!scanf("%d", &ch)) {
//             int c;
//             while ((c = getchar()) != '\n' && c != EOF);
//             ch = 6;
//         }
//         switch (ch)
//         {
//         case 1:
//             printf("Enter symbol and value: ");
//             if (!scanf("%1024s", &symbol)) {
//                 int c;
//                 while ((c = getchar()) != '\n' && c != EOF);
//                 printf("Failed to get symbol\n");
//                 break;
//             }
//             printf("Symbol: %s\n", symbol);
//             if (!scanf("%d", &input_value)) {
//                 int c;
//                 while ((c = getchar()) != '\n' && c != EOF);
//                 printf("Failed to get value\n");
//                 break;
//             }
//             printf("Value: %d\n", input_value);
//             root = insert_ST(root, symbol, input_value);
//             printf("Inserted\n");
//             break;
//         case 2:
//             if (!root) {
//                 printf("NULL\n");
//                 break;
//             }
//             print_tree(root, 0);
//             break;
//         case 3:
//             if (!root) {
//                 printf("NULL\n");
//                 break;
//             }
//             print_ST(root);
//             break;
//         case 4:
//             printf("Enter symbol: ");
//             if (!scanf("%1024s", &symbol)) {
//                 int c;
//                 while ((c = getchar()) != '\n' && c != EOF);
//                 printf("Failed to get symbol\n");
//                 break;
//             }
//             printf("Symbol: %s\n", symbol);
//             translated_value = search_ST(root, symbol);
//             if (translated_value == -1) {
//                 printf("Symbol not found\n");
//                 break;
//             }
//             printf("Value is: %d\n", translated_value);
//             break;
//         case 5: return EXIT_SUCCESS;
//         default: printf("Invalid choice\n");    
//         }
//     }
// }

node* insert_ST(node* root, char* symbol, int value) {
    if (!root) {
        root = malloc(sizeof(*root));
        root -> symbol = malloc(strlen(symbol)+1);
        strncpy(root -> symbol, symbol, strlen(symbol)+1);
        root -> value = value;
        root -> left = root -> right = NULL;
        return root;
    }
    if (!strcmp(symbol, root -> symbol))
        return root;
    if (strcmp(symbol, root -> symbol) < 0)
        root -> left = insert_ST(root -> left, symbol, value);
    else
        root -> right = insert_ST(root -> right, symbol, value);
    return root;
}

void print_tree(node* root, int curdepth) {
    if (!root)
        return;
    print_tree(root -> right, curdepth + 1);
    for (int i = 0; i < curdepth; i++)
        printf("\t");
    printf("%s:%d\n", root -> symbol, root -> value);
    print_tree(root -> left, curdepth + 1);
}

void print_ST(node* root) {
    if (!root)
        return;
    print_ST(root -> left);
    printf("%s:\t%d\n", root -> symbol, root -> value);
    print_ST(root -> right);
}

int search_ST(node* root, char* symbol) {
    if (!root)
        return -1;
    if (!strcmp(symbol, root -> symbol))
        return root -> value;
    if (strcmp(symbol, root -> symbol) < 0)
        return search_ST(root -> left, symbol);
    return search_ST(root -> right, symbol);
}

int depth_tree(node* root, int curdepth) {
    if (!root)
        return curdepth - 1;
    int ldepth, rdepth;
    ldepth = depth_tree(root -> left, curdepth + 1);
    rdepth = depth_tree(root -> right, curdepth + 1);
    return (ldepth > rdepth)?ldepth:rdepth;
}