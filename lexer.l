%{
#include "parser.tab.h"
#include <string.h>
%}

%%

"printf"        { return PRINTF; }
"scanf"         { return SCANF; }
"int"           { yylval.sval = strdup(yytext); return TYPE; }
[0-9]+          { yylval.ival = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.sval = strdup(yytext); return ID; }
\"[^\"]*\"      { yylval.sval = strdup(yytext); return STRING; }

[ \t\n]+        { /* skip whitespace */ }
.               { return yytext[0]; }

%%
