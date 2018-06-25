* Encoding: UTF-8.
*aqui.
GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\AC2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\AC.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\AL2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\AL.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\AM2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\AM.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\AP2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\AP.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\BA2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\BA.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\CE2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\CE.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\DF2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\DF.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\ES2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\ES.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\GO2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\GO.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\MA2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\MA.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\MG2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\MG.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\MS2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\MS.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\MT2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\MT.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\PA2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\PA.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\PB2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\PB.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\PE2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\PE.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\PI2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\PI.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\PR2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\PR.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\RJ2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\RJ.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\RN2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\RN.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\RO2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\RO.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\RR2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\RR.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\RS2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\RS.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\SC2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\SC.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\SE2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\SE.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\SP2010IDativos.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\SP.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.



GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\SP2010IDinativos.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\SP2.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE='D:\dados\rais_id\dados_2010\TO2010ID.TXT'
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=';'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=FIRST 10000
  /VARIABLES=
  municipio A100
  vinculoativo3112 A100
  tipovinculo A100
  CAUSADESLI 100X
  MESDESLIG 100X
  INDALVARA 100X
  tipoadmissao A100
  tiposalario A100
  escolaridadeapos2005 A100
  sexotrabalhador A100
  nacionalidade A100
  racacor A100
  indportadordefic A100
  tamanhoestabelecimento A100
  naturezajuridica A100
  INDCEIVINC 100X
  TIPOESTBL 100X
  INDPAT 100X
  INDSIMPLES 100X
  dataadmissaodeclarada A100
  vlremundezembronom A100
  vlremundezembrosm A100
  vlremunmedianom A100
  vlremunmediasm A100
  tempoemprego A100
  qtdhoracontr A100
  vlultimaremuneracaoano A100
  vlsalariocontratual A100
  pis A100
  datadenascimento A100
  NUMECTPS 100X
  cpf A100
  CEIVINC 100X
  cnpjcei A100
  RADICCNPJ 100X
  nometrabalhador A100
  DIADESL 100X
  cboocupacao2002 A100
  cnae20classe A100
  tipodefic A100
  CAUSAFAST1 100X
  DIAINIAF1 100X
  MESINIAF1 100X
  DIAFIMAF1 100X
  MESFIMAF1 100X
  CAUSAFAST2 100X
  DIAINIAF2 100X
  MESINIAF2 100X
  DIAFIMAF2 100X
  MESFIMAF2 100X
  CAUSAFAST3 100X
  DIAINIAF3 100X
  MESINIAF3 100X
  DIAFIMAF3 100X
  MESFIMAF3 100X
  QTDIASAFAS 100X.
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
SAVE OUTFILE='D:\dados\rais_id\dados_2010\TO.sav'
  /DROP = PRIMEIRO ULTIMO V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 
  /COMPRESSED.







