%{
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()
%}
%%
[ \t]+ 		;
[\r\n]         	{ cout << "Found a CR" << endl ; }
[0-9]+          { cout << "Found a DIGIT:" << yytext << endl; }
[A-Z]		{ cout << "Found a VAR: " << yytext << endl; }
[\<\>\=]+		{ cout << "Found a RELOP:" << yytext << endl; }
[\*\/]+         { cout << "Found a MULDIV:" << yytext << endl; }
[+-]+ 		{ cout << "Found a PLUMIN:" << yytext << endl; }
","		{ cout << "Found a COMMA:" << yytext << endl; }
\"[a-zA-Z0-9_ ]+\"	{ cout << "Found a STRING:" << yytext <<endl; }
"PRINT"		{ cout << "Found the KEYWORD ->" << yytext << endl; }
"IF"		{ cout << "Found the KEYWORD ->" << yytext << endl; }
"THEN"		{ cout << "Found the KEYWORD ->" << yytext << endl; }
"GOTO"		{ cout << "Found the KEYWORD ->" << yytext << endl; }
"INPUT"		{ cout << "Found the KEYWORD ->" << yytext << endl; }
"LET"		{ cout << "Found the KEYWORD ->" << yytext << endl; }
"GOSUB"		{ cout << "Found the KEYWORD ->" << yytext << endl; }
"RETURN"	{ cout << "Found the KEYWORD ->" << yytext << endl; }
"CLEAR"		{ cout << "Found the KEYWORD ->" << yytext << endl; }
"LIST"		{ cout << "Found the KEYWORD ->" << yytext << endl; }
"RUN"		{ cout << "Found the KEYWORD ->" << yytext << endl; } 
"END"		{ cout << "Found the KEYWORD ->" << yytext << endl; }
"("		{ cout << "Found a LPAREN" << endl; }
")"		{ cout << "Found a RPAREN" << endl; }
.                   { cout << "Unrecognized token :" << yytext << endl; }
%%
main() {
	// lex through the input:
	yylex();
}

