%{
#define p_auto      257
#define p_break     258
#define p_case      259
#define p_char      260
#define p_const     261
#define p_continue  262
#define p_default   263
#define p_do        264
#define p_double    265
#define p_else      266
#define p_enum      267
#define p_extern    268
#define p_float     269
#define p_for       270
#define p_goto      271
#define p_if        272
#define p_int       273
#define p_long      274
#define p_register  275
#define p_return    276
#define p_short     277
#define p_signed    278
#define p_sizeof    279
#define p_static    280
#define p_struct    281
#define p_switch    282
#define p_typedef   283
#define p_union     284
#define p_unsigned  285
#define p_void      286
#define p_volatile  287
#define p_while     288
%}

%option case-insensitive

id    [a-zA-Z][a-zA-Z0-9]*
tipo int
/*tipo  [^a-zA-Z0-9]+char[^a-zA-Z0-9]+|[^a-zA-Z0-9]+double[^a-zA-Z0-9]+|[^a-zA-Z0-9]+float[^a-zA-Z0-9]+|[^a-zA-Z0-9]+int[^a-zA-Z0-9]+|[^a-zA-Z0-9]+long[^a-zA-Z0-9]+|[^a-zA-Z0-9]+short[^a-zA-Z0-9]+|[^a-zA-Z0-9]+void[^a-zA-Z0-9]+*/
letters [a-zA-Z]
  int nl=1;
  int yylval;
  int conteo[32] = {0};

  char *res[] = {"auto","break","case","char","const","continue","default","do","double","else","enum","extern","float","for","goto","if","int","long","register","return","short","signed","sizeof","static","struct","switch","typedef","union","unsigned","void","volatile","while"};
%%
[ \t]+  ;
[^a-zA-Z0-9]+auto[^a-zA-Z0-9]+              { conteo[p_auto-257]++; };
[^a-zA-Z0-9]+break[^a-zA-Z0-9]+             { conteo[p_break-257]++; };
[^a-zA-Z0-9]+case[^a-zA-Z0-9]+              { conteo[p_case-257]++; };
[^a-zA-Z0-9]+char[^a-zA-Z0-9]+              { conteo[p_char-257]++; yymore(); };

[^a-zA-Z0-9]+const[^a-zA-Z0-9]+             { conteo[p_const-257]++; };
[^a-zA-Z0-9]+continue[^a-zA-Z0-9]+          { conteo[p_continue-257]++; };
[^a-zA-Z0-9]+default[^a-zA-Z0-9]+           { conteo[p_default-257]++; };
[^a-zA-Z0-9]+do[^a-zA-Z0-9]+                { conteo[p_do-257]++; };
[^a-zA-Z0-9]+double[^a-zA-Z0-9]+            { conteo[p_double-257]++; yymore(); };

[^a-zA-Z0-9]+else[^a-zA-Z0-9]+              { conteo[p_else-257]++; };
[^a-zA-Z0-9]+enum[^a-zA-Z0-9]+              { conteo[p_enum-257]++; };
[^a-zA-Z0-9]+extern[^a-zA-Z0-9]+            { conteo[p_extern-257]++; };
[^a-zA-Z0-9]+float[^a-zA-Z0-9]+             { conteo[p_float-257]++; yymore(); };

[^a-zA-Z0-9]+for[^a-zA-Z0-9]+               { conteo[p_for-257]++; };
[^a-zA-Z0-9]+goto[^a-zA-Z0-9]+              { conteo[p_goto-257]++; };
[^a-zA-Z0-9]+if[^a-zA-Z0-9]+                { conteo[p_if-257]++; };
[^a-zA-Z0-9]+int[^a-zA-Z0-9]+               { conteo[p_int-257]++; yymore(); printf("DEBUG   **%s\n", yytext);};

[^a-zA-Z0-9]+long[^a-zA-Z0-9]+              { conteo[p_long-257]++; yymore(); };

[^a-zA-Z0-9]+register[^a-zA-Z0-9]+          { conteo[p_register-257]++; };
[^a-zA-Z0-9]+return[^a-zA-Z0-9]+            { conteo[p_return-257]++; };
[^a-zA-Z0-9]+short[^a-zA-Z0-9]+             { conteo[p_short-257]++; yymore(); };

[^a-zA-Z0-9]+signed[^a-zA-Z0-9]+            { conteo[p_signed-257]++; };
[^a-zA-Z0-9]+sizeof[^a-zA-Z0-9]+            { conteo[p_sizeof-257]++; };
[^a-zA-Z0-9]+static[^a-zA-Z0-9]+            { conteo[p_static-257]++; };
[^a-zA-Z0-9]+struct[^a-zA-Z0-9]+            { conteo[p_struct-257]++; };
[^a-zA-Z0-9]+switch[^a-zA-Z0-9]+            { conteo[p_switch-257]++; };
[^a-zA-Z0-9]+typedef[^a-zA-Z0-9]+           { conteo[p_typedef-257]++; };
[^a-zA-Z0-9]+union[^a-zA-Z0-9]+             { conteo[p_union-257]++; };
[^a-zA-Z0-9]+unsigned[^a-zA-Z0-9]+          { conteo[p_unsigned-257]++; };
[^a-zA-Z0-9]+void[^a-zA-Z0-9]+              { conteo[p_void-257]++; yymore(); };

[^a-zA-Z0-9]+volatile[^a-zA-Z0-9]+          { conteo[p_volatile-257]++; };
[^a-zA-Z0-9]+while[^a-zA-Z0-9]+             { conteo[p_while-257]++; };

{tipo}" "{id}   {printf("funciono! %s --------------\n", yytext);};
.|\n                                        ;
%%
main(int argc, char** argv){

    if ( argc > 1 )
        yyin = fopen( argv[1], "r" );
    else
        yyin = stdin;

    FILE *fres = fopen("reservadas.txt", "w");
    FILE *fide = fopen("identificadores.txt", "w");

    yylex();
    int i;
    for(i=0; i<32; i++) {
        fprintf(fres, "%d %s\n", conteo[i], res[i]);
    }

    fclose(fres);
    fclose(fide);

}
