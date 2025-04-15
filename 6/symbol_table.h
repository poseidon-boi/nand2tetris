#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

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

#endif
