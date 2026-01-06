%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%token START FINISH
%token ASSIGN PLUS MINUS MULTIPLY DIVIDE
%token AND OR
%token IF THEN WHILE DO ELSE
%token GT LT
%token INTEGER_TYPE FLOAT_TYPE CHAR_TYPE
%token VARIABLE NUMBER DOT

%left OR
%left AND
%left GT LT ASSIGN
%left PLUS MINUS
%left MULTIPLY DIVIDE

%nonassoc THEN
%nonassoc ELSE

%%

program:
    START DOT statements FINISH DOT { printf("OK: Syntax analysis complete. The code is correct.\n"); }
    ;

statements:
    /* empty */
    | statements statement
    ;

statement:
    declaration DOT
    | assignment DOT
    | if_statement          
    | while_statement
    ;

declaration:
    INTEGER_TYPE VARIABLE
    | FLOAT_TYPE VARIABLE
    | CHAR_TYPE VARIABLE
    ;

assignment:
    VARIABLE ASSIGN expression
    ;

if_statement:
    IF condition THEN statement %prec THEN
    | IF condition THEN statement ELSE statement
    ;

while_statement:
    WHILE condition DO statement
    ;

condition:
    expression GT expression
    | expression LT expression
    | expression ASSIGN expression
    | condition AND condition
    | condition OR condition
    | '(' condition ')'
    ;

expression:
    NUMBER
    | VARIABLE
    | expression PLUS expression
    | expression MINUS expression
    | expression MULTIPLY expression
    | expression DIVIDE expression
    | '(' expression ')'
    ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}

#include "lex.yy.c"