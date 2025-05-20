#include <stdio.h>
#include <string.h>

// Declare interface from parser
void set_input_string(const char* str);
int yyparse(void);
char* get_output(void);
void reset_output(void);

int main() {
    char line[1024];

    while (1) {
        printf(">>> ");
        if (!fgets(line, sizeof(line), stdin)) break;

        if (strcmp(line, "exit\n") == 0) break;

        reset_output();
        set_input_string(line);
        yyparse();

        printf("%s", get_output());
    }

    return 0;
}
