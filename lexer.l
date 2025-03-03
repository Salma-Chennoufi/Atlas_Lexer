%{
    #include <stdio.h>
    #include <stdlib.h>
%}
id [a-zA-Z][a-zA-Z0-9]*
nb [0-9]+
kw tableau|record|drecord|frecord|de|type|const|vaut|var|proc|dproc|fproc|fixe|modif|fonct|dfonct|ffonct|retourner
typeDeBase car|ent|sreel|dreel|bool|chaine
%%
{kw} printf("mot cle: %s\n", yytext);
{typeDeBase} printf("type de base: %s\n", yytext);
{nb} printf("nb: %d\n", atoi(yytext));
{id} printf("id: %s\n", yytext);
".." printf("point point: %s\n", yytext);
":" printf("deux points: %c\n", yytext[0]);
"[" printf("crochet ouvert: %c\n", yytext[0]);
"]" printf("crochet ferme: %c\n", yytext[0]);
"->" printf("declaration de structure: %s\n", yytext);
";" printf("fin d'instruction: %c\n", yytext[0]);
"=" printf("operateur d'initialisation: %c\n", yytext[0]);
%%
int main(){
    yylex();
    return 0;
}
int yywrap() { 
    return 1; 
}