
* restart .\a0\PASUC1_DATA  save .\a0\PASUC12_DATA

$title Dados do PASUC nível 2


***Indices e subindices do nivel 2
Sets
kk Processos /proc1*proc24/
tt Periodos /sem1*sem25/

mm Materia Prima /Mprop, Mforn/
mmp(mm) Materia prima propria /Mprop/
mmf(mm) Materia prima fornecedores /Mforn/

ff Servico Transporte /Fprop, Fterc/
ffc(ff) Frota Propria ou Contratada /Fprop/

pp Produtos /EspecialUSC, ExtraUSC, VHPUSC, AEHCUSC, AEACUSC, MelacoUSC/
ppa(pp) acucares produzidos /EspecialUSC, ExtraUSC, VHPUSC/
ppd(pp) alcoois produzidos /AEACUSC, AEHCUSC/
ppm(pp) melaco / MelacoUSC /

ttf(tt) ultimo periodo /sem25/
Alias (tt,tt1)
;

***Calculo da matriz de rendimento do nivel 2
**Estimativas retiradas do boletim do dia 30/04/2008 safra 2007/08
* estah no Appendix do artigo
* ok com o artigo

* ok no appendix
scalars
Bmf2 Brix do mel final (%) /84.00/
PzaM2 pureza do mel final (%) /42/
;

* ok no Appendix
parameters
**parametros dos processos
Tm2(kk) Desvio de melaco para destilaria (unitarizado)
/proc1*proc24 1/

* ok no Appendix
Ts2(kk) Desvio de caldo decantado (acucar bruto) e caldo misto (acucar branco) para fabrica (unitarizado)
/proc1*proc6   1, proc7*proc12  .9,
 proc13*proc18 .8, proc19*proc24  .7/

* ok no Appendix
Pol2(kk) polarizacao dos acucares (%)
/proc1    99.7, proc2    99.8, proc3    99.3
 proc4    99.7, proc5    99.8, proc6    99.3
 proc7    99.7, proc8    99.8, proc9    99.3
 proc10   99.7, proc11   99.8, proc12   99.3
 proc13   99.7, proc14   99.8, proc15   99.3
 proc16   99.7, proc17   99.8, proc18   99.3
 proc19   99.7, proc20   99.8, proc21   99.3
 proc22   99.7, proc23   99.8, proc24   99.3/

* ok no Appendix
Umid2(kk) Umidade dos acucares (%)
/proc1*proc2    .1, proc3     .15
 proc4*proc5    .1, proc6     .15
 proc7*proc8    .1, proc9     .15
 proc10*proc11  .1, proc12    .15
 proc13*proc14  .1, proc15    .15
 proc16*proc17  .1, proc18    .15
 proc19*proc20  .1, proc21    .15
 proc22*proc23  .1, proc24    .15/

* Ok no Appendix
Rend2(pp) Rendimento estequiometrico dos alcoois (litro por 100 kg ART)
/AEHCUSC 67.87
 AEACUSC 65.03/

* ok no Appendix Map(k,pa)
table Map2(kk,pp) Matrix auxiliar de determinacao dos acucares produzidos em cada processo
                                        EspecialUSC     ExtraUSC        VHPUSC
 proc1                                   1
 proc2                                                   1
 proc3                                                                   1
 proc4                                   1
 proc5                                                   1
 proc6                                                                   1
 proc7                                   1
 proc8                                                   1
 proc9                                                                   1
 proc10                                  1
 proc11                                                  1
 proc12                                                                  1
 proc13                                  1
 proc14                                                  1
 proc15                                                                  1
 proc16                                  1
 proc17                                                  1
 proc18                                                                  1
 proc19                                  1
 proc20                                                  1
 proc21                                                                  1
 proc22                                  1
 proc23                                                  1
 proc24                                                                  1
;

* ok no Appendix no artigo Mep(k,pd)
table Mep2(kk,pp) Matrix auxiliar de determinacao dos alcoois produzidos em cada processo
                 AEHCUSC         AEACUSC
 proc1*proc3     1
 proc4*proc6     .425            .575
 proc7*proc9                     1
 proc10*proc12   1
 proc13*proc15   .425            .575
 proc16*proc18                   1
 proc19*proc20   1
 proc22*proc24   .425            .575
;


**parametros variaveis no tempo
parameter pc2(tt) Pol da cana (%)
/sem1  12.0, sem2  12.2, sem3  12.4, sem4  12.6, sem5  12.8, sem6  13.0
 sem7  13.2, sem8  13.4, sem9  13.6, sem10 13.8, sem11 14.0, sem12 14.2
 sem13 14.4, sem14 14.6, sem15 14.6, sem16 14.6, sem17 14.6, sem18 14.6
 sem19 14.6, sem20 14.3, sem21 14.1, sem22 13.9, sem23 13.6, sem24 13.3
 sem25 12.9 /
;

parameter Elbti2(tt) Eficiencia na lavagem bagaco torta e indeterminadas (% ART)
/sem1  79.2,  sem2  83.6,  sem3  86.24, sem4 86.24,  sem5  86.24, sem6  88.0
 sem7  88.0,  sem8  89.76, sem9  89.76, sem10 89.76, sem11 89.76, sem12 90.64
 sem13 89.76, sem14 89.76, sem15 89.76, sem16 89.76, sem17 89.76, sem18 88.0
 sem19 88.0,  sem20 88.0,  sem21 88.0,  sem22 88.0,  sem23 88.0,  sem24 88.0
 sem25 105.6/
;

parameter Efd2(tt) Eficiencia na fermentacao e destilacao (%)
/sem1  00.00, sem2  83.75, sem3  83.75, sem4  84.6,  sem5  86.29,  sem6 87.98
 sem7  87.98, sem8  87.98, sem9  87.98, sem10 87.98, sem11 87.98, sem12 87.98
 sem13 87.98, sem14 87.98, sem15 87.98, sem16 87.98, sem17 87.98, sem18 87.98
 sem19 87.98, sem20 87.98, sem21 87.98, sem22 87.98, sem23 87.98, sem24 86.29
 sem25 93.06/
;

parameter PzaC2(tt) Pureza da cana (%)
/sem1  82.4, sem2  82.6, sem3  83.1, sem4  83.4, sem5  83.4, sem6  83.9
 sem7  83.9, sem8  84.0, sem9  84.5, sem10 84.5, sem11 84.6, sem12 84.9
 sem13 84.8, sem14 84.8, sem15 84.8, sem16 84.8, sem17 84.1, sem18 83.5
 sem19 83.0, sem20 82.4, sem21 82.0, sem22 81.5, sem23 81.0, sem24 81.0
 sem25 81.0/
;

parameter Ar2(tt) Acucares redutores contidos na cana (%)
/sem1  0.8, sem2  0.8, sem3  0.8, sem4  0.8, sem5  0.8, sem6  0.8
 sem7  0.8, sem8  0.8, sem9  0.8, sem10 0.8, sem11 0.8, sem12 0.8
 sem13 0.8, sem14 0.8, sem15 0.8, sem16 0.8, sem17 0.8, sem18 0.8
 sem19 0.8, sem20 0.9, sem21 0.9, sem22 0.9, sem23 0.9, sem24 0.9
 sem25 0.9/
;
* ok dados no appendix


* ok eq (54)  - no artigo nao estah indexado em k
parameters PzaJ2(kk,tt) Pureza do caldo misto (%);
PzaJ2(kk,tt)=(PzaC2(tt)-1);
display PzaJ2;

* ok - eq (55)
parameter PzaS2(kk) Pureza dos acucares (%) ;
PzaS2(kk)=Pol2(kk)/(1-(Umid2(kk)/100));
display PzaS2;

* ok - eq (56)
parameter SjM2(kk,tt) Recuperacao de acucares na cristalizacao (unitarizado);
SjM2(kk,tt)=((PzaS2(kk)*(PzaJ2(kk,tt)-PzaM2)))/(PzaJ2(kk,tt)*(PzaS2(kk)-PzaM2));
display SjM2;

* ok - eq (57) no artigo nao estah indexado em k
parameter SmF2(kk) Sacarose no mel final (%) ;
SmF2(kk)=(BMF2*PzaM2)/100;
display SmF2;

* ok - eq (58)
parameter Rd2(pp,tt) Recuperacao de alcoois na destilaria (litro por 100 kg ART);
Rd2(pp,tt)=(Rend2(pp)*(Efd2(tt)/100));
display Rd2;

* ok - eq (58)
parameter Ra2(pp,kk,tt) Rendimento de acucares (Kg por tc);
Ra2(pp,kk,tt)=pc2(tt)*10*(Elbti2(tt)/100)*SjM2(kk,tt)*Ts2(kk)*Map2(kk,pp);
display Ra2;

* ok eq (57)
parameter Re2(pp,kk,tt) Rendimento de alcoois (litros por tc);
Re2(pp,kk,tt) =  ( Elbti2(tt)/10 ) * ( RD2(pp,tt)/100 ) *
                 (
                 ( (pc2(tt)/0.95) * (1-SjM2(kk,tt) ) + Ar2(tt) ) * Ts2(kk) * Tm2(kk) +
                 ( ( (pc2(tt)/0.95) + Ar2(tt) ) * ( 1-Ts2(kk) ) )
                 ) * Mep2(kk,pp);
display Re2;

* Rm(pm,k,t) estah no artigo, mas nao estah implementado
* ok eq (58)
parameter A2(pp,kk,tt) Matriz de rendimento dos processos por periodo (t ou m3 por tc);
A2(pp,kk,tt)=(Ra2(pp,kk,tt) + Re2(pp,kk,tt)) / 1000;
display  A2;
***Fim do calculo da matriz de rendimentos do nivel 2



***Inicio do calculo da matriz de custos industriais do nivel 2
scalars  cproc2 Custo de producao em R$ por kg ART nos processos da USC /0.03388/
         arm2 Estimativa de acucares redutores no mel final produzido /18/;
**Estimativa com base na producao de 155.482.483 kg ART e despesas de R$ 5.267.671,58 (Plan proj safra)

parameter Fator2(pp) Fator de correcao para etanol absoluto (adimensional)
/AEHCUSC 0.95415
 AEACUSC 0.99577/;
**dado obtido da pg 139 de Fernandes (2003)


* nao estah no artigo - usado no parametro de custo CK2(k,t)
parameter CustoEnsaque2(kk) Custo adicional entre acucar granel e ensacado - prod quimicos e mao de obra (u.m. por saco)
/proc1*proc2    .4, proc3     0
 proc4*proc5    .4, proc6     0
 proc7*proc8    .4, proc9     0
 proc10*proc11  .4, proc12    0
 proc13*proc14  .4, proc15    0
 proc16*proc17  .4, proc18    0
 proc19*proc20  .4, proc21    0
 proc22*proc23  .4, proc24    0/
;


***Calculo da matriz de custos agricolas do nivel 2
* ok no Appendix
parameter delta2(mm) acrescimo do valor da tonelada de cana (R$ por tc)
/Mprop 0.00, Mforn 7.00/
;

* Trs(m,w) ????



* ok no Appendix
**Estimativa de ATR total por tonelada de cana - sem considerar diferenca de tipo de cana
parameter vATR2(tt) Preco (Valor) do ATR R$ por Kg ATR
/sem1  .2932, sem2  .2932, sem3  .2852, sem4  .2852, sem5  .2852, sem6  .2852
 sem7  .2459, sem8  .2459, sem9  .2459, sem10 .2459, sem11 .2381, sem12 .2381
 sem13 .2381, sem14 .2381, sem15 .2381, sem16 .2708, sem17 .2708, sem18 .2708
 sem19 .2708, sem20 .2546, sem21 .2546, sem22 .2546, sem23 .2546, sem24 .2580
 sem25 .2580/
;
**Dados estimados (Pegar dados fornecidos pela USC)


parameter ARTa2(pp,kk,tt) ART dos acucares produzidos Conv(pa k w);
* equ (55)na Producao 2013
* equ (59)do artigo atual
ARTa2(pp,kk,tt)=(A2(pp,kk,tt)*1000*(pol2(kk)/100)*(1-(Umid2(kk)/100))*MAP2(kk,pp))/0.95;


parameter ARTe2(pp,kk,tt) ART do alcoois produzidos   Conv(pd k w) ;
* equi (57)Producao 2013
* eq (60) do artigo atual
ARTe2(pp,kk,tt)=(A2(pp,kk,tt)*1000*Fator2(pp)/(0.6475*0.865));
display ARTa2, ARTe2;

* faltando ConvM(pm,k,w)


parameters ARTproc2(kk,tt) somatorio dos ART nos produtos finais em cada processo ;
* equ (58) Producao 2013
* eq (62) do artigo atual
ARTproc2(kk,tt)=sum(pp,(ARTa2(pp,kk,tt) + ARTe2(pp,kk,tt)));
display ARTproc2;


* equ (59) Producao 2013
* equ (63) no artigo atual
parameter CK2(kk,tt) Custo dos processos R$ por tc ;
Ck2(kk,tt)=ARTproc2(kk,tt)*Cproc2
* + sum(ppa,A2(ppa,kk,tt)*MAP2(kk,ppa)*20*CustoEnsaque2(kk))
;
display CK2;


**Estimativa com base na pratica da safra 2007/08
* parametro declarado nos parametros do modelo no nivel 2
parameter atr2(tt) Acucares totais recuperaveis da cana fornecida Kg ATR por tc
/sem1  120.0, sem2  128.0, sem3  132.0, sem4  135.0, sem5  135.0, sem6  136.0
 sem7  136.0, sem8  137.0, sem9  137.0, sem10 138.0, sem11 138.0, sem12 138.0
 sem13 138.0, sem14 141.0, sem15 143.0, sem16 143.0, sem17 143.0, sem18 142.0
 sem19 139.0, sem20 137.0, sem21 135.0, sem22 135.0, sem23 133.0, sem24 133.0
 sem25 133.0/
;

* eq (60) na Producao
* eq(64) artigo atual Appendix

* Trs(m,w) ????

parameter Trs2(mm,tt);
Trs2(mm,tt) = atr2(tt);


parameter CM2(mm,tt) custo da materia-prima por fonte de suprimento propria por periodo;
* original: CM2(mm,tt)= atr2(tt)*vATR2(tt) + delta2(mm);
* modificada:
CM2(mm,tt)= Trs2(mm,tt)*vATR2(tt) + delta2(mm);
Display CM2;


***Fim do calculo da matriz de custos agricolas do nivel 2



**************************************Parametros do nivel 2

*ok!
Scalar Matr2 ATR do mel final (%) /0.5738/;

* ok!
**Estimativa com base na geracao media maxima de 10 MWh em 24 horas
scalar Ve2 Valor da energia vendida (R$ por MWh) /145/

* ok!
**Custos logisticos
table Cf2(ff,tt) Custo logistico do cct (R$ por tc)
         sem1*sem25
Fprop    9.93
Fterc    10.94
;

* Ck(kw) no apendix.


* ok!
scalar Ca2 Penalizacao por atraso /1000/;


* ok! - declarado como Ci(m)
table C02(mm,*) Previsao de colheita para toda a safra (tc)
         PSafra
Mprop    850000
Mforn    300000
;

* ok!
parameter disp2(tt) Cana propria disponivel no periodo t (tc)
/sem1*sem25  850000/;


*ok!
**Percentuais
parameter alfa2(tt) Porcentagem maximo de cana de fornecedores
/sem1*sem4  0, sem5*sem21  0.6, sem22*sem25  0.2/ ;


**Parametro fixo com o numero de dias na semana
* ok
parameter n2(tt) Numero de dias de moagem de cada usina em cada periodo (dias por semana)
/sem1  4.5, sem2 7,    sem3 6.5,  sem4 7,    sem5 6.5,  sem6 7,    sem7 6.5,  sem8 7,    sem9 6.5
 sem10 7,   sem11 6.5, sem12 7,   sem13 6.5, sem14 7,   sem15 6.5, sem16 7,   sem17 6.5, sem18 7
 sem19 6.5, sem20 7,   sem21 6.5, sem22 7,   sem23 6.5, sem24 7,   sem25 6/;
**Expectativa "inicial" de dias efetivos de cada semana

* ok!
parameter phi2(tt) Tempo aproveitado na industria
/sem1*sem25  .95833/;

**Capacidade
* ok!
scalar Mmin2 minima por periodo (tc por dia) /6500/ ;
**6480 significa moagem de 270 tc.hora em 24 horas (moagem diaria)

* ok!
scalar Mmax2 maxima por periodo (tc por dia) /8000/ ;
**8160 significa moagem de 340 tc.hora em 24 horas (moagem diaria)

* ok!
parameter rca2(pp) Repasse CRPAAA - adiantamento da cooperativa por produto por periodo (R$ por t ou m3)
/EspecialUSC  294.0, ExtraUSC  294.0, VHPUSC  281.8, AEACUSC  457.0,     AEHCUSC  438.0/
;


* ok! Ptrs(p)
parameter Patr2(pp) ATR do produto final (t por t ou m3)
/EspecialUSC  1.0505, ExtraUSC  1.0505,   VHPUSC  1.0442, AEACUSC  1.81686,    AEHCUSC  1.740947/;



* ok!
scalar rcb2 Repasse CRPAAA - adiantamento pelo ATR equivalente (R$ por kg de ATR) /0.038/ ;


* ok!
parameter rcc2(tt) Repasse CRPAAA - adiantamento extra obtido na crpaaa (R$ por sem)
/sem1*sem25 0/;


* ok!
table Gm2(mm,tt) Gasto com materia-prima por fonte de suprimento propria por periodo
         sem1*sem25
Mprop    18.94
Mforn    26
;

* ok!
table Gf2(ff,tt) Gasto com logistico do cct (R$ por tc)
         sem1*sem25
Fprop    9.93
Fterc    10.94
;

* ok!
table Gk2(kk,tt) Gastos semanais na industria (R$ por tc)
                 sem1*sem25
proc1*proc24     4.58
;

* ok!
scalar Gfixo2 Gasto fixo para rodar a safra /228000/;

* nao declarado no artigo - é o saldo no inicio da safra utilizado na restricao (23)
scalar Giro02 Saldo de caixa inicio de safra + Capital de giro inicial obtido no mercado financeiro (R$) /5000000.00/

* ok!
parameter fmax2(ff) capacidade de transporte da frota propria e contratada (tc por dia)
/Fprop    7000, Fterc 3000/
**7000 capacidade de transporte da frota propria e da frota contratada - Tudo menos spot


* ok!
table beta2(ff,tt) Disponibilidade do transporte da frota (%)
         sem1*sem17 sem18*sem25
Fprop    0.9        0.85
Fterc    1          1            ;

*ok!
parameter cpmax2(pp) capacidade de producao maxima por produto (t ou m3 por dia)
/EspecialUSC 700, ExtraUSC 700, VHPUSC  750, AEACUSC 120, AEHCUSC  210/;
**Capacidade estimada da producao maxima da USC na safra 2007/08

* ok!
scalar cfmax2 Capacidade diaria maxima de producao de toda a fabrica de acucar /750/;
**Capicidade estimada em uma media de 15000 sacos dia

*ok!
scalar cdmax2 Capacidade diaria maxima de producao de toda a destilaria /210/  ;
**Capacidade estimada em uma media diaria de 200.000 litros dia nas duas colunas

* ok!
table Fibra2(mm,tt) Fibra da cana (%)
         sem1  sem2  sem3  sem4  sem5  sem6  sem7  sem8  sem9  sem10 sem11 sem12 sem13 sem14 sem15 sem16 sem17 sem18
MProp    .122  .124  .126  .128  .13   .132  .134  .136  .138  .14   .142  .144  .146  .148  .15   .152  .154  .156
Mforn    .122  .124  .126  .128  .13   .132  .134  .136  .138  .14   .142  .144  .146  .148  .15   .152  .154  .156
+
         sem19 sem20 sem21 sem22 sem23 sem24 sem25
MProp    .158  .16   .16   .16   .16   .16   .16
Mforn    .158  .16   .16   .16   .16   .16   .16
;

* ok!
parameter ub2(tt) Umidade do bagaco (%)
/sem1*sem25 .51/ ;

* ok!
scalar eb2 Percentual de minimo de reserva de bagaco (%) /.05/ ;

* ok!
scalar Epb2 Estoque de bagaco para passagem de safra (t de bagaco) /3000/ ;

* ok!
scalar rc2 Rendimento medio das caldeiras (t vapor por t bagaco) /2.1/ ;

* ok!
**Valor estimado para rendimento da caldeira na safra - relatorio balanco de turbina
scalar rcf2 Rendimento medio da casa de forca (Mwh por t vapor) /.0763/ ;

* ok!
**Valor medio invertido da unidade de eficiencia kg vapor por kwh - 13.1 kwh/kg vapor - relatorio balanco de turbina
scalar cfvap2 Consumo fixo de vapor na moagem (t vapor por tc) /.2294/ ;

*ok!
**Representa a unidade t de vapor por tc dividida - 73.4 tv/hora para moagem e preparo - relatorio balanco de turbina
parameter cvap2(pp) Consumo de vapor servido em cada produto (t vapor por t ou m3)
/EspecialUSC 0.0105
 ExtraUSC    0.0105
 VHPUSC      0.0094
 AEACUSC     1.122
 AEHCUSC     1.000 /
;

* ok!
**Melhorar calculo de consumo por produto e TALVEZ consumo por processo
scalar cfe2 Consumo fixo de energia na moagem (mwh por tc) /0.014/  ;

*ok!
**Representa a unidade kwh por tc dividida por 1000 - 3.2 Mwh
parameter cve2(pp) Consumo de energia em cada produto (MWh por t ou m3)
/EspecialUSC 0.018
 ExtraUSC    0.018
 VHPUSC      0.015
 AEACUSC     0.095
 AEHCUSC     0.09 /
;

*ok!
**Melhorar calculo de consumo por produto e TALVEZ consumo por processo
scalar vapmax2 Producao de maxima de vapor (t vapor por dia) /4920/ ;

*ok!
**Estimativa com base na geracao media maxima de 205 t vapor hora em 24 horas
scalar egmax2 Geracao maxima de energia (MWh por dia) /240/ ;



* ok! big M
scalar G2 numero grande /1000000000/


*** nao declarados no artigo!
scalar Ib02 Estoque de bagaco inicial (t) /1500/ ;


*****************************
parameter contr_2(tt) parametro auxiliar para o controle de estoque inicial
/sem1  1, sem2*sem25  0/;
*****************************



* parametros usados na entrada do modelo do nivel 2 com os resultados do nivel 1

parameter ConvAcrpaaa(pa) conversao para cristal especial equivalente
/Standard 1, Superior 1, Especial 1, Extra 1, Refinado 1.02, VHP 0.961, VHP+ 0.961, VHPe 0.961/;

parameter ConvEcrpaaa(pd) conversao para anidro equivalente
/AEAC 1, AEHC 0.9582, AEHren 0.9582/;

parameter ConvATR(p) ATR do produto final (t por t ou m3)
/Standard  1.0473, Superior  1.0473, Especial  1.0473, Extra  1.0473, VHP  1.0442
 VHP+  1.0442,     VHPe  1.0442,     AEAC  1.8169,    AEHC  1.7409,  melaco  0.55/       ;


parameters
MargemCRPAAA Margem de contribuicao desconsiderando as penalizacoes do modelo

R1 receita total CRPAAA
R2 receita acucares CRPAAA
R3 receita alcoois CRPAAA

P1 producao total CRPAAA (ATR equivalente)
P2 producao acucares CRPAAA (cristal equivalente)
P3 producao alcoois CRPAAA (anidro equivalente)

CpPu_total

PUcrpaaaTempo(t,p) Produtcao total da crpaaa por produto no tempo
PUAcucarSafra(u,pa) Producao total por tipo de acucar e por usina (sacos)
PUAlcoolSafra(u,pd) Producao total por tipo de alcool e por usina (m3)
PUAcucarEquiv(u) Producao de acucar equivalente por usina (sacos)
PUAlcoolEquiv(u) Producao de alcool equivalente por usina (m3)
PUATRequiv(u) Producao em ATR equivalente por usina
RecUSC(p) Receita estimada para os produtos produzidos pela USC
RecUSCTotal Receita estimada total para os produtos produzidos pela USC
ProdUsina(p,u) Producao total por usina
ProdCristaEquivTotal(u)  Producao total na safra em cristal equivalente
MetaUSC(p,t) Meta de producao alocada para a USC
MetaUsina(p,u,t)
;
*****************************************Fim da definicao dos parametros do nivel 1


***Parametros de saida nivel 2 - Conv(p)
parameter ConvAcrpaaa2(ppa) conversao para cristal especial equivalente
/EspecialUSC 1, ExtraUSC 1, VHPUSC 0.961/;

parameter ConvEcrpaaa2(ppd) conversao para anidro equivalente
/AEACUSC 1, AEHCUSC 0.9582/;

parameter ConvATR2(pp) ATR do produto final (t por t ou m3)
/EspecialUSC  1.0473, ExtraUSC  1.0473, VHPUSC  1.0442, AEACUSC  1.8169, AEHCUSC  1.7409/ ;


parameters
ProdUSC2comp(pp,tt) Producao USC
RecUSC2  Receita total da USC
RecUSCpCRPAAA2 Receita USC pago pela CRPAAA
MargemUSC2 Margem de contribuicao da USC
ReceitaSemanalCRPAAA2(tt) Fluxo de receita semanal USC
CompMetaProd2(pp,tt) Comparativo entre a demanda e a producao da USC
CompMetaProdTotal2(pp) Comparativo entre a demanda e a producao da USC
VapTotal Producao total de vapor
EnergiaProdTotal Producao total de energia
EnergiaExpTotal Exportacao total de energia
ProdAcucarUSC2 Producao total de acucar na safra USC
ProdAlcoolUSC2 Producao total de alcool na safra USC
ProdAcucarEquiv2 Producao Fabrica em sacos de cristal equivalente na safra USC
ProdAlcoolEquiv2 Producao Destilaria em m3 de anidro equivalente na safra USC
ProdCristaEquivTotal2  Producao total na safra em cristal equivalente
ProdATRequiv2 Producao total em ATR ;
***Fim da definicao dos parametros de saida do nivel 2

***Calculo da meta do nivel 2
parameters
Meta2(pp,tt) Meta de producao semanal repassada pela CRPAAA (t ou m3);

