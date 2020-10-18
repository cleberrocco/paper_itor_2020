
* save .\a0\PASUC1_DATA


$title Dados do PASUC nível 1


sets
u usinas /cap, pai, pal, pri, usc, usm, ser, sin, usu, tri/
t meses /sete, out, nov, dez, jan, fev, mar, abr, mai, jun, jul, ago/
p produtos /Standard, Superior, Especial, Extra, Refinado, VHP, VHP+, VHPe, melaco, AEHC, AEAC, AEHren/
pa(p) acucares /Standard, Superior, Especial, Extra, Refinado, VHP, VHP+, VHPe/
pd(p) alcoois /AEHC, AEAC, AEHren/
pm(p) subprodutos do acucar /Melaco/
e local de estoque /tab, jar, MD1, empat, Aterc, usinas, tpetro, Eterc /

m materia-prima /cana/
tf(t) ultimo periodo /ago/

alias(t,t1)
;

* OK com artigo
** Numero de dias disponiveis para moagem no mes
table n(u,t) Numero de dias de moagem de cada usina em cada periodo (dias por mes)
         sete    out     nov     dez     jan     fev     mar     abr     mai     jun     jul     ago
cap      0       24.5    29      29.5    29      28      29      9       0       0       0       0
pai      12.5    30      29.5    30      29      0       0       0       0       0       0       0
pal      13.5    30      29      29.5    29      28      28      0       0       0       0       0
pri      6.5     30      29      29.5    29      14      0       0       0       0       0       0
usc      11.5    29.5    29      29.5    29      28      7.5     0       0       0       0       0
usm      16      30      29      29.5    29      20      0       0       0       0       0       0
ser      17.5    30      29.5    29.5    29.5    20.5    0       0       0       0       0       0
sin      12.5    29.5    29      30      29      23      0       0       0       0       0       0
usu      5.5     30      29.5    30      29.5    28.5    6       0       0       0       0       0
tri      5.5     30      29      29.5    29      28      12      0       0       0       0       0   ;


* OK com o artigo
** 0.95833 significa trabalhar 23 horas por dia
Parameter phi(u,t) Tempo aproveitado na industria (%) ;
phi(u,t) $(n(u,t))  = 0.95833;
Display phi;


* OK com o artigo
**Percentual de melaco na producao de acucar
table teta(pa,u) Melaco obtido por unidade de acucar produzido (%)
         cap     pai     pal     pri     usc     usm     ser     sin     usu     tri
Standard .51368  .51368          .51368  .51368  .51368  .51368  .51368  .51368  .51368
Superior .51368  .51368          .51368  .51368  .51368  .51368  .51368  .51368  .51368
Especial .51368  .51368          .51368  .51368  .51368  .51368  .51368  .51368  .51368
Extra    .51368  .51368          .51368  .51368  .51368  .51368  .51368  .51368  .51368
Refinado                                                                         .51568
VHP      .50351  .50351          .50351  .50351  .50351  .50351  .50351  .50351  .50351
VHP+     .50351  .50351          .50351  .50351  .50351  .50351  .50351  .50351  .50351
VHPe     .50351  .50351          .50351  .50351  .50351  .50351  .50351  .50351  .50351
;
**Dados estimados por meio dos rendimentos da USC
**0.51368 significa 1% acima da media de producao de melaco por saco de acucar da usc
**0.50351 significa 1% abaixo


* Ok com o artigo - Mtrs(u)
**ATR entrado e saido
parameter Matr(u) ATR do mel final (%)
/cap 0.5738, pai 0.5738, pal 0, pri 0.5738, usc 0.5738,
 usm 0.5738, ser 0.5738, sin 0.5738, usu 0.5738, tri 0.5738/;
**Dados estimados por meio dos rendimentos da USC
**0.5738 representa o valor obtido pela usc na safra 2007/2008


* ok com o artigo: Ptrs(p)
parameter Patr(p) ATR do produto final (t por t ou m3)
/Standard  1.0473, Superior  1.0473, Especial  1.0473, Extra  1.0473, Refinado 1.0505, VHP  1.0442
 VHP+  1.0442,     VHPe  1.0442,     AEAC  1.8169,     AEHC  1.7409,  AEHren  1.7409,  melaco  0.55/ ;
**padrao de conversao utilizado pela usc (ver arquivo com conversao de atr e art)


* ok com o artigo Etrs(u,t)
table Eatr(u,t) Eficiencia de ATR da usina u no mes t (%)
         sete    out     nov     dez     jan     fev     mar
cap              .9      1.03    1.03    1.03    1.01    1.1
pai      .9     1.04     1.04    1.04    1.04    1.1
pal      .7     1.05     1.05    1.05    1.05    1.03    1.1
pri      .9     1.03     1.03    1.03    1.03    1.03    1.1
usc      .8      .98     1.00    1.01    1.01    1.00    1.1
usm      .8     1.04     1.04    1.04    1.05    1.04    1.1
ser      .8      .97     1.02    1.04    1.04    1.01    1.1
sin      .9      .97     1.00    1.00    1.01    1.01    1.1
usu      .8      .99     1.02    1.02    1.03    1.02    1.1
tri      .8     1.01     1.01    1.02    1.02    1.01    1.1
;
**"Previsao 1" 0.935 e 1.05 significam a eficiencia teorica considerando 1 dia de producao como produto em processo
**Os outros valores sao a media teorica esperada


* ok com o artigo Trs(u,t)
table Atr(m,u,t) ATR da cana m na usina u no mes t (kg ATR por tc)
         sete    out     nov     dez     jan     fev     mar
cana.cap         128     131     143     137     131     120
cana.pai 135     136     142     149     152     142
cana.pal 123     125     133     138     131     131     126
cana.pri 108     136     143     145     147     148     130
cana.usc 118     126     141     142     137     136     130
cana.usm 129     134     141     149     142     139     128
cana.ser 120     132     141     145     147     147
cana.sin 141     144     152     160     156     147     143
cana.usu 137     140     144     151     149     149     130
cana.tri 128     134     142     151     149     135     121
;
**"Previsao 1" Os valores de ATR simulam a curva de ATR durante a safra e desconsideram a diferenca entre tipos de cana
* no artigo descreve-se sem o índice m.


**Capacidades
* ok com o artigo
parameter Mmin(u) Moagem minima diaria (tcana por dia)
/cap 3000, pai 4100, pal 3000, pri 8700, usc 6500, usm 5000, ser 5700, sin 7300, usu 4900, tri 8100/;
**6480 significa moagem de 270 tc.hora em 24 horas (moagem diaria)
**5040 significa moagem de 210 tc.hora em 24 horas (moagem diaria)


*ok com o artigo
parameter Mmax(u) Moagem maxima diaria (tc por dia)
/cap 4000, pai 5100, pal 3800, pri 10800, usc 8000, usm 6200, ser 7400, sin 9000, usu 6000, tri 10000/;
**8160 significa moagem de 340 tc.hora em 24 horas (moagem diaria)
**6960 significa moagem de 295 tc.hora em 24 horas (moagem diaria)


* ok com o artigo
table Emax(p,e) Capacidade maxima de estocagem (t ou m3)
         Tab     Jar     MD1     Empat   Aterc   Usinas   TPetro  Eterc
Standard 100000  5000                    9999999
Superior 100000  5000                    9999999
Especial 100000  5000                    9999999
Extra    100000  5000                    9999999
Refinado 100000  5000                    9999999
VHP                      100000  100000  9999999
VHP+                     100000  100000  9999999
VHPe     100000  5000                    9999999
AEAC                                             500000   30000   9999999
AEHC                                             900000   30000   9999999
AEHren                                           900000   30000   9999999
Melaco                                           50000    20000   9999999
;
**Dados estimados e agregados em grandes centros **Pegar dados mais ajustados com opl crpaaa


* ok com o artigo
table Cpmax(p,u) Capacidade de producao diaria por usina (t ou m3 por dia)
         cap      pai     pal     pri     usc     usm     ser     sin     usu       tri
Standard          494                     700                     900               1029
Superior          494                     700                     900               1029
Especial          494                     700                     900               1029
Extra             489                     700                     687               1014
Refinado                                                                            668
VHP      522      500             1061    750     574     728     980     675       1050
VHP+     522      500             1061    750     574     728     980     675       1050
VHPe              500                     750                     980     675       1050
AEAC     51       153             167     120     193     100     222     112       296
AEHC     52       157     355     391     210     199     174     300     132       304
AEHren                                                    100
Melaco   9999999  9999999         9999999 9999999 9999999 9999999 9999999 9999999   9999999
;
**Dados coletados da maior producao de cada usina na planilha de acompanhamento da CRPAAA


* ok com o artigo
parameter Cfmax(u) Capacidade de producao diaria da fabrica de acucar por usina (t ou m3 por dia)
/cap 522, pai 500, pal 0, pri 1061, usc 750, usm 574, ser 728, sin 980, usu 675, tri 1050/;

* ok com o artigo
parameter Cdmax(u) Capacidade de producao diaria da destilaria por usina (t ou m3 por dia)
/cap 52, pai 157, pal 355, pri 391, usc 210, usm 199, ser 174, sin 300, usu 132, tri 304/;


**Dados de custos, demanda e precos
* ok com o artigo
table Cp(p,u) Matriz de custo industrial (R$ por t ou m3)
         cap     pai     pal     pri     usc     usm     ser     sin     usu     tri
Standard         486                     483                     483             486
Superior         488                     485                     485             488
Especial         490                     486                     487             490
Extra            492                     489                     489             492
Refinado                                                                         530
VHP      440     430             430     425     425     430     425     410     430
VHP+     450     435             435     433     435     435     430     415     435
VHPe             446                     469                     463     455     448
AEAC     900     850             820     850     840     840     850             820
AEHC     850     800     790     770     800     790     800     800             770
AEHren                                                   840
Melaco   128     130             130     130     130     130     130     130     130
;
**Valores estimados para teste (reavaliar com dados mais consistentes)


* ok com o artigo
table Ce(p,e) Custo de estocagem (R$ por t ou m3)
         tab     jar     MD1     empat   Aterc   usinas   tpetro  Eterc
Standard 1.0     1.5                     5.0
Superior 1.0     1.5                     5.0
Especial 1.0     1.5                     5.0
Extra    1.0     1.5                     5.0
Refinado 1.0     1.5                     5.0
VHP                      0.7     0.5     5.0
VHP+                     0.7     0.5     5.0
VHPe     1.0     1.5                     5.0
AEAC                                             1.5     2.5     5.0
AEHC                                             1.5     2.5     5.0
AEHren                                           1.5     2.5     5.0
Melaco                                           2.0     2.5     5.0  ;
**Dados estimados apenas para representar as preferencias entre estoques


* ok com o artigo
table Dmin(p,t) Demanda minima dos produtos por semana (t ou m3)
         sete    out     nov     dez     jan     fev     mar     abr     mai     jun     jul     ago
Standard                         1000                            1000                            1000
Superior 1500    1500    1500    1500    1500    1500    1500    1500    1500    1500    1500    1500
Especial 1500    1500    1500    1500    1500    1500    1500    1500    1500    1500    1500    1500
Extra                            15000   15000   15000   15000   15000
Refinado         9000    9000    9000    9000    9000    9000    9000    9000    9000    9000
VHP              80000           80000           80000           80000           80000           80000
VHP+                                                     40000           40000
VHPe                                             1000                    500
AEAC     10000   10000   10000   10000   10000   10000   10000   10000   9000    9000    9000    9000
AEHC     8000    8000    8000    8000    8000    8000    8000    8000    8000    8000    8000    8000
AEHren                                           4800
Melaco
;
**Demanda liberada para teste


* ok com o artigo
parameter Dmax(p) Demanda maxima dos produtos (t ou m3)
/Standard  53500,   Superior  53500, Especial  53500, Extra  80000,  Refinado 100000, VHP  10000000
 VHP+      1000000, VHPe  20000,     AEAC  180000,    AEHC   155000, AEHren 5000,     melaco  10000 / ;
**Demanda liberada para teste


* ok com o artigo
table Vp(p,t) Valor liquido dos produtos por periodo (R$ por t ou m3)
         sete    out     nov     dez     jan     fev     mar     abr     mai     jun     jul     ago
Standard 539     537     536     537     540     540     540     541     539     542     544     550
Superior 539.5   537.5   536.5   537.5   540.5   540.5   540.5   541.5   539.5   542.5   544.5   550.5
Especial 550.5   550.60  550.80  552.80  553.80  553.80  549.99  550.60  550.80  552.80  553.80  563.80
Extra    556.5   559.5   558.5   559.5   562.5   563.5   574.5   573.5   571.5   574.5   576.5   572.5
Refinado 599.99  590.5   590.5   590.5   592.5   595.5   597.5   597.5   595.5   594.5   596.5   592.5
VHP      465.3   446.6   447.6   449.6   447.6   446.6   445.3   446.6   443.6   438.6   446.6   446.6
VHP+     467.3   448.6   449.6   450.6   448.6   448.6   447.3   448.6   445.6   440.6   448.6   448.6
VHPe                             450     450     450     450     450     450     450     450     450
AEAC     980.5   965.8   965.9   966.9   963.9   963.9   964.5   965.8   965.9   966.9   963.9   993.9
AEHC     950.5   915.8   915.9   906.9   903.9   903.9   904.5   905.8   915.9   906.9   903.9   923.9
AEHren   970.5   935.8   935.9   926.9   923.9   923.9   924.5   925.8   935.9   926.9   923.9   943.9
Melaco   110     110     110     110     110     110     110     110     110     110     110     110
;
**Valores estimados para teste (reavaliar com dados mais consistentes) - Valor liquido de impostos


**Controle de variaveis
* ok com o artigo - declarada como Ci(u)
Table C0(m,u,*) Previsao de colheita para toda a safra (tc)
                 PSafra
cana.cap         640000
cana.pai         630000
cana.pal         660000
cana.pri         1400000
cana.usc         1150000
cana.usm         880000
cana.ser         1000000
cana.sin         1300000
cana.usu         870000
cana.tri         1530000
;

* OK com o artigo
table I0(p,e,*) Estoque inicial (t ou m3)
                 EInic
Standard.tab     2000
Standard.jar
Standard.Aterc
Superior.tab
Superior.jar
Superior.Aterc
Especial.tab     1000
Especial.jar
Especial.Aterc
Extra   .tab
Extra   .jar
Extra   .Aterc
Refinado.tab     500
Refinado.jar
Refinado.Aterc
VHP     .MD1
VHP     .empat   1000
VHP     .Aterc
VHP+    .MD1
VHP+    .empat
VHP+    .Aterc
VHPe    .tab
VHPe    .jar
VHPe    .Aterc
AEAC    .usinas   5000
AEAC    .TPetro
AEAC    .Eterc
AEHC    .usinas   5000
AEHC    .TPetro
AEHC    .Eterc
AEHren  .usinas
AEHren  .TPetro
AEHren  .Eterc
melaco  .usinas
melaco  .TPetro
melaco  .Eterc
;

* não declarado no artigo
table At0(p,*) Falta inicial (t ou m3)
                 AInic
Standard
Superior
Especial
Extra
Refinado
VHP
VHP+
VHPe
AEAC
AEHC
AEHren
melaco
;

* ok com o artigo
parameter Ep(p) Estoque de passagem (t ou m3)
/Standard  0, Superior  0, Especial  0, Extra  0,   Refinado 0, VHP  0
 VHP+      0,     VHPe  0,     AEAC  0, AEHC   0,   melaco  1 / ;

* ok com o artigo
scalar Ca Parametro auxiliar de penalizacao por atraso na entrega /1000/ ;

parameter contr_(t) parametro auxiliar para o controle de estoque inicial
/sete 1 , out 0, nov 0, dez 0, jan 0, fev 0, mar 0, abr 0, mai 0, jun 0, jul 0, ago 0/;

