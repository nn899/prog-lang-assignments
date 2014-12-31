%{
#include <iostream>
using namespace std;
#include "prog.tab.h"
%}
%%
[ \t]+ 		   ;
[\r\n]         	   { return CR; }
[0-9]+             { return DIGIT; }
[A-Z]		   { return VAR; }
[\<\>]+	   	   { return RELOP; }
[\=]+		   { return EQUAL; }
[\*\/]+            { return MULDIV; }
[+-]+ 		   { return PLUMIN; }
","		   { return COMMA; }
\"[a-zA-Z0-9_ ]+\" { return STRING; }
"PRINT"		   { return PRINT; }
"IF"		   { return IF; }
"THEN"		   { return THEN; }
"GOTO"		   { return GOTO; }
"INPUT"		   { return INPUT; }
"LET"	 	   { return LET; }
"GOSUB"		   { return GOSUB; }
"RETURN"	   { return RETURN; }
"CLEAR"		   { return CLEAR; }
"LIST"		   { return LIST; }
"RUN"		   { return RUN; }
"END"		   { return END; }
"("		   { return LPAREN; }
")"		   { return RPAREN; }
%%
