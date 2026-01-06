%{

%}

%%
"Start"         { return START; }
"Finish"        { return FINISH; }
"equals"        { return ASSIGN; }
"plus"          { return PLUS; }
"minus"         { return MINUS; }
"times"         { return MULTIPLY; }
"divided by"    { return DIVIDE; }
"and"           { return AND; }
"or"            { return OR; }
"greater than"  { return GT; }
"less than"     { return LT; }
"if"            { return IF; }
"then"          { return THEN; }
"else"          { return ELSE; }
"while"         { return WHILE; }
"do"            { return DO; }
"integer"       { return INTEGER_TYPE; }
"float"         { return FLOAT_TYPE; }
"char"          { return CHAR_TYPE; }
[a-zA-Z][a-zA-Z0-9]* { return VARIABLE; }
[0-9]+          { return NUMBER; }
"."             { return DOT; }
"("             { return '('; }
")"             { return ')'; }
[ \t\n\r]+      ;
.               { printf("Lexical Error: Unknown character '%s'\n", yytext); }
%%

int yywrap() { return 1; }