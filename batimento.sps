* Encoding: windows-1252.
dataset close all.
GET DATA  /TYPE=TXT
  /FILE="D:\Users\lrube\Documents\codeplan\aval_curso_tec\LISTA DE CONCLUINTES 2014 2013 2012.txt"    
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS="|"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  nometrabalhador A255
  DTNASC A255
  CURSO A255
  cpf_concluinte A255
  ANOCONCLUSAO A255.
CACHE.
STRING PRIMEIRO ULTIMO (A18).
VECTOR V (10,A100).
loop #i=0 to 11.
  do if #i = 0.
  COMPUTE PRIMEIRO = CHAR.SUBSTR(nometrabalhador,1,CHAR.INDEX(nometrabalhador,' ')-1) .
  else if #i=1.
  compute V(1) = CHAR.SUBSTR(nometrabalhador,CHAR.INDEX(nometrabalhador,' ')+1,LENGTH(nometrabalhador)-CHAR.INDEX(nometrabalhador,' ')+1) .
  else if #i>1 and #i<=10.
  compute V(#i) = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  else if #i=11.
  compute ULTIMO = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  end if.
end loop.
if (V9 = V10) V10 = ''.
if (V8 = V9) V9 = ''.
if (V7 = V8) V8 = ''.
if (V6 = V7) V7 = ''.
if (V5 = V6) V6 = ''.
if (V4 = V5) V5 = ''.
if (V3 = V4) V4 = ''.
if (V2 = V3) V3 = ''.
if (V1 = V2) V2 = ''.
if (ULTIMO = V1) V1 = ''.
if (ULTIMO = V2) V2 = ''.
if (ULTIMO = V3) V3 = ''.
if (ULTIMO = V4) V4 = ''.
if (ULTIMO = V5) V5 = ''.
if (ULTIMO = V6) V6 = ''.
if (ULTIMO = V7) V7 = ''.
if (ULTIMO = V8) V8 = ''.
if (ULTIMO = V9) V9 = ''.
if (ULTIMO = V10) V10 = ''.
STRING MATCHCODE (A40).
COMPUTE MATCHCODE = REPLACE(CONCAT(PRIMEIRO,ULTIMO,CHAR.SUBSTR(V1,1,1),CHAR.SUBSTR(V2,1,1),CHAR.SUBSTR(V3,1,1),
                                                                         CHAR.SUBSTR(V4,1,1),CHAR.SUBSTR(V5,1,1),CHAR.SUBSTR(V6,1,1),CHAR.SUBSTR(V7,1,1),
                                                                         CHAR.SUBSTR(V8,1,1),CHAR.SUBSTR(V9,1,1),CHAR.SUBSTR(V10,1,1)),' ','').

DATASET NAME b1.

* Identificar casos duplicados.
SORT CASES BY MATCHCODE(A).
MATCH FILES
  /FILE=*
  /BY MATCHCODE
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

DATASET COPY  b2.
DATASET ACTIVATE  b2.
FILTER OFF.
USE ALL.
SELECT IF (PrimaryLast = 0).
RENAME VARIABLES (DTNASC=DTNASC2) (CURSO=CURSO2) (cpf_concluinte=cpf_concluinte2) (ANOCONCLUSAO=ANOCONCLUSAO2).
SORT CASES BY MATCHCODE.

DATASET ACTIVATE b1.
SELECT IF (PrimaryLast = 1).
RENAME VARIABLES (nometrabalhador = CONCLUINTE).
SORT CASES BY MATCHCODE.
MATCH FILES /FILE=*
  /TABLE='b2'
  /RENAME (PrimaryLast nometrabalhador = d1 d2) 
  /BY MATCHCODE
  /DROP= d1 d2.
save outfile = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\LISTA DE CONCLUINTES 2014 2013 2012.sav'
  /KEEP = CONCLUINTE DTNASC DTNASC2 CURSO CURSO2 cpf_concluinte cpf_concluinte2 ANOCONCLUSAO ANOCONCLUSAO2 MATCHCODE
 /compressed.

dataset close all.
get file = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\rais2010.sav'
  /keep = municipio vinculoativo3112 tipovinculo tipoadmissao tiposalario escolaridadeapos2005 
sexotrabalhador nacionalidade racacor indportadordefic tipodefic 
tamanhoestabelecimento naturezajuridica dataadmissaodeclarada vlremunmedianom vlremunmediasm vlremundezembronom vlremundezembrosm 
tempoemprego qtdhoracontr vlultimaremuneracaoano vlsalariocontratual pis datadenascimento cpf cnpjcei nometrabalhador cboocupacao2002 
cnae20classe.

STRING PRIMEIRO ULTIMO (A18).
VECTOR V (10,A100).
loop #i=0 to 11.
  do if #i = 0.
  COMPUTE PRIMEIRO = CHAR.SUBSTR(nometrabalhador,1,CHAR.INDEX(nometrabalhador,' ')-1) .
  else if #i=1.
  compute V(1) = CHAR.SUBSTR(nometrabalhador,CHAR.INDEX(nometrabalhador,' ')+1,LENGTH(nometrabalhador)-CHAR.INDEX(nometrabalhador,' ')+1) .
  else if #i>1 and #i<=10.
  compute V(#i) = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  else if #i=11.
  compute ULTIMO = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  end if.
end loop.
if (V9 = V10) V10 = ''.
if (V8 = V9) V9 = ''.
if (V7 = V8) V8 = ''.
if (V6 = V7) V7 = ''.
if (V5 = V6) V6 = ''.
if (V4 = V5) V5 = ''.
if (V3 = V4) V4 = ''.
if (V2 = V3) V3 = ''.
if (V1 = V2) V2 = ''.
if (ULTIMO = V1) V1 = ''.
if (ULTIMO = V2) V2 = ''.
if (ULTIMO = V3) V3 = ''.
if (ULTIMO = V4) V4 = ''.
if (ULTIMO = V5) V5 = ''.
if (ULTIMO = V6) V6 = ''.
if (ULTIMO = V7) V7 = ''.
if (ULTIMO = V8) V8 = ''.
if (ULTIMO = V9) V9 = ''.
if (ULTIMO = V10) V10 = ''.
STRING MATCHCODE (A40).
COMPUTE MATCHCODE = REPLACE(CONCAT(PRIMEIRO,ULTIMO,CHAR.SUBSTR(V1,1,1),CHAR.SUBSTR(V2,1,1),CHAR.SUBSTR(V3,1,1),
                                                                         CHAR.SUBSTR(V4,1,1),CHAR.SUBSTR(V5,1,1),CHAR.SUBSTR(V6,1,1),CHAR.SUBSTR(V7,1,1),
                                                                         CHAR.SUBSTR(V8,1,1),CHAR.SUBSTR(V9,1,1),CHAR.SUBSTR(V10,1,1)),' ','').

SORT CASES BY MATCHCODE.

MATCH FILES /FILE=*
  /TABLE='D:\Users\lrube\Documents\codeplan\aval_curso_tec\LISTA DE CONCLUINTES 2014 2013 2012.sav'
  /BY MATCHCODE.

select if CONCLUINTE <> ''.

save outfile = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\concluintes_identificados_rais2010.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /compressed.

dataset close all.
get file = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\rais2011.sav'
  /keep = municipio vinculoativo3112 tipovinculo tipoadmissao tiposalario escolaridadeapos2005 sexotrabalhador nacionalidade 
          racacor indportadordefic tipodefic tamanhoestabelecimento naturezajuridica dataadmissaodeclarada vlremunmedianom 
          vlremunmediasm vlremundezembronom vlremundezembrosm tempoemprego qtdhoracontr vlultimaremuneracaoano 
          vlsalariocontratual pis idade cpf cnpjcei nometrabalhador cboocupacao2002 cnae20subclasse.

STRING PRIMEIRO ULTIMO (A18).
VECTOR V (10,A100).
loop #i=0 to 11.
  do if #i = 0.
  COMPUTE PRIMEIRO = CHAR.SUBSTR(nometrabalhador,1,CHAR.INDEX(nometrabalhador,' ')-1) .
  else if #i=1.
  compute V(1) = CHAR.SUBSTR(nometrabalhador,CHAR.INDEX(nometrabalhador,' ')+1,LENGTH(nometrabalhador)-CHAR.INDEX(nometrabalhador,' ')+1) .
  else if #i>1 and #i<=10.
  compute V(#i) = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  else if #i=11.
  compute ULTIMO = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  end if.
end loop.
if (V9 = V10) V10 = ''.
if (V8 = V9) V9 = ''.
if (V7 = V8) V8 = ''.
if (V6 = V7) V7 = ''.
if (V5 = V6) V6 = ''.
if (V4 = V5) V5 = ''.
if (V3 = V4) V4 = ''.
if (V2 = V3) V3 = ''.
if (V1 = V2) V2 = ''.
if (ULTIMO = V1) V1 = ''.
if (ULTIMO = V2) V2 = ''.
if (ULTIMO = V3) V3 = ''.
if (ULTIMO = V4) V4 = ''.
if (ULTIMO = V5) V5 = ''.
if (ULTIMO = V6) V6 = ''.
if (ULTIMO = V7) V7 = ''.
if (ULTIMO = V8) V8 = ''.
if (ULTIMO = V9) V9 = ''.
if (ULTIMO = V10) V10 = ''.
STRING MATCHCODE (A40).
COMPUTE MATCHCODE = REPLACE(CONCAT(PRIMEIRO,ULTIMO,CHAR.SUBSTR(V1,1,1),CHAR.SUBSTR(V2,1,1),CHAR.SUBSTR(V3,1,1),
                                                                         CHAR.SUBSTR(V4,1,1),CHAR.SUBSTR(V5,1,1),CHAR.SUBSTR(V6,1,1),CHAR.SUBSTR(V7,1,1),
                                                                         CHAR.SUBSTR(V8,1,1),CHAR.SUBSTR(V9,1,1),CHAR.SUBSTR(V10,1,1)),' ','').

SORT CASES BY MATCHCODE.

MATCH FILES /FILE=*
  /TABLE='D:\Users\lrube\Documents\codeplan\aval_curso_tec\LISTA DE CONCLUINTES 2014 2013 2012.sav'
  /BY MATCHCODE.

select if CONCLUINTE <> ''.

save outfile = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\concluintes_identificados_rais2011.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /compressed.

dataset close all.
get file = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\rais2012.sav'
  /keep = municipio vinculoativo3112 tipovinculo tipoadmissao tiposalario escolaridadeapos2005 sexotrabalhador 
          nacionalidade racacor indportadordefic tipodefic tamanhoestabelecimento naturezajuridica 
          dataadmissaodeclarada vlremunmedianom vlremunmediasm vlremundezembronom vlremundezembrosm 
          tempoemprego qtdhoracontr vlultimaremuneracaoano vlsalariocontratual pis idade cpf cnpjcei 
          nometrabalhador cboocupacao2002 cnae20subclasse.

STRING PRIMEIRO ULTIMO (A18).
VECTOR V (10,A100).
loop #i=0 to 11.
  do if #i = 0.
  COMPUTE PRIMEIRO = CHAR.SUBSTR(nometrabalhador,1,CHAR.INDEX(nometrabalhador,' ')-1) .
  else if #i=1.
  compute V(1) = CHAR.SUBSTR(nometrabalhador,CHAR.INDEX(nometrabalhador,' ')+1,LENGTH(nometrabalhador)-CHAR.INDEX(nometrabalhador,' ')+1) .
  else if #i>1 and #i<=10.
  compute V(#i) = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  else if #i=11.
  compute ULTIMO = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  end if.
end loop.
if (V9 = V10) V10 = ''.
if (V8 = V9) V9 = ''.
if (V7 = V8) V8 = ''.
if (V6 = V7) V7 = ''.
if (V5 = V6) V6 = ''.
if (V4 = V5) V5 = ''.
if (V3 = V4) V4 = ''.
if (V2 = V3) V3 = ''.
if (V1 = V2) V2 = ''.
if (ULTIMO = V1) V1 = ''.
if (ULTIMO = V2) V2 = ''.
if (ULTIMO = V3) V3 = ''.
if (ULTIMO = V4) V4 = ''.
if (ULTIMO = V5) V5 = ''.
if (ULTIMO = V6) V6 = ''.
if (ULTIMO = V7) V7 = ''.
if (ULTIMO = V8) V8 = ''.
if (ULTIMO = V9) V9 = ''.
if (ULTIMO = V10) V10 = ''.
STRING MATCHCODE (A40).
COMPUTE MATCHCODE = REPLACE(CONCAT(PRIMEIRO,ULTIMO,CHAR.SUBSTR(V1,1,1),CHAR.SUBSTR(V2,1,1),CHAR.SUBSTR(V3,1,1),
                                                                         CHAR.SUBSTR(V4,1,1),CHAR.SUBSTR(V5,1,1),CHAR.SUBSTR(V6,1,1),CHAR.SUBSTR(V7,1,1),
                                                                         CHAR.SUBSTR(V8,1,1),CHAR.SUBSTR(V9,1,1),CHAR.SUBSTR(V10,1,1)),' ','').

SORT CASES BY MATCHCODE.

MATCH FILES /FILE=*
  /TABLE='D:\Users\lrube\Documents\codeplan\aval_curso_tec\LISTA DE CONCLUINTES 2014 2013 2012.sav'
  /BY MATCHCODE.

select if CONCLUINTE <> ''.

save outfile = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\concluintes_identificados_rais2012.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /compressed.

dataset close all.
get file = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\rais2013.sav'
  /keep = municipio vinculoativo3112 tipovinculo tipoadmissao tiposalario escolaridadeapos2005 
          sexotrabalhador nacionalidade racacor indportadordefic tipodefic tamanhoestabelecimento 
          naturezajuridica dataadmissaodeclarada vlremunmedianom vlremunmediasm vlremundezembronom vlremundezembrosm 
          tempoemprego qtdhoracontr vlultimaremuneracaoano vlsalariocontratual pis idade cpf 
          cnpjcei nometrabalhador cboocupacao2002 cnae20subclasse.

STRING PRIMEIRO ULTIMO (A18).
VECTOR V (10,A100).
loop #i=0 to 11.
  do if #i = 0.
  COMPUTE PRIMEIRO = CHAR.SUBSTR(nometrabalhador,1,CHAR.INDEX(nometrabalhador,' ')-1) .
  else if #i=1.
  compute V(1) = CHAR.SUBSTR(nometrabalhador,CHAR.INDEX(nometrabalhador,' ')+1,LENGTH(nometrabalhador)-CHAR.INDEX(nometrabalhador,' ')+1) .
  else if #i>1 and #i<=10.
  compute V(#i) = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  else if #i=11.
  compute ULTIMO = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  end if.
end loop.
if (V9 = V10) V10 = ''.
if (V8 = V9) V9 = ''.
if (V7 = V8) V8 = ''.
if (V6 = V7) V7 = ''.
if (V5 = V6) V6 = ''.
if (V4 = V5) V5 = ''.
if (V3 = V4) V4 = ''.
if (V2 = V3) V3 = ''.
if (V1 = V2) V2 = ''.
if (ULTIMO = V1) V1 = ''.
if (ULTIMO = V2) V2 = ''.
if (ULTIMO = V3) V3 = ''.
if (ULTIMO = V4) V4 = ''.
if (ULTIMO = V5) V5 = ''.
if (ULTIMO = V6) V6 = ''.
if (ULTIMO = V7) V7 = ''.
if (ULTIMO = V8) V8 = ''.
if (ULTIMO = V9) V9 = ''.
if (ULTIMO = V10) V10 = ''.
STRING MATCHCODE (A40).
COMPUTE MATCHCODE = REPLACE(CONCAT(PRIMEIRO,ULTIMO,CHAR.SUBSTR(V1,1,1),CHAR.SUBSTR(V2,1,1),CHAR.SUBSTR(V3,1,1),
                                                                         CHAR.SUBSTR(V4,1,1),CHAR.SUBSTR(V5,1,1),CHAR.SUBSTR(V6,1,1),CHAR.SUBSTR(V7,1,1),
                                                                         CHAR.SUBSTR(V8,1,1),CHAR.SUBSTR(V9,1,1),CHAR.SUBSTR(V10,1,1)),' ','').

SORT CASES BY MATCHCODE.

MATCH FILES /FILE=*
  /TABLE='D:\Users\lrube\Documents\codeplan\aval_curso_tec\LISTA DE CONCLUINTES 2014 2013 2012.sav'
  /BY MATCHCODE.

select if CONCLUINTE <> ''.

save outfile = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\concluintes_identificados_rais2013.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /compressed.

dataset close all.
get file = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\rais2014.sav'
  /keep = municipio vinculoativo3112 tipovinculo tipoadmissao tiposalario escolaridadeapos2005 sexotrabalhador nacionalidade racacor indportadordefic tipodefic 
          tamanhoestabelecimento naturezajuridica dataadmissaodeclarada vlremunmedianom vlremunmediasm vlremundezembronom vlremundezembrosm 
          tempoemprego qtdhoracontr vlultimaremuneracaoano vlsalariocontratual pis datadenascimento cpf cnpjcei nometrabalhador cboocupacao2002 
          cnae20subclasse.

STRING PRIMEIRO ULTIMO (A18).
VECTOR V (10,A100).
loop #i=0 to 11.
  do if #i = 0.
  COMPUTE PRIMEIRO = CHAR.SUBSTR(nometrabalhador,1,CHAR.INDEX(nometrabalhador,' ')-1) .
  else if #i=1.
  compute V(1) = CHAR.SUBSTR(nometrabalhador,CHAR.INDEX(nometrabalhador,' ')+1,LENGTH(nometrabalhador)-CHAR.INDEX(nometrabalhador,' ')+1) .
  else if #i>1 and #i<=10.
  compute V(#i) = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  else if #i=11.
  compute ULTIMO = CHAR.SUBSTR(V(#i-1),CHAR.INDEX(V(#i-1),' ')+1,LENGTH(V(#i-1))-CHAR.INDEX(V(#i-1),' ')+1) .
  end if.
end loop.
if (V9 = V10) V10 = ''.
if (V8 = V9) V9 = ''.
if (V7 = V8) V8 = ''.
if (V6 = V7) V7 = ''.
if (V5 = V6) V6 = ''.
if (V4 = V5) V5 = ''.
if (V3 = V4) V4 = ''.
if (V2 = V3) V3 = ''.
if (V1 = V2) V2 = ''.
if (ULTIMO = V1) V1 = ''.
if (ULTIMO = V2) V2 = ''.
if (ULTIMO = V3) V3 = ''.
if (ULTIMO = V4) V4 = ''.
if (ULTIMO = V5) V5 = ''.
if (ULTIMO = V6) V6 = ''.
if (ULTIMO = V7) V7 = ''.
if (ULTIMO = V8) V8 = ''.
if (ULTIMO = V9) V9 = ''.
if (ULTIMO = V10) V10 = ''.
STRING MATCHCODE (A40).
COMPUTE MATCHCODE = REPLACE(CONCAT(PRIMEIRO,ULTIMO,CHAR.SUBSTR(V1,1,1),CHAR.SUBSTR(V2,1,1),CHAR.SUBSTR(V3,1,1),
                                                                         CHAR.SUBSTR(V4,1,1),CHAR.SUBSTR(V5,1,1),CHAR.SUBSTR(V6,1,1),CHAR.SUBSTR(V7,1,1),
                                                                         CHAR.SUBSTR(V8,1,1),CHAR.SUBSTR(V9,1,1),CHAR.SUBSTR(V10,1,1)),' ','').

SORT CASES BY MATCHCODE.

MATCH FILES /FILE=*
  /TABLE='D:\Users\lrube\Documents\codeplan\aval_curso_tec\LISTA DE CONCLUINTES 2014 2013 2012.sav'
  /BY MATCHCODE.

select if CONCLUINTE <> ''.

save outfile = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\concluintes_identificados_rais2014.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /compressed.

dataset close all.
