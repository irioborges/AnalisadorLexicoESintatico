#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
#define DEPTH 10
#define NUM_CHILDREN 10
 
typedef struct node
{
    struct node* child;
    struct node* next;
    char val[100];
} node;
 
char depth[ 2056 ];
int di;
 
void Build( node* tree, int n )
{
    strcat(tree->val, "teste");
    tree->child = NULL;
 
    if ( n )
    {
        int children = rand( ) % NUM_CHILDREN;
 
        for ( int i = 0; i < children; ++i )
        {
            node* child = (node*)malloc( sizeof( node ) );
            child->next = tree->child;
            tree->child = child;
 
            Build( child, n - 1 );
        }
    }
}
 
void Push( char c )
{
    depth[ di++ ] = ' ';
    depth[ di++ ] = c;
    depth[ di++ ] = ' ';
    depth[ di++ ] = ' ';
    depth[ di ] = 0;
}
 
void Pop( )
{
    depth[ di -= 4 ] = 0;
}
 
void Print( node* tree )
{
    printf( "(%s)\n", tree->val );
 
    node* child = tree->child;
 
    while ( child )
    {
        node* next = child->next;
        printf( "%s `--", depth );
        Push( next ? '|' : ' ' );
        Print( child );
        Pop( );
        child = next;
    }
}
 
int main( void )
{
    node* root = (node*)malloc( sizeof( node ) );
    strcat(root->val, "main");
    root->next = NULL;
    Build( root, DEPTH );
    Print( root );
}
