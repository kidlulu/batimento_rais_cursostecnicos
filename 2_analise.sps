* Encoding: UTF-8.

GET
  FILE='/home/kidlulu/Documentos/codeplan/demanda_cursos_proficionalizantes/rais_caged_analise.sav'.    

compute cbo2002gg = number(char.substr(cbo2002ocupao,1,1),f1).
compute cbo2002sbp = number(char.substr(cbo2002ocupao,1,2),f2).
compute cbo2002sb = number(char.substr(cbo2002ocupao,1,3),f3).
compute cbo2002fam = number(char.substr(cbo2002ocupao,1,4),f4).

insert file = "/home/kidlulu/Documentos/codeplan/demanda_cursos_proficionalizantes/mascaras.sps".

* Tabelas customizadas.
CTABLES
  /FORMAT EMPTY=ZERO MISSING='0'
  /SMISSING VARIABLE
  /VLABELS VARIABLES=competciadeclarada regisadmdf DISPLAY=NONE  /VLABELS VARIABLES=eixo01 saldomov 
    eixo02 eixo03 eixo04 eixo05 eixo06 eixo07 eixo08 eixo09 eixo10 eixo11 eixo12 eixo13 
    DISPLAY=LABEL
  /TABLE competciadeclarada [C] > regisadmdf [C] BY eixo01 [C] > saldomov [S][SUM] + eixo02 [C] > 
    saldomov [S][SUM] + eixo03 [C] > saldomov [S][SUM] + eixo04 [C] > saldomov [S][SUM] + eixo05 [C] > 
    saldomov [S][SUM] + eixo06 [C] > saldomov [S][SUM] + eixo07 [C] > saldomov [S][SUM] + eixo08 [C] > 
    saldomov [S][SUM] + eixo09 [C] > saldomov [S][SUM] + eixo10 [C] > saldomov [S][SUM] + eixo11 [C] > 
    saldomov [S][SUM] + eixo12 [C] > saldomov [S][SUM] + eixo13 [C] > saldomov [S][SUM]
  /CATEGORIES VARIABLES=competciadeclarada ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=regisadmdf eixo01 eixo02 eixo03 eixo04 eixo05 eixo06 eixo07 eixo08 eixo09 
    eixo10 eixo11 eixo12 eixo13 ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE.
