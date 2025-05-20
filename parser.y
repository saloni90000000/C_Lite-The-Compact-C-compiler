%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

// Declare Flex buffer functions manually
typedef struct yy_buffer_state *YY_BUFFER_STATE;
extern YY_BUFFER_STATE yy_scan_string(const char *);
extern void yy_switch_to_buffer(YY_BUFFER_STATE);

void yyerror(const char *s);
int yylex(void);

int symbol_table[100]; // Simple variable store
int get_variable_index(const char* name);

// Output logic
char output[8192];
void append_output(const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    vsprintf(output + strlen(output), fmt, args);
    va_end(args);
}

char* get_output() { return output; }
void reset_output() { output[0] = '\0'; }

char* input_string = NULL;
void set_input_string(const char* str) {
    if (input_string) free(input_string);
    input_string = strdup(str);
    YY_BUFFER_STATE bp = yy_scan_string(input_string);
    yy_switch_to_buffer(bp);
}
%}

%union {
    int ival;
    char* sval;
}

%token <ival> NUMBER
%token <sval> ID
%token <sval> STRING
%token TYPE
%token PRINTF SCANF

%type <ival> expression

%expect 1

%%

program:
    /* empty */
    | program statement
    ;

statement:
    declaration ';' {
        append_output("Variable declared and assigned\n");
    }
    | PRINTF '(' STRING ',' ID ')' ';' {
        int idx = get_variable_index($5);
        append_output($3, symbol_table[idx]);
        free($3);
        free($5);
    }
    | SCANF '(' STRING ',' '&' ID ')' ';' {
        int idx = get_variable_index($6);
        append_output("[INPUT REQUESTED]: %s\n", $3);
        scanf($3, &symbol_table[idx]);
        free($3);
        free($6);
    }
    ;

declaration:
    TYPE ID '=' expression {
        int idx = get_variable_index($2);
        symbol_table[idx] = $4;
        append_output("Declaring variable %s with value %d\n", $2, $4);
        free($2);
    }
    ;

expression:
    NUMBER { $$ = $1; }
    | ID {
        int idx = get_variable_index($1);
        $$ = symbol_table[idx];
        free($1);
    }
    | expression '+' expression { $$ = $1 + $3; }
    ;

%%

void yyerror(const char *s) {
    append_output("Error: %s\n", s);
}

int get_variable_index(const char* name) {
    return (unsigned int)name[0] % 100;
}
