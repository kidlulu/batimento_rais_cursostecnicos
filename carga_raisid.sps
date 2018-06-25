* Encoding: windows-1252.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=8v#J(t+q*F#x,}!]///*#-;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=DESKTOP-DDE95JQ;DATABASE=DB_CODEPLAN;QuotedId=No'
  /SQL='SELECT * FROM rais_id.Vinc2010'
  /ASSUMEDSTRWIDTH=255.

CACHE.
save outfile = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\rais2010.sav' /compressed.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=8v#J(t+q*F#x,}!]///*#-;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=DESKTOP-DDE95JQ;DATABASE=DB_CODEPLAN;QuotedId=No'
  /SQL='SELECT * FROM rais_id.Vinc2011'
  /ASSUMEDSTRWIDTH=255.

CACHE.
save outfile = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\rais2011.sav' /compressed.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=8v#J(t+q*F#x,}!]///*#-;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=DESKTOP-DDE95JQ;DATABASE=DB_CODEPLAN;QuotedId=No'
  /SQL='SELECT * FROM rais_id.Vinc2012'
  /ASSUMEDSTRWIDTH=255.

CACHE.
save outfile = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\rais2012.sav' /compressed.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=8v#J(t+q*F#x,}!]///*#-;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=DESKTOP-DDE95JQ;DATABASE=DB_CODEPLAN;QuotedId=No'
  /SQL='SELECT * FROM rais_id.Vinc2013'
  /ASSUMEDSTRWIDTH=255.

CACHE.
save outfile = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\rais2013.sav' /compressed.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=DB_CODEPLAN;UID=35866;PWD=8v#J(t+q*F#x,}!]///*#-;APP=IBM SPSS Products: '+
    'Statistics Common;WSID=DESKTOP-DDE95JQ;DATABASE=DB_CODEPLAN;QuotedId=No'
  /SQL='SELECT * FROM rais_id.Vinc2014'
  /ASSUMEDSTRWIDTH=255.

CACHE.
save outfile = 'D:\Users\lrube\Documents\codeplan\aval_curso_tec\rais2014.sav' /compressed.


