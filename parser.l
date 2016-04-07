%{
#define auto      257
#define break     258
#define case      259
#define char      260
#define const     261
#define continue  262
#define default   263
#define do        264
#define double    265
#define else      266
#define enum      267
#define extern    268
#define float     269
#define for       270
#define goto      271
#define if        272
#define int       273
#define long      274
#define register  275
#define return    276
#define short     277
#define signed    278
#define sizeof    279
#define static    280
#define struct    281
#define switch    282
#define typedef   283
#define union     284
#define unsigned  285
#define void      286
#define volatile  287
#define while     288
}%

%option case-insensitive
id    [a-zA-Z][a-zA-Z0-9]*
  int nl=1;
  int yylval;
  int conteo[32] = {0};
  const char *reservadas[32];



  reservadas[auto-257] = "auto";
  reservadas[break-257] = "break";
  reservadas[case-257] = "case";
  reservadas[char-257] = "char";
  reservadas[const-257] = "const";
  reservadas[continue-257] = "continue";
  reservadas[default-257] = "default";
  reservadas[do-257] = "do";
  reservadas[double-257] = "double";
  reservadas[else-257] = "else";
  reservadas[enum-257] = "enum";
  reservadas[extern-257] = "extern";
  reservadas[float-257] = "float";
  reservadas[for-257] = "for";
  reservadas[goto-257] = "goto";
  reservadas[if-257] = "if";
  reservadas[int-257] = "int";
  reservadas[long-257] = "long";
  reservadas[register-257] = "register";
  reservadas[return-257] = "return";
  reservadas[short-257] = "short";
  reservadas[signed-257] = "signed";
  reservadas[sizeof-257] = "sizeof";
  reservadas[static-257] = "static";
  reservadas[struct-257] = "struct";
  reservadas[switch-257] = "switch";
  reservadas[typedef-257] = "typedef";
  reservadas[union-257] = "union";
  reservadas[unsigned-257] = "unsigned";
  reservadas[void-257] = "void";
  reservadas[volatile-257] = "volatile";
  reservadas[while-257] = "while"; 

%%
[ \t]+  ;

auto      { conteo[auto-257]++;
					}
break      { conteo[break-257]++;
					}
case      { conteo[case-257]++;
					}
char      { conteo[char-257]++;
					}
const      { conteo[const-257]++;
					}
continue      { conteo[continue-257]++;
					}
default      { conteo[default-257]++;
					}
do      { conteo[do-257]++;
					}
double      { conteo[double-257]++;
					}
else      { conteo[else-257]++;
					}
enum      { conteo[enum-257]++;
					}
extern      { conteo[extern-257]++;
					}
float      { conteo[float-257]++;
					}
for      { conteo[for-257]++;
					}
goto      { conteo[goto-257]++;
					}
if      { conteo[if-257]++;
					}
int      { conteo[int-257]++;
					}
long      { conteo[long-257]++;
					}
register      { conteo[register-257]++;
					}
return      { conteo[return-257]++;
					}
short      { conteo[short-257]++;
					}
signed      { conteo[signed-257]++;
					}
sizeof      { conteo[sizeof-257]++;
					}
static      { conteo[static-257]++;
					}
struct      { conteo[struct-257]++;
					}
switch      { conteo[switch-257]++;
					}
typedef      { conteo[typedef-257]++;
					}
union      { conteo[union-257]++;
					}
unsigned      { conteo[unsigned-257]++;
					}
void      { conteo[void-257]++;
					}
volatile      { conteo[volatile-257]++;
					}
while      { conteo[while-257]++;
					}

%%
main(){
  yylex();


}
%%
