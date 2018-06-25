****** FONÉTICO DO NOME DA PESSOA. 
HOST COMMAND = 'date /T '.
HOST COMMAND = 'time /T '.

COMPUTE nom_pessoa = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(NOM_PESSOA, ' DS ', ' '), ' DOS ', ' '),' DAS ', ' '),' DE ', ' '), ' DO ', ' '),' DA ', ' ').
STRING PRIMEIRO (A18).
COMPUTE PRIMEIRO = SUBSTR(NOM_PESSOA,1,INDEX(NOM_PESSOA,' ')-1) .
VECTOR V (11,A15).
STRING #COPIA(A100).
COMPUTE #COPIA =NOM_PESSOA.
loop #i=1 to 11.
  do if #i=1.
    compute #branco = index(#copia,' ').
    compute v(1) = substr(#copia,2,#branco-2).
    compute #copia = ltrim(substr(#copia,#branco)).
  else if #i>=2 and #i<=11.
    compute #branco = index(#copia,' ').
    compute v(#i) = substr(#copia,1,#branco-1).
    compute #copia = ltrim(substr(#copia,#branco)).
  end if.
end loop.

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

HOST COMMAND = 'date /T '.
HOST COMMAND = 'time /T '.

EXECUTE.
