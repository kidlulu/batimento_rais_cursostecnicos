* Encoding: UTF-8.
dataset close all.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=8F#I+H+r&E/w#q!],/#)/!;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=KIDLULU;DATABASE=DB_CODEPLAN;LANGUAGE=Português (Brasil)'
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

variable labels municipio 'Município de localização do estabelecimento'.
variable labels vinculoativo3112 'Indicador de vínculo ativo em 31/12'.
variable labels tipovinculo 'Tipo de vínculo empregatício'.
variable labels motivodesligamento 'Causa do desligamento'.
variable labels tipoadmissao 'Tipo de admissão'.
variable labels tiposalario 'Tipo Salário'.
variable labels escolaridadeapos2005 'Grau de instrução '.
variable labels sexotrabalhador 'Sexo'.
variable labels nacionalidade 'Nacionalidade'.
variable labels racacor 'Raça e Cor do Trabalhador'.
variable labels indportadordefic 'Indicador se o empregado/servidor de portador de deficiência habilitado ou beneficiário reabilitado'.
variable labels naturezajuridica 'NAT JURIDICA Natureza Jurídica (CONCLA/2002) - a partir da RAIS2008'.
variable labels dataadmissaodeclarada 'Dt de ADMISSAO do trabalhador '.
variable labels vlremunmedianom 'Remuneração do trabalhador em dezembro (valor nominal)'.
variable labels vlremunmediasm 'Remuneração de dezembro em salários mínimos (quando acumulada representa massa salarial)'.
variable labels vlremundezembronom 'Remuneração média do trabalhador (valor nominal)'.
variable labels vlremundezembrosm 'Remuneração média do ano em salários mínimos (quando acumulada representa massa salarial)'.
variable labels tempoemprego 'Tempo de emprego do trabalhador (quando acumulada representa a soma dos meses)'.
variable labels qtdhoracontr 'Quantidade de horas contratuais por semana'.
variable labels vlultimaremuneracaoano 'Ultima Remuneração do trabalhador  (valor nominal)'.
variable labels vlsalariocontratual 'Salário Contratual do trabalhador  (valor nominal)'.
variable labels pis 'Pis ou Pasep do trabalhador'.
variable labels datadenascimento 'Dt de nascimento do trabalhador'.
variable labels numeroctps 'Número CTPS do trabalhador'.
variable labels cpf 'CPF do trabalhador'.
variable labels ceivinculado 'CEI VINCULADO DO ESTABELECIMENTO'.
variable labels cnpjcei 'Identificador do estabelecimento'.
variable labels cnpjraiz 'Oito primeiros digitos do CNPJ'.
variable labels nometrabalhador 'Nome do trabalhador'.
variable labels cboocupacao2002 'Classificação Brasileira de Ocupações, criada em 2002 - atualizada em 23/08/2004'.
variable labels cnae20classe 'Classe de Atividade Econômica, segundo classificação CNAE - versão 2.0'.
value labels vinculoativo3112
0 'Não'
1 'Sim'.
value labels tipovinculo
10 'Trabalhador urbano vinculado a empregador pessoa jurídica por contrato de trabalho regido pela CLT, por prazo indeterminado.'
15 'Trabalhador urbano vinculado a empregador pessoa física por contrato de trabalho regido pela CLT, por prazo indeterminado.'
20 'Trabalhador rural vinculado a empregador pessoa juridica por contrato de trabalho regido pela Lei nr. 5.889/73, por prazo indeterminado.'
25 'Trabalhador rural vinculado a empregador pessoa física por contrato de trabalho regido pela Lei nr. 5.889/73, por prazo indeterminado.'
30 'Servidor regido pelo Regime Jurídico Único (federal, estadual e municipal) e militar, vinculado a Regime Próprio de Previdência'
31 'Servidor regido pelo regime Jurídico Único (federal, estadual e municipal) e militar, vinculado ao Regime Geral de Previdência Social'
35 'Servidor publico não-efetivo (demissível ad nutum ou admitido por legislação especial, não regido pela CLT).'
40 'Trabalhador avulso (trabalho administrado pelo sindicato da categoria ou pelo órgão gestor de mão de obra) para o qual é devido depósito de FGTS - CF 88, art. 7, inciso III.'
50 'Trabalhador temporário, regido pela Lei nr. 6.019, de 3 de janeiro de 1974.'
55 'Aprendiz contratado nos termos do art. 428 da CLT, regulamentado pelo Decreto nº 5.598, de 1º de dezembro de 2005'
60 'Trabalhador urbano vinculado a empregador pessoa jurídica por contrato de trabalho regido pela CLT, por tempo determinado ou obra certa.'
65 'Trabalhador urbano vinculado a empregador pessoa física por contrato de trabalho regido pela CLT, por tempo determinado ou obra certa.'
70 'Trabalhador rural regido pela CLT vinculado a pessoa juridica por t...'
75 'Trabalhador rural regido pela CLT vinculado a pessoa fisica por tem...'
80 'Diretor sem vínculo empregatício para o qual a empresa/entidade tenha optado por recolhimento ao FGTS ou Dirigente Sindical.'
90 'Contrato de Trabalho por Prazo Determinado, regido pela Lei nr. 9.601, de 21 de janeiro de 1998.'
95 'Contrato de Trabalho por Tempo Determinado, regido pela Lei nr. 8.745, de 9 de dezembro de 1993, com a redação dada pela Lei nr. 9.849, de 26 de outubro de 1999.'
96 'Contrato de trabalho por tempo determinado, regido por Lei Estadual'
97 'Contrato de trabalho por tempo determinado, regido por Lei Municipal'.
value labels motivodesligamento
10 'Rescisão com justa causa por iniciativa do empregador ou servidor demitido'
11 'Rescisão sem justa causa por iniciativa do empregador.'
12 'Término do contrato de trabalho.'
20 'Rescisão com justa causa por iniciativa do empregado (rescisão indireta).'
21 'Rescisão sem justa causa por iniciativa do empregado ou exoneração a pedido'
22 'Posse em outro cargo inacumulável (específico para servidor público)'
30 'Transferência de empregado entre estabelecimentos da mesma empresa ou para outra empresa, com ônus para a cedente'
31 'Transferência de empregado entre estabelecimentos da mesma empresa ou para outra empresa, sem ônus para a cedente'
32 'Readaptação ou redistribuição (específico para servidor publico)'
33 'Cessão'
40 'Mudança de regime trabalhista.'
50 'Reforma de militar para a reserva remunerada.'
60 'Falecimento.'
62 'Falecimento decorrente de acidente do trabalho típico (que ocorre no exercício de atividades profissionais a serviço da empresa)'
63 'Falecimento decorrente de acidente do trabalho de trajeto (ocorrido no trajeto residência-trabalho-residência)'
64 'Falecimento decorrente de doença profissional.'
70 'Aposentadoria por tempo de serviço, com rescisão contratual.'
71 'Aposentadoria por tempo de serviço, sem rescisão contratual.'
72 'Aposentadoria por idade, com rescisão contratual.'
73 'Aposentadoria por invalidez, decorrente de acidente do trabalho.'
74 'Aposentadoria por invalidez, decorrente de doença profissional.'
75 'Aposentadoria compulsória.'
76 'Aposentadoria por invalidez, exceto a decorrente de doença profissional ou acidente do trabalho.'
78 'Aposentadoria por idade, sem rescisão contratual.'
79 'Aposentadoria especial, com rescisão contratual.'
80 'Aposentadoria especial, sem rescisão contratual.'
0 'Não desligado no ano'.
value labels tipoadmissao
1 'Admissão de empregado no prim emprego ou nomeação de servidor em caráter efe ou em comissão, no prim emprego - Atualizada na RAIS/2006'
2 'Admissão de empregado com emprego anterior (reemprego) ... - Atualizada na RAIS/2006'
3 'Transf. de empreg. oriundo de estab. da mesma empr. ..., com ônus p/ a cedente - Atualiz. na RAIS'
4 'Transf. de empreg. oriundo de estab. da mesma empr. ..., sem ônus p/ a cedente - Atualiz. na RAIS'
5 'Reintegração'
6 'Reversão, readaptação ou redistribuição (específico para servidor público)'
7 'Reversão ou readaptação (específico para servidor público)'
8 'Requisição'
9 'Exercício provisório ou exercício descentralizado de servidor oriundo do mesmo órgão/entidade ou de outro órgão/entidade'
10 'Outros casos Não previstos, inclusive encerramento de ativ.,baixa, ...'
0 'Não admitido no ano'.
value labels tiposalario
1 'Mensal'
2 'Quinzenal'
3 'Semanal'
4 'Diário'
5 'Horário'
6 'Tarefa'
7 'Outros'.
value labels escolaridadeapos2005
1 'Analfabeto'
2 'Até o 5ª ano Incompleto do Ensino Fundamental'
3 '5ª ano Completo do Ensino Fundamental'
4 'Do 6ª ao 9ª ano Incompleto do Ensino Fundamental'
5 'Ensino Fundamental Completo'
6 'Ensino Médio Incompleto'
7 'Ensino Médio Completo'
8 'Educação Superior Incompleta'
9 'Educação Superior Completa'
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
38 'Suíça'
39 'Italiana'
40 'Haitiano'
41 'Japonesa'
45 'Portuguesa'
48 'Outras Latino-Americanas'
49 'Outras Asiáticas'
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
0 'Não'.
value labels naturezajuridica
1015 'Órgão Público do Poder Executivo Federal'
1023 'Órgão Público do Poder Executivo Estadual ou do Distrito Federal'
1031 'Órgão Público do Poder Executivo Municipal'
1040 'Órgão Público do Poder Legislativo Federal'
1058 'Órgão Público do Poder Legislativo Estadual ou do Distrito Federal'
1066 'Órgão Público do Poder Legislativo Municipal'
1074 'Órgão Público do Poder Judiciário Federal'
1082 'Órgão Público do Poder Judiciário Estadual'
1104 'Autarquia Federal'
1112 'Autarquia Estadual ou do Distrito Federal'
1120 'Autarquia Municipal'
1139 'Fundação Federal'
1147 'Fundação Estadual ou do Distrito Federal'
1155 'Fundação Municipal'
1163 'Órgão Público Autônomo Federal'
1171 'Órgão Público Autônomo Estadual ou do Distrito Federal'
1180 'Órgão Público Autônomo Municipal'
1198 'Comissão Polinacional'
1201 'Fundo Público'
1210 'Associação Pública'
2011 'Empresa Pública'
2038 'Sociedade de Economia Mista'
2046 'Sociedade Anônima Aberta'
2054 'Sociedade Anônima Fechada'
2062 'Sociedade Empresária Limitada'
2070 'Sociedade Empresária em Nome Coletivo  - a partir da RAIS2008'
2076 'Sociedade Empresária em Nome Coletivo  - até a RAIS2007'
2089 'Sociedade Empresária em Comandita Simples'
2097 'Sociedade Empresária em Comandita por Ações'
2100 'Sociedade Mercantil de Capital e Indústria'
2119 'Sociedade Civil'
2127 'Sociedade em Conta de Participação'
2135 'Empresário (Individual)'
2143 'Cooperativa'
2151 'Consórcio de Sociedades'
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
2283 'Consórcio de Empregadores'
2291 'Consórcio Simples'
3034 'Serviço Notarial e Registral (Cartório)'
3042 'Organização Social (Desativado)'
3050 'Organização da Sociedade Civil de Interesse Público (Oscip) (Desativado)'
3069 'Fundação Privada'
3077 'Serviço Social Autônomo'
3085 'Condomínio Edifícios'
3093 'Unidade Executora (Programa Dinheiro Direto na Escola) (Desativado)'
3107 'Comissão de Conciliação Prévia'
3115 'Entidade de Mediação e Arbitragem'
3123 'Partido Político'
3130 'Entidade Sindical  - utilizada na RAIS 2008 e 2009'
3131 'Entidade Sindical  - até a RAIS 2007 e a partir de 2010'
3204 'Estabelecimentos, no Brasil, de Fundação ou Associação Estrangeiras'
3212 'Fundação ou Associação Domiciliada no Exterior'
3220 'Organização Religiosa'
3239 'Comunidade Indígena'
3247 'Fundo Privado'
3999 'Associação Privada'
4014 'Empresa Individual Imobiliária'
4022 'Segurado Especial'
4080 'Contribuinte individual - utilizada na RAIS 2008 e 2009'
4081 'Contribuinte individual - até a RAIS 2007 e a partir de 2010'
4090 'Candidato a Cargo Político Eletivo'
4111 'Leiloeiro'
5002 'Organização Internacional e Outras Instituições Extraterritoriais (Desativado)'
5010 'Organização Internacional'
5029 'Representação Diplomática Estrangeira'
5037 'Outras Instituições Extraterritorias'.

