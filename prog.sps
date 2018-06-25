* Encoding: windows-1252.
dataset close all.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=8F#I+H+r&E/w#q!],/#)/!;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=KIDLULU;DATABASE=DB_CODEPLAN;LANGUAGE=Portugu�s (Brasil)'
  /SQL="SELECT * FROM DB_CODEPLAN.rais_id.Vinc2014"
  /ASSUMEDSTRWIDTH=255.
CACHE.

save outfile = 'C:\Users\kidlulu\Documents\codeplan\aval_curso_tec\rais2014.sav' /compressed.

get file = 'C:\Users\kidlulu\Documents\codeplan\aval_curso_tec\rais2014.sav'.

STRING PRIMEIRO (A18).
COMPUTE PRIMEIRO = CHAR.SUBSTR(nometrabalhador,1,CHAR.INDEX(nometrabalhador,' ')-1) .
VECTOR V (11,A15).
STRING #COPIA(A100).
COMPUTE #COPIA =nometrabalhador.
loop #i=1 to 11.
  do if #i=1.
    compute #branco = CHAR.INDEX(#copia,' ').
    compute v(1) = char.substr(#copia,2,#branco-2).
    compute #copia = ltrim(substr(#copia,#branco)).
  else if #i>=2 and #i<=11.
    compute #branco = CHAR.INDEX(#copia,' ').
    compute v(#i) = char.substr(#copia,1,#branco-1).
    compute #copia = ltrim(char.substr(#copia,#branco)).
  end if.
end loop.
EXECUTE.

STRING ULTIMO(A15).
do if (v11<>'').
  compute ultimo = v11.
else if (v10<>'' and v11='').
  compute ultimo = v10.
else if (v9<>'' and v10='').
  compute ultimo = v9.
else if (v8<>'' and v9='').
  compute ultimo = v8.
else if (v7<>'' and v8='').
  compute ultimo = v7.
else if (v6<>'' and v7='').
  compute ultimo = v6.
else if (v5<>'' and v6='').
  compute ultimo = v5.
else if (v4<>'' and v5='').
  compute ultimo = v4.
else if (v3<>'' and v4='').
  compute ultimo = v3.
else if (v2<>'' and v3='').
  compute ultimo = v2.
end if.

STRING LETRA1 LETRA2 LETRA3 LETRA4 LETRA5 LETRA6 LETRA7 LETRA8 LETRA9 (A1).
if (v2<>'') letra1 = rtrim(ltrim(substr(v2,1))).
if (v3<>'') letra2 = rtrim(ltrim(substr(v3,1))).
if (v4<>'') letra3 = rtrim(ltrim(substr(v4,1))).
if (v5<>'') letra4 = rtrim(ltrim(substr(v5,1))).
if (v6<>'') letra5 = rtrim(ltrim(substr(v6,1))).
if (v7<>'') letra6 = rtrim(ltrim(substr(v7,1))).
if (v8<>'') letra7 = rtrim(ltrim(substr(v8,1))).
if (v9<>'') letra8 = rtrim(ltrim(substr(v9,1))).
if (v10<>'') letra9 = rtrim(ltrim(substr(v10,1))).

if (v2<>'' and v3='') letra1 = ''.
if (v3<>'' and v4='') letra2 = ''.
if (v4<>'' and v5='') letra3 = ''.
if (v5<>'' and v6='') letra4 = ''.
if (v6<>'' and v7='') letra5 = ''.
if (v7<>'' and v8='') letra6 = ''.
if (v8<>'' and v9='') letra7 = ''.
if (v9<>'' and v10='') letra8 = ''.
if (v10<>'' and v11 = '') letra9 = ''.

STRING MATCHCODE (A40).
COMPUTE MATCHCODE = REPLACE(CONCAT(PRIMEIRO,ULTIMO,LETRA1,LETRA2,LETRA3,LETRA4,LETRA5,LETRA6,LETRA7,LETRA8,LETRA9),' ','').

save outfile = 'C:\Users\kidlulu\Documents\codeplan\aval_curso_tec\tmp.sav' /compressed.

get file = 'C:\Users\kidlulu\Documents\codeplan\aval_curso_tec\tmp.sav'
  /keep = municipio vinculoativo3112 tipovinculo motivodesligamento tipoadmissao tiposalario escolaridadeapos2005 
sexotrabalhador nacionalidade racacor indportadordefic naturezajuridica dataadmissaodeclarada vlremunmedianom 
vlremunmediasm vlremundezembronom vlremundezembrosm tempoemprego qtdhoracontr vlultimaremuneracaoano 
vlsalariocontratual pis datadenascimento numeroctps cpf ceivinculado cnpjcei cnpjraiz nometrabalhador 
cboocupacao2002 cnae20subclasse MATCHCODE.

SORT CASES BY MATCHCODE (A).

DATASET NAME rais.

EXECUTE.


GET DATA  /TYPE=TXT
  /FILE="C:\Users\kidlulu\Documents\codeplan\aval_curso_tec\LISTA DE CONCLUINTES 2014.txt"
  /ENCODING='UTF8'
  /DELCASE=LINE
  /DELIMITERS="\t"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  nometrabalhador A42
  datadenascimento A8
  cpf A11
  curso A31.
CACHE.

STRING PRIMEIRO (A18).
COMPUTE PRIMEIRO = CHAR.SUBSTR(nometrabalhador,1,CHAR.INDEX(nometrabalhador,' ')-1) .
VECTOR V (11,A15).
STRING #COPIA(A100).
COMPUTE #COPIA =nometrabalhador.
loop #i=1 to 11.
  do if #i=1.
    compute #branco = index(#copia,' ').
    compute v(1) = char.substr(#copia,2,#branco-2).
    compute #copia = ltrim(substr(#copia,#branco)).
  else if #i>=2 and #i<=11.
    compute #branco = index(#copia,' ').
    compute v(#i) = char.substr(#copia,1,#branco-1).
    compute #copia = ltrim(char.substr(#copia,#branco)).
  end if.
end loop.
EXECUTE.

STRING ULTIMO(A15).
do if (v11<>'').
  compute ultimo = v11.
else if (v10<>'' and v11='').
  compute ultimo = v10.
else if (v9<>'' and v10='').
  compute ultimo = v9.
else if (v8<>'' and v9='').
  compute ultimo = v8.
else if (v7<>'' and v8='').
  compute ultimo = v7.
else if (v6<>'' and v7='').
  compute ultimo = v6.
else if (v5<>'' and v6='').
  compute ultimo = v5.
else if (v4<>'' and v5='').
  compute ultimo = v4.
else if (v3<>'' and v4='').
  compute ultimo = v3.
else if (v2<>'' and v3='').
  compute ultimo = v2.
end if.

STRING LETRA1 LETRA2 LETRA3 LETRA4 LETRA5 LETRA6 LETRA7 LETRA8 LETRA9 (A1).
if (v2<>'') letra1 = rtrim(ltrim(substr(v2,1))).
if (v3<>'') letra2 = rtrim(ltrim(substr(v3,1))).
if (v4<>'') letra3 = rtrim(ltrim(substr(v4,1))).
if (v5<>'') letra4 = rtrim(ltrim(substr(v5,1))).
if (v6<>'') letra5 = rtrim(ltrim(substr(v6,1))).
if (v7<>'') letra6 = rtrim(ltrim(substr(v7,1))).
if (v8<>'') letra7 = rtrim(ltrim(substr(v8,1))).
if (v9<>'') letra8 = rtrim(ltrim(substr(v9,1))).
if (v10<>'') letra9 = rtrim(ltrim(substr(v10,1))).

if (v2<>'' and v3='') letra1 = ''.
if (v3<>'' and v4='') letra2 = ''.
if (v4<>'' and v5='') letra3 = ''.
if (v5<>'' and v6='') letra4 = ''.
if (v6<>'' and v7='') letra5 = ''.
if (v7<>'' and v8='') letra6 = ''.
if (v8<>'' and v9='') letra7 = ''.
if (v9<>'' and v10='') letra8 = ''.
if (v10<>'' and v11 = '') letra9 = ''.

STRING MATCHCODE (A40).
COMPUTE MATCHCODE = REPLACE(CONCAT(PRIMEIRO,ULTIMO,LETRA1,LETRA2,LETRA3,LETRA4,LETRA5,LETRA6,LETRA7,LETRA8,LETRA9),' ','').

SORT CASES BY MATCHCODE (A).

DELETE VARIABLES PRIMEIRO,ULTIMO,LETRA1,LETRA2,LETRA3,LETRA4,LETRA5,LETRA6,LETRA7,LETRA8,LETRA9,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11.

DATASET NAME form.

EXECUTE.


DATASET ACTIVATE rais.
MATCH FILES /FILE=*
  /TABLE='form'
  /RENAME cpf=cpf_form datadenascimento=datadenascimento_form nometrabalhador=nomeform
  /BY MATCHCODE.
select if curso <> ''.
if (datadenascimento = datadenascimento_form) dtnasc_comp = 1.
if (cpf = cpf_form) cpf_comp = 1.
EXECUTE.

FILTER OFF.
USE ALL.
SELECT IF (dtnasc_comp = 1 | cpf_comp = 1).

save outfile = 'C:\Users\kidlulu\Documents\codeplan\aval_curso_tec\final.sav' /compressed.

dataset close all.

get file = 'C:\Users\kidlulu\Documents\codeplan\aval_curso_tec\final.sav'.

ALTER TYPE ALL (A=AMIN).

ALTER TYPE escolaridadeapos2005 (F2) indportadordefic (F1) motivodesligamento (F2) nacionalidade (F2) naturezajuridica (F4) 
                     racacor (F2) sexotrabalhador (F2) tipoadmissao (F2) tiposalario (F2) tipovinculo (F2) vinculoativo3112 (F2).

variable labels municipio 'Munic�pio de localiza��o do estabelecimento'.
variable labels vinculoativo3112 'Indicador de v�nculo ativo em 31/12'.
variable labels tipovinculo 'Tipo de v�nculo empregat�cio'.
variable labels motivodesligamento 'Causa do desligamento'.
variable labels tipoadmissao 'Tipo de admiss�o'.
variable labels tiposalario 'Tipo Sal�rio'.
variable labels escolaridadeapos2005 'Grau de instru��o '.
variable labels sexotrabalhador 'Sexo'.
variable labels nacionalidade 'Nacionalidade'.
variable labels racacor 'Ra�a e Cor do Trabalhador'.
variable labels indportadordefic 'Indicador se o empregado/servidor de portador de defici�ncia habilitado ou benefici�rio reabilitado'.
variable labels naturezajuridica 'NAT JURIDICA Natureza Jur�dica (CONCLA/2002) - a partir da RAIS2008'.
variable labels dataadmissaodeclarada 'Dt de ADMISSAO do trabalhador '.
variable labels vlremunmedianom 'Remunera��o do trabalhador em dezembro (valor nominal)'.
variable labels vlremunmediasm 'Remunera��o de dezembro em sal�rios m�nimos (quando acumulada representa massa salarial)'.
variable labels vlremundezembronom 'Remunera��o m�dia do trabalhador (valor nominal)'.
variable labels vlremundezembrosm 'Remunera��o m�dia do ano em sal�rios m�nimos (quando acumulada representa massa salarial)'.
variable labels tempoemprego 'Tempo de emprego do trabalhador (quando acumulada representa a soma dos meses)'.
variable labels qtdhoracontr 'Quantidade de horas contratuais por semana'.
variable labels vlultimaremuneracaoano 'Ultima Remunera��o do trabalhador  (valor nominal)'.
variable labels vlsalariocontratual 'Sal�rio Contratual do trabalhador  (valor nominal)'.
variable labels pis 'Pis ou Pasep do trabalhador'.
variable labels datadenascimento 'Dt de nascimento do trabalhador'.
variable labels numeroctps 'N�mero CTPS do trabalhador'.
variable labels cpf 'CPF do trabalhador'.
variable labels ceivinculado 'CEI VINCULADO DO ESTABELECIMENTO'.
variable labels cnpjcei 'Identificador do estabelecimento'.
variable labels cnpjraiz 'Oito primeiros digitos do CNPJ'.
variable labels nometrabalhador 'Nome do trabalhador'.
variable labels cboocupacao2002 'Classifica��o Brasileira de Ocupa��es, criada em 2002 - atualizada em 23/08/2004'.
variable labels cnae20subclasse 'Subclasse de Atividade Econ�mica, segundo classifica��o CNAE - vers�o 2.0'.
value labels vinculoativo3112
0 'N�o'
1 'Sim'.
value labels tipovinculo
10 'Trabalhador urbano vinculado a empregador pessoa jur�dica por contrato de trabalho regido pela CLT, por prazo indeterminado.'
15 'Trabalhador urbano vinculado a empregador pessoa f�sica por contrato de trabalho regido pela CLT, por prazo indeterminado.'
20 'Trabalhador rural vinculado a empregador pessoa juridica por contrato de trabalho regido pela Lei nr. 5.889/73, por prazo indeterminado.'
25 'Trabalhador rural vinculado a empregador pessoa f�sica por contrato de trabalho regido pela Lei nr. 5.889/73, por prazo indeterminado.'
30 'Servidor regido pelo Regime Jur�dico �nico (federal, estadual e municipal) e militar, vinculado a Regime Pr�prio de Previd�ncia'
31 'Servidor regido pelo regime Jur�dico �nico (federal, estadual e municipal) e militar, vinculado ao Regime Geral de Previd�ncia Social'
35 'Servidor publico n�o-efetivo (demiss�vel ad nutum ou admitido por legisla��o especial, n�o regido pela CLT).'
40 'Trabalhador avulso (trabalho administrado pelo sindicato da categoria ou pelo �rg�o gestor de m�o de obra) para o qual � devido dep�sito de FGTS - CF 88, art. 7, inciso III.'
50 'Trabalhador tempor�rio, regido pela Lei nr. 6.019, de 3 de janeiro de 1974.'
55 'Aprendiz contratado nos termos do art. 428 da CLT, regulamentado pelo Decreto n� 5.598, de 1� de dezembro de 2005'
60 'Trabalhador urbano vinculado a empregador pessoa jur�dica por contrato de trabalho regido pela CLT, por tempo determinado ou obra certa.'
65 'Trabalhador urbano vinculado a empregador pessoa f�sica por contrato de trabalho regido pela CLT, por tempo determinado ou obra certa.'
70 'Trabalhador rural regido pela CLT vinculado a pessoa juridica por t...'
75 'Trabalhador rural regido pela CLT vinculado a pessoa fisica por tem...'
80 'Diretor sem v�nculo empregat�cio para o qual a empresa/entidade tenha optado por recolhimento ao FGTS ou Dirigente Sindical.'
90 'Contrato de Trabalho por Prazo Determinado, regido pela Lei nr. 9.601, de 21 de janeiro de 1998.'
95 'Contrato de Trabalho por Tempo Determinado, regido pela Lei nr. 8.745, de 9 de dezembro de 1993, com a reda��o dada pela Lei nr. 9.849, de 26 de outubro de 1999.'
96 'Contrato de trabalho por tempo determinado, regido por Lei Estadual'
97 'Contrato de trabalho por tempo determinado, regido por Lei Municipal'.
value labels motivodesligamento
10 'Rescis�o com justa causa por iniciativa do empregador ou servidor demitido'
11 'Rescis�o sem justa causa por iniciativa do empregador.'
12 'T�rmino do contrato de trabalho.'
20 'Rescis�o com justa causa por iniciativa do empregado (rescis�o indireta).'
21 'Rescis�o sem justa causa por iniciativa do empregado ou exonera��o a pedido'
22 'Posse em outro cargo inacumul�vel (espec�fico para servidor p�blico)'
30 'Transfer�ncia de empregado entre estabelecimentos da mesma empresa ou para outra empresa, com �nus para a cedente'
31 'Transfer�ncia de empregado entre estabelecimentos da mesma empresa ou para outra empresa, sem �nus para a cedente'
32 'Readapta��o ou redistribui��o (espec�fico para servidor publico)'
33 'Cess�o'
40 'Mudan�a de regime trabalhista.'
50 'Reforma de militar para a reserva remunerada.'
60 'Falecimento.'
62 'Falecimento decorrente de acidente do trabalho t�pico (que ocorre no exerc�cio de atividades profissionais a servi�o da empresa)'
63 'Falecimento decorrente de acidente do trabalho de trajeto (ocorrido no trajeto resid�ncia-trabalho-resid�ncia)'
64 'Falecimento decorrente de doen�a profissional.'
70 'Aposentadoria por tempo de servi�o, com rescis�o contratual.'
71 'Aposentadoria por tempo de servi�o, sem rescis�o contratual.'
72 'Aposentadoria por idade, com rescis�o contratual.'
73 'Aposentadoria por invalidez, decorrente de acidente do trabalho.'
74 'Aposentadoria por invalidez, decorrente de doen�a profissional.'
75 'Aposentadoria compuls�ria.'
76 'Aposentadoria por invalidez, exceto a decorrente de doen�a profissional ou acidente do trabalho.'
78 'Aposentadoria por idade, sem rescis�o contratual.'
79 'Aposentadoria especial, com rescis�o contratual.'
80 'Aposentadoria especial, sem rescis�o contratual.'
0 'N�o desligado no ano'.
value labels tipoadmissao
1 'Admiss�o de empregado no prim emprego ou nomea��o de servidor em car�ter efe ou em comiss�o, no prim emprego - Atualizada na RAIS/2006'
2 'Admiss�o de empregado com emprego anterior (reemprego) ... - Atualizada na RAIS/2006'
3 'Transf. de empreg. oriundo de estab. da mesma empr. ..., com �nus p/ a cedente - Atualiz. na RAIS'
4 'Transf. de empreg. oriundo de estab. da mesma empr. ..., sem �nus p/ a cedente - Atualiz. na RAIS'
5 'Reintegra��o'
6 'Revers�o, readapta��o ou redistribui��o (espec�fico para servidor p�blico)'
7 'Revers�o ou readapta��o (espec�fico para servidor p�blico)'
8 'Requisi��o'
9 'Exerc�cio provis�rio ou exerc�cio descentralizado de servidor oriundo do mesmo �rg�o/entidade ou de outro �rg�o/entidade'
10 'Outros casos N�o previstos, inclusive encerramento de ativ.,baixa, ...'
0 'N�o admitido no ano'.
value labels tiposalario
1 'Mensal'
2 'Quinzenal'
3 'Semanal'
4 'Di�rio'
5 'Hor�rio'
6 'Tarefa'
7 'Outros'.
value labels escolaridadeapos2005
1 'Analfabeto'
2 'At� o 5� ano Incompleto do Ensino Fundamental'
3 '5� ano Completo do Ensino Fundamental'
4 'Do 6� ao 9� ano Incompleto do Ensino Fundamental'
5 'Ensino Fundamental Completo'
6 'Ensino M�dio Incompleto'
7 'Ensino M�dio Completo'
8 'Educa��o Superior Incompleta'
9 'Educa��o Superior Completa'
10 'Mestrado Completo'
11 'Doutorado Completo'.
value labels sexotrabalhador
1 'Masculino'
2 'Feminino'.
value labels nacionalidade
10 'Brasileira'
20 'Naturalidade Brasileira'
21 'Argentina'
22 'Boliviana'
23 'Chilena'
24 'Paraguaia'
25 'Uruguaia'
26 'Venezuelano'
27 'Colombiano'
28 'Peruano'
29 'Equatoriano'
34 'Canadense'
35 'Espanhola'
36 'Norte-Americana'
37 'Francesa'
38 'Su��a'
39 'Italiana'
40 'Haitiano'
41 'Japonesa'
45 'Portuguesa'
48 'Outras Latino-Americanas'
49 'Outras Asi�ticas'
51 'Outros Europeus'
60 'Angolano'
62 'Sul-Africano'
70 'Outros Africanos'
80 'Outros'.
value labels racacor
1 'Indigena'
2 'Branca'
4 'Preta'
6 'Amarela'
8 'Parda'
9 'N/I'.
value labels indportadordefic
1 'Sim'
0 'N�o'.
value labels naturezajuridica
1015 '�rg�o P�blico do Poder Executivo Federal'
1023 '�rg�o P�blico do Poder Executivo Estadual ou do Distrito Federal'
1031 '�rg�o P�blico do Poder Executivo Municipal'
1040 '�rg�o P�blico do Poder Legislativo Federal'
1058 '�rg�o P�blico do Poder Legislativo Estadual ou do Distrito Federal'
1066 '�rg�o P�blico do Poder Legislativo Municipal'
1074 '�rg�o P�blico do Poder Judici�rio Federal'
1082 '�rg�o P�blico do Poder Judici�rio Estadual'
1104 'Autarquia Federal'
1112 'Autarquia Estadual ou do Distrito Federal'
1120 'Autarquia Municipal'
1139 'Funda��o Federal'
1147 'Funda��o Estadual ou do Distrito Federal'
1155 'Funda��o Municipal'
1163 '�rg�o P�blico Aut�nomo Federal'
1171 '�rg�o P�blico Aut�nomo Estadual ou do Distrito Federal'
1180 '�rg�o P�blico Aut�nomo Municipal'
1198 'Comiss�o Polinacional'
1201 'Fundo P�blico'
1210 'Associa��o P�blica'
2011 'Empresa P�blica'
2038 'Sociedade de Economia Mista'
2046 'Sociedade An�nima Aberta'
2054 'Sociedade An�nima Fechada'
2062 'Sociedade Empres�ria Limitada'
2070 'Sociedade Empres�ria em Nome Coletivo  - a partir da RAIS2008'
2076 'Sociedade Empres�ria em Nome Coletivo  - at� a RAIS2007'
2089 'Sociedade Empres�ria em Comandita Simples'
2097 'Sociedade Empres�ria em Comandita por A��es'
2100 'Sociedade Mercantil de Capital e Ind�stria'
2119 'Sociedade Civil'
2127 'Sociedade em Conta de Participa��o'
2135 'Empres�rio (Individual)'
2143 'Cooperativa'
2151 'Cons�rcio de Sociedades'
2160 'Grupo de Sociedades'
2178 'Estabelecimentos, no Brasil, de Sociedade Estrangeira'
2194 'Estabelecimento, no Brasil, de Empresa Binacional Argentino-Brasileira'
2208 'Entidade Binacional Itaipu (Desativado)'
2216 'Empresa Domiciliada no Exterior'
2224 'Clube/Fundo de Investimento'
2232 'Sociedade Simples Pura'
2240 'Sociedade Simples Limitada'
2259 'Sociedade Simples em Nomes Coletivo'
2267 'Sociedade Simples em Comandita Simples'
2275 'Empresa Binacional'
2283 'Cons�rcio de Empregadores'
2291 'Cons�rcio Simples'
3034 'Servi�o Notarial e Registral (Cart�rio)'
3042 'Organiza��o Social (Desativado)'
3050 'Organiza��o da Sociedade Civil de Interesse P�blico (Oscip) (Desativado)'
3069 'Funda��o Privada'
3077 'Servi�o Social Aut�nomo'
3085 'Condom�nio Edif�cios'
3093 'Unidade Executora (Programa Dinheiro Direto na Escola) (Desativado)'
3107 'Comiss�o de Concilia��o Pr�via'
3115 'Entidade de Media��o e Arbitragem'
3123 'Partido Pol�tico'
3130 'Entidade Sindical  - utilizada na RAIS 2008 e 2009'
3131 'Entidade Sindical  - at� a RAIS 2007 e a partir de 2010'
3204 'Estabelecimentos, no Brasil, de Funda��o ou Associa��o Estrangeiras'
3212 'Funda��o ou Associa��o Domiciliada no Exterior'
3220 'Organiza��o Religiosa'
3239 'Comunidade Ind�gena'
3247 'Fundo Privado'
3999 'Associa��o Privada'
4014 'Empresa Individual Imobili�ria'
4022 'Segurado Especial'
4080 'Contribuinte individual - utilizada na RAIS 2008 e 2009'
4081 'Contribuinte individual - at� a RAIS 2007 e a partir de 2010'
4090 'Candidato a Cargo Pol�tico Eletivo'
4111 'Leiloeiro'
5002 'Organiza��o Internacional e Outras Institui��es Extraterritoriais (Desativado)'
5010 'Organiza��o Internacional'
5029 'Representa��o Diplom�tica Estrangeira'
5037 'Outras Institui��es Extraterritorias'.

SORT CASES BY nomeform(A) datadenascimento_form(A).

dataset name base.

DATASET DECLARE b1.
AGGREGATE
  /OUTFILE='b1'
  /PRESORTED
  /BREAK=nomeform datadenascimento_form
  /dtnasc_comp_max=MAX(dtnasc_comp) 
  /cpf_comp_max=MAX(cpf_comp).

