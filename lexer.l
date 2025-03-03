%{
    #include <stdio.h>
    #include <stdlib.h>
%}

lettre [a-zA-Z]
chiffre [0-9]
id {lettre}({lettre}|{chiffre})*
entier [-]?{chiffre}+
reel [-]?{chiffre}+(,{chiffre}+)
booleen (vrai|faux) 
caractere \'.\'
texte \"[^\"]*\"
kw tableau|record|drecord|frecord|de|type|const|vaut|var|proc|dproc|fproc|fixe|modif|fonct|dfonct|ffonct|retourner|Programme|SOUS_PROG|DEBUT|FIN|si|alors|sinon|fsi|cas|parmis|autre|fcas|sauter|pour|fpour|jusqua|faire|pas|tantque|ftantque|repeter|continuer
typeDeBase car|ent|sreel|dreel|bool|chaine
espaces  (\t|\n| )+
commentaire %.*\n
op_Arith "+"|"-"|"*"|"/"|"!"|"div"|"mod"|"^"|"valabs"|"partent"|"rc" 
op_Logique "et"|"ou"|"non"|"xou"
op_comp ">"|">="|"<"|"<="|"<>"|"="
op_affect  ":="
op_chain  "+"|"long"
op_caract  "ascii"|"chr"

%%
{kw} printf("mot cle: %s\n", yytext);
{typeDeBase} printf("type de base: %s\n", yytext);
{entier} printf("Constante de type entier: %d\n", atoi(yytext));
{reel} printf("Constante de type reel: %s\n", yytext);
{id} printf("id: %s\n", yytext);
{booleen} printf("Constante de type booleen: %s\n", yytext);
{caractere} printf("Constante de type caractere: %s\n", yytext);
{texte} printf("Constante de type chaine de caracteres: %s\n", yytext);
{espaces} printf("Espace: %s\n", yytext);
{commentaire} printf("Commentaire: %s\n", yytext);
{op_Arith} printf("Operateur arithmetique:", yytext);
{op_Logique} printf("Operateur logique:", yytext);
{op_comp} printf("Operateur comparaison:", yytext);
{op_affect} printf("Operateur affectation:", yytext);
{op_chain} printf("Operateur sur les chaines de caracteres:", yytext);
{op_caract} printf("Operateur sur les caractères:", yytext);
".." printf("point point: %s\n", yytext);
":" printf("deux points: %c\n", yytext[0]);
"[" printf("crochet ouvert: %c\n", yytext[0]);
"]" printf("crochet ferme: %c\n", yytext[0]);
"->" printf("declaration de structure: %s\n", yytext);
";" printf("fin d'instruction: %c\n", yytext[0]);
"=" printf("operateur d'initialisation: %c\n", yytext[0]);
. printf("error: %s inconnu\n", yytext); 
%%
int main(){
    yylex();
    return 0;
}
int yywrap() { 
    return 1; 
}