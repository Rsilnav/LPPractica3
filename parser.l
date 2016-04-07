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
  int nl=1;
  int yylval;
  int conteo[32] = {0};

  char *res[] = {"auto","break","case","char","const","continue","default","do","double","else","enum","extern","float","for","goto","if","int","long","register","return","short","signed","sizeof","static","struct","switch","typedef","union","unsigned","void","volatile","while"};
%%
[ \t]+  ;

auto      { conteo[p_auto-257]++; }
break      { conteo[p_break-257]++; }
case      { conteo[p_case-257]++; }
char      { conteo[p_char-257]++; }
const      { conteo[p_const-257]++; }
continue      { conteo[p_continue-257]++; }
default      { conteo[p_default-257]++; }
do      { conteo[p_do-257]++; }
double      { conteo[p_double-257]++; }
else      { conteo[p_else-257]++; }
enum      { conteo[p_enum-257]++; }
extern      { conteo[p_extern-257]++; }
float      { conteo[p_float-257]++; }
for      { conteo[p_for-257]++; }
goto      { conteo[p_goto-257]++; }
if      { conteo[p_if-257]++; }
int      { conteo[p_int-257]++; }
long      { conteo[p_long-257]++; }
register      { conteo[p_register-257]++; }
return      { conteo[p_return-257]++; }
short      { conteo[p_short-257]++; }
signed      { conteo[p_signed-257]++; }
sizeof      { conteo[p_sizeof-257]++; }
static      { conteo[p_static-257]++; }
struct      { conteo[p_struct-257]++; }
switch      { conteo[p_switch-257]++; }
typedef      { conteo[p_typedef-257]++; }
union      { conteo[p_union-257]++; }
unsigned      { conteo[p_unsigned-257]++; }
void      { conteo[p_void-257]++; }
volatile      { conteo[p_volatile-257]++; }
while      { conteo[p_while-257]++; }
%%
main(){
  yylex();
  int i;
  for(i=0; i<32; i++) {
    printf("%s --> %d\n", res[i], conteo[i]);
  }

}
