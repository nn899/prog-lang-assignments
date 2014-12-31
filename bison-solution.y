%{
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <cstdio>
using namespace std;
extern int yylex();
//extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;

void yyerror(const char *s);

%}

%start program
%token CR PRINT
%token IF RELOP THEN GOTO
%token MULDIV PLUMIN
%token INPUT LET VAR
%token GOSUB RETURN CLEAR LIST
%token RUN END
%token STRING COMMA
%token LPAREN RPAREN DIGIT 
%token EQUAL 

%%

program : line 		
	| program line
	;

line : number statement CR 	
     | statement CR
     ;

statement : PRINT exprlist	
	  | IF expression RELOP expression THEN statement
	  | GOTO expression
	  | INPUT varlist
	  | LET VAR EQUAL expression
	  | GOSUB expression
	  | RETURN
	  | CLEAR
	  | LIST
	  | RUN
	  | END
	  ;

exprlist : STRING		 
	 | expression
	 | exprlist COMMA STRING
	 | exprlist COMMA expression 
	 ;

varlist : VAR			
	| varlist COMMA VAR
	;

expression : PLUMIN term	
	   | expression PLUMIN term 
	   ;
term : factor			
     | term MULDIV factor
     ;

factor : VAR 		
       | number
       | LPAREN expression RPAREN
       ;
number : DIGIT 		
       | number DIGIT
       ;
%%

int main()
{
	// open a file handle to a particular file:
	FILE *myfile = fopen("a.prog.file", "r");
	// make sure it is valid:
	if (!myfile) {
		cout << "I can't open a.prog.file!" << endl;
		return -1;
	}
	// set flex to read from it instead of defaulting to STDIN:
	yyin = myfile;
	
	// parse through the input until there is no more:
	do
	{
		yyparse();
	} while (!feof(yyin));
    return 0;
}

void yyerror(const char *s)
{
    printf("Parse error:%s\n", s);
    exit(1);
}
