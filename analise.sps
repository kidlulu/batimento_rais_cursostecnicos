* Encoding: windows-1252.
dataset close all.


GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=7v#u$H+~%z#H/~!Q,/+/-!;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=320CDL415;DATABASE=DB_CODEPLAN;LANGUAGE=Português (Brasil)'
  /SQL='select * from cursotec.concluintes'
  /ASSUMEDSTRWIDTH=255.
CACHE.
* Identificar casos duplicados.
SORT CASES BY nome(A) dt_nasc(A) cpf_aluno(A) curso(A).
MATCH FILES
  /FILE=*
  /BY nome dt_nasc cpf_aluno curso
  /FIRST=PrimaryFirst
  /LAST=PrimaryLast.
DO IF (PrimaryFirst).
COMPUTE  MatchSequence=1-PrimaryLast.
ELSE.
COMPUTE  MatchSequence=MatchSequence+1.
END IF.
LEAVE  MatchSequence.
FORMATS  MatchSequence (f7).
COMPUTE  InDupGrp=MatchSequence>0.
SORT CASES InDupGrp(D).
MATCH FILES
  /FILE=*
  /DROP=PrimaryFirst InDupGrp MatchSequence.
VARIABLE LABELS  PrimaryLast 'Indicador de cada último caso correspondente como primário'.
VALUE LABELS  PrimaryLast 0 'Caso duplicado' 1 'Caso primário'.
VARIABLE LEVEL  PrimaryLast (ORDINAL).
FREQUENCIES VARIABLES=PrimaryLast.
EXECUTE.

dataset close all.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=7v#u$H+~%z#H/~!Q,/+/-!;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=320CDL415;DATABASE=DB_CODEPLAN;LANGUAGE=Português (Brasil)'
  /SQL='select * from cursotec.concluintes_id where tp_match = 3 and vinculoativo3112 = 1 '
  /ASSUMEDSTRWIDTH=255.
CACHE.
sort cases by referencia nometrabalhador dt_nasc cpf curso.
DATASET DECLARE tp_match_3.
AGGREGATE
  /OUTFILE='tp_match_3'
  /PRESORTED
  /BREAK=referencia nometrabalhador dt_nasc cpf curso
  /tp_match=max(tp_match).


GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=7v#u$H+~%z#H/~!Q,/+/-!;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=320CDL415;DATABASE=DB_CODEPLAN;LANGUAGE=Português (Brasil)'
  /SQL='select * from cursotec.concluintes_id where tp_match = 2 and vinculoativo3112 = 1 '
  /ASSUMEDSTRWIDTH=255.
CACHE.
sort cases by referencia nometrabalhador dt_nasc cpf curso.
DATASET DECLARE tp_match_2.
AGGREGATE
  /OUTFILE='tp_match_2'
  /PRESORTED
  /BREAK=referencia nometrabalhador dt_nasc cpf curso
  /tp_match=max(tp_match).


GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=7v#u$H+~%z#H/~!Q,/+/-!;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=320CDL415;DATABASE=DB_CODEPLAN;LANGUAGE=Português (Brasil)'
  /SQL='select * from cursotec.concluintes_id where tp_match = 1 and vinculoativo3112 = 1 '
  /ASSUMEDSTRWIDTH=255.
CACHE.
sort cases by referencia nometrabalhador dt_nasc cpf curso.
DATASET DECLARE tp_match_1.
AGGREGATE
  /OUTFILE='tp_match_1'
  /PRESORTED
  /BREAK=referencia nometrabalhador dt_nasc cpf curso
  /tp_match=max(tp_match).


DATASET ACTIVATE tp_match_1.
MATCH FILES /FILE=*
  /FILE='tp_match_2'
  /RENAME (tp_match = tp_match_2) 
  /BY referencia nometrabalhador dt_nasc cpf curso.
EXECUTE.

DATASET ACTIVATE tp_match_1.
MATCH FILES /FILE=*
  /FILE='tp_match_3'
  /RENAME (tp_match = tp_match_3) 
  /BY referencia nometrabalhador dt_nasc cpf curso.

recode tp_match (SYSMIS=0) (ELSE=1).
recode tp_match_2 (SYSMIS=0) (ELSE=2).
recode tp_match_3 (SYSMIS=0) (ELSE=3).

string match (a5).
compute match = concate(ltrim(rtrim(string(tp_match,f1))),'|',ltrim(rtrim(string(tp_match_2,f1))),'|',ltrim(rtrim(string(tp_match_3,f1)))).

 * SORT CASES  BY referencia.
 * SPLIT FILE SEPARATE BY referencia.

FREQUENCIES VARIABLES=match
  /ORDER=ANALYSIS.

 * SPLIT FILE OFF.
 * EXECUTE.

 * select if any(match,'0|0|3','1|2|3').

FREQUENCIES VARIABLES=cpf
  /ORDER=ANALYSIS.


*01 - Caracterização da relação de concluintes.

dataset close all.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=7v#u$H+~%z#H/~!Q,/+/-!;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=320CDL415;DATABASE=DB_CODEPLAN;LANGUAGE=Português (Brasil)'
  /SQL='select * from cursotec.concluintes'
  /ASSUMEDSTRWIDTH=255.
CACHE.

variable labels ano_conc "Ano de conclusão" curso "Curso concluído".

* Tabela 01 - Distribuição do número de concluintes analisados, por ano, segundo o curso concluído.
CTABLES
  /VLABELS VARIABLES=curso DISPLAY=NONE  /VLABELS VARIABLES=ano_conc DISPLAY=LABEL
  /TABLE curso [C] BY ano_conc [C][COUNT 'Qtd.' DOT40.0]
  /CATEGORIES VARIABLES=curso ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=ano_conc ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /TITLES
    CORNER='Curso concluído'
    CAPTION='Fonte: Escola Técnica de Planaltina'.


*02 - Caracterização da dos concluintes segundo a RAIS.

dataset close all.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=7v#u$H+~%z#H/~!Q,/+/-!;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=320CDL415;DATABASE=DB_CODEPLAN;LANGUAGE=Português (Brasil)'
  /SQL='select * from cursotec.concluintes_id where vinculoativo3112 = 1'
  /ASSUMEDSTRWIDTH=255.
CACHE.

SORT CASES BY cpf referencia.

AGGREGATE
  /OUTFILE=*
  /PRESORTED
  /BREAK=referencia cpf
  /escolaridade=last(escolaridade)
  /sexotrabalhador=last(sexotrabalhador)
  /nacionalidade=last(nacionalidade)
  /racacor=last(racacor)
  /dtnascimento=last(dtnascimento)
  /qtd_empregos=N.

do if (char.length(dtnascimento) < 8).
  compute idade = number(dtnascimento,f2).
else.
  do if (referencia = 2010).
    compute idade = datediff(DATE.DMY(31,12,2010),DATE.DMY(number(char.substr(dtnascimento,1,2),f2),number(char.substr(dtnascimento,3,2),f2),number(char.substr(dtnascimento,5,4),f4)),'years').
  else if (referencia = 2011).
    compute idade = number(dtnascimento,F2).
  else if (referencia = 2012).
    compute idade = number(dtnascimento,F2).
  else if (referencia = 2013).
    compute idade = number(dtnascimento,F2).
  else if (referencia = 2014).
    compute idade = datediff(DATE.DMY(31,12,2014),DATE.DMY(number(char.substr(dtnascimento,1,2),f2),number(char.substr(dtnascimento,3,2),f2),number(char.substr(dtnascimento,5,4),f4)),'years').
  else if (referencia = 2015).
    compute idade = datediff(DATE.DMY(31,12,2015),DATE.DMY(number(char.substr(dtnascimento,1,2),f2),number(char.substr(dtnascimento,3,2),f2),number(char.substr(dtnascimento,5,4),f4)),'years').
  else if (referencia = 2016).
    compute idade = datediff(DATE.DMY(31,12,2016),DATE.DMY(number(char.substr(dtnascimento,1,2),f2),number(char.substr(dtnascimento,3,2),f2),number(char.substr(dtnascimento,5,4),f4)),'years').
  else if (referencia = 2017).
    compute idade = datediff(DATE.DMY(31,12,2017),DATE.DMY(number(char.substr(dtnascimento,1,2),f2),number(char.substr(dtnascimento,3,2),f2),number(char.substr(dtnascimento,5,4),f4)),'years').
  end if.
end if.

RECODE idade 
(	0	 thru 	24	 = 	1	)
(	25	 thru 	29	 = 	2	)
(	30	 thru 	34	 = 	3	)
(	35	 thru 	39	 = 	4	)
(	40	 thru 	44	 = 	5	)
(	45	 thru 	49	 = 	6	)
(	50	 thru 	54	 = 	7	)
(	55	 thru 	200	 = 	8	)
INTO 
fx_idade.
variable labels fx_idade 'Faixas de idade'.
variable level fx_idade (ordinal).
value labels fx_idade 
1 'Até 24 anos'
2 '25 a 29 anos'
3 '30 a 34 anos'
4 '35 a 39 anos'
5 '40 a 44 anos'
6 '45 a 49 anos'
7 '50 a 54 anos'
8 '55 anos ou mais'.

VARIABLE LABELS qtd_empregos 'Quantidade de vínculos'.
VALUE LABELS qtd_empregos 1 'Um vinculo' 2 '2 vínculos'.

recode racacor (1=1) (4=1) (8=1) (2=2) (6=2) (else=9).
value labels  racacor 1 'Negro' 2 'Não negro' 9 'Não informado'.

recode escolaridade (1=1) (2=2)	(3=2)	(4=2) (5=3) (6=4)	(7=5) (8=6) (9=7) (10=7) (11=7) (else=9).
value labels  escolaridade 
1 'Analfabeto' 
2 'Fundamental incompleto' 
3 'Fundamental completo' 
4 'Médio incompleto' 
5 'Médio completo' 
6 'Superior incompleto' 
7 'Superior completo' 
9 'Não informado'.

RECODE idade 
(	0	 thru 	24	 = 	1	)
(	25	 thru 	29	 = 	2	)
(	30	 thru 	34	 = 	3	)
(	35	 thru 	39	 = 	4	)
(	40	 thru 	44	 = 	5	)
(	45	 thru 	49	 = 	6	)
(	50	 thru 	54	 = 	7	)
(	55	 thru 	200	 = 	8	)
INTO 
fx_idade.
variable labels fx_idade 'Faixas de idade'.
variable level fx_idade (ordinal).
value labels fx_idade 
1 'Até 24 anos'
2 '25 a 29 anos'
3 '30 a 34 anos'
4 '35 a 39 anos'
5 '40 a 44 anos'
6 '45 a 49 anos'
7 '50 a 54 anos'
8 '55 anos ou mais'.

VARIABLE LABELS qtd_empregos 'Quantidade de vínculos'.
VALUE LABELS qtd_empregos 1 'Um vinculo' 2 '2 vínculos'.

variable labels sexotrabalhador 'Sexo'.
value labels sexotrabalhador 1 'Masculino'
2 'Feminino'.

variable labels racacor 'Raça e Cor'.
value labels racacor 1 'Índigena'
2 'Branca'
4 'Preta'
6 'Amarela'
8 'Parda'
9 'Não informado'.

recode racacor (1=1) (4=1) (8=1) (2=2) (6=2) (else=9).
value labels  racacor 1 'Negro' 2 'Não negro' 9 'Não informado'.

recode escolaridade (1=1) (2=2)	(3=2)	(4=2) (5=3) (6=4)	(7=5) (8=6) (9=7) (10=7) (11=7) (else=9).
value labels  escolaridade 
1 'Analfabeto' 
2 'Fundamental incompleto' 
3 'Fundamental completo' 
4 'Médio incompleto' 
5 'Médio completo' 
6 'Superior incompleto' 
7 'Superior completo' 
9 'Não informado'.

* Tabelas customizadas.
CTABLES
  /VLABELS VARIABLES=referencia DISPLAY=NONE
  /VLABELS VARIABLES=idade sexotrabalhador racacor escolaridade DISPLAY=LABEL
  /TABLE referencia [C] BY idade [MEAN] + sexotrabalhador [COUNT F40.0] + racacor [C][COUNT F40.0] + escolaridade [COUNT F40.0]
  /CATEGORIES VARIABLES=referencia ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES= sexotrabalhador racacor ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES= escolaridade [1,2,3,4,5,6,7] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.

* Tabelas customizadas.
CTABLES
  /VLABELS VARIABLES=referencia DISPLAY=NONE  /VLABELS VARIABLES=estatus DISPLAY=LABEL
  /TABLE referencia [C][COUNT DOT40.0] BY qtd_empregos [C]
  /CATEGORIES VARIABLES=referencia ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=qtd_empregos ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER.

* Tabelas customizadas.
CTABLES
  /VLABELS VARIABLES=referencia DISPLAY=NONE  /VLABELS VARIABLES=estatus DISPLAY=LABEL
  /TABLE referencia [C][COUNT DOT40.0] BY estatus [C]
  /CATEGORIES VARIABLES=referencia ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=estatus ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER.


