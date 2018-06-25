IF OBJECT_ID('cursotec.concluintes', 'U') IS NOT NULL DROP TABLE cursotec.concluintes
go

create table cursotec.concluintes
(
  nome varchar(37) NOT NULL,
  dt_nasc varchar(9) NOT NULL,
  curso varchar(20) NOT NULL,
  cpf varchar(11) NOT NULL,
  ano_conc float NOT NULL
) ON [PRIMARY]
GO

BULK INSERT cursotec.concluintes
FROM '\\10.73.7.86\aval_curso_tec\lista_concluintes_carga_db_codeplan.txt'
WITH (FIELDTERMINATOR='|',FIRSTROW=1)
GO

IF OBJECT_ID('cursotec.tbchave', 'U') IS NOT NULL DROP TABLE cursotec.tbchave
go

SELECT
 CONCAT(case when CHARINDEX(' ',LTRIM(RTRIM(nome)))>0 then LEFT(LTRIM(RTRIM(nome)),CHARINDEX(' ',LTRIM(RTRIM(nome)))-1) else '' end,
		case when CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nome))))>0 then RIGHT(LTRIM(RTRIM(nome)),CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nome))))-1) else '' end,
        dbo.PrimLetras(LTRIM(RTRIM(nome)),' '))
		as chave,
 nome, 
 ltrim(rtrim(dt_nasc)) as dt_nasc, 
 curso, 
 ltrim(rtrim(cpf)) as cpf,
 ano_conc
into cursotec.tbchave 
FROM cursotec.concluintes
go

---2010
---2 - Criar coluna-chave para batimento
IF OBJECT_ID('cursotec.rv2010', 'U') IS NOT NULL DROP TABLE cursotec.rv2010
go

SELECT
 CONCAT(case when CHARINDEX(' ',LTRIM(RTRIM(nometrabalhador)))>0 then LEFT(LTRIM(RTRIM(nometrabalhador)),CHARINDEX(' ',LTRIM(RTRIM(nometrabalhador)))-1) else '' end,
		case when CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nometrabalhador))))>0 then RIGHT(LTRIM(RTRIM(nometrabalhador)),CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nometrabalhador))))-1) else '' end,
        dbo.PrimLetras(LTRIM(RTRIM(nometrabalhador)),' '))
		as chave,
 nometrabalhador, 
 ltrim(rtrim(datadenascimento)) as datadenascimento, 
 ltrim(rtrim(pis)) as pis, 
 ltrim(rtrim(numeroctps)) as numeroctps, 
 ltrim(rtrim(cpf)) as cpf,
 municipio, tipovinculo, tipoadmissao, tiposalario, escolaridadeapos2005, sexotrabalhador, 
 nacionalidade, racacor, indportadordefic, tipodefic, tamanhoestabelecimento, naturezajuridica, 
 dataadmissaodeclarada, vlremunmediasm, vlremunmedianom, vlremundezembrosm, vlremundezembronom, 
 tempoemprego, qtdhoracontr, vlultimaremuneracaoano, vlsalariocontratual, ceivinculado, 
 cnpjcei, cnpjraiz, cboocupacao2002, cnae20classe
into cursotec.rv2010
FROM DB_CODEPLAN.rais_id.Vinc2010 
WHERE cast(vinculoativo3112 as float) = 1 and municipio in ('520010','520017','520025','520030','520400','520549','520551',
                                               '520580','520620','520800','521250','521305','521523','521560',
                                               '521730','521760','521975','522185','522220','522230','530010')
go

---2011
---2 - Criar coluna-chave para batimento
IF OBJECT_ID('cursotec.rv2011', 'U') IS NOT NULL DROP TABLE cursotec.rv2011
go

SELECT
 CONCAT(case when CHARINDEX(' ',LTRIM(RTRIM(nometrabalhador)))>0 then LEFT(LTRIM(RTRIM(nometrabalhador)),CHARINDEX(' ',LTRIM(RTRIM(nometrabalhador)))-1) else '' end,
		case when CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nometrabalhador))))>0 then RIGHT(LTRIM(RTRIM(nometrabalhador)),CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nometrabalhador))))-1) else '' end,
        dbo.PrimLetras(LTRIM(RTRIM(nometrabalhador)),' '))
		as chave,
 nometrabalhador, 
 ltrim(rtrim(pis)) as pis, 
 ltrim(rtrim(numeroctps)) as numeroctps, 
 ltrim(rtrim(cpf)) as cpf,
 municipio, tipovinculo, tipoadmissao, tiposalario, escolaridadeapos2005, sexotrabalhador, 
 nacionalidade, racacor, indportadordefic, tipodefic, tamanhoestabelecimento, naturezajuridica, 
 dataadmissaodeclarada, vlremunmediasm, vlremunmedianom, vlremundezembrosm, vlremundezembronom, 
 tempoemprego, qtdhoracontr, vlultimaremuneracaoano, vlsalariocontratual, ceivinculado, 
 cnpjcei, cnpjraiz, cboocupacao2002, cnae20classe, idade
into cursotec.rv2011
FROM DB_CODEPLAN.rais_id.Vinc2011
WHERE cast(vinculoativo3112 as float) = 1 and municipio in ('520010','520017','520025','520030','520400','520549','520551',
                                             '520580','520620','520800','521250','521305','521523','521560',
                                             '521730','521760','521975','522185','522220','522230','530010')
go

---2012
---2 - Criar coluna-chave para batimento
IF OBJECT_ID('cursotec.rv2012', 'U') IS NOT NULL DROP TABLE cursotec.rv2012
go

SELECT
 CONCAT(case when CHARINDEX(' ',LTRIM(RTRIM(nometrabalhador)))>0 then LEFT(LTRIM(RTRIM(nometrabalhador)),CHARINDEX(' ',LTRIM(RTRIM(nometrabalhador)))-1) else '' end,
		case when CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nometrabalhador))))>0 then RIGHT(LTRIM(RTRIM(nometrabalhador)),CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nometrabalhador))))-1) else '' end,
        dbo.PrimLetras(LTRIM(RTRIM(nometrabalhador)),' '))
		as chave,
 nometrabalhador, 
 ltrim(rtrim(pis)) as pis, 
 ltrim(rtrim(numeroctps)) as numeroctps, 
 ltrim(rtrim(cpf)) as cpf,
 municipio, tipovinculo, tipoadmissao, tiposalario, escolaridadeapos2005, sexotrabalhador, 
 nacionalidade, racacor, indportadordefic, tipodefic, tamanhoestabelecimento, naturezajuridica, 
 dataadmissaodeclarada, vlremunmediasm, vlremunmedianom, vlremundezembrosm, vlremundezembronom, 
 tempoemprego, qtdhoracontr, vlultimaremuneracaoano, vlsalariocontratual, ceivinculado, 
 cnpjcei, cnpjraiz, cboocupacao2002, cnae20classe, idade
into cursotec.rv2012
FROM DB_CODEPLAN.rais_id.Vinc2012
WHERE cast(vinculoativo3112 as float) = 1 and municipio in ('520010','520017','520025','520030','520400','520549','520551',
                                             '520580','520620','520800','521250','521305','521523','521560',
                                             '521730','521760','521975','522185','522220','522230','530010')
go

---2013
---2 - Criar coluna-chave para batimento
IF OBJECT_ID('cursotec.rv2013', 'U') IS NOT NULL DROP TABLE cursotec.rv2013
go

SELECT
 CONCAT(case when CHARINDEX(' ',LTRIM(RTRIM(nometrabalhador)))>0 then LEFT(LTRIM(RTRIM(nometrabalhador)),CHARINDEX(' ',LTRIM(RTRIM(nometrabalhador)))-1) else '' end,
		case when CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nometrabalhador))))>0 then RIGHT(LTRIM(RTRIM(nometrabalhador)),CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nometrabalhador))))-1) else '' end,
        dbo.PrimLetras(LTRIM(RTRIM(nometrabalhador)),' '))
		as chave,
 nometrabalhador, 
 ltrim(rtrim(pis)) as pis, 
 ltrim(rtrim(numeroctps)) as numeroctps, 
 ltrim(rtrim(cpf)) as cpf,
 municipio, tipovinculo, tipoadmissao, tiposalario, escolaridadeapos2005, sexotrabalhador, 
 nacionalidade, racacor, indportadordefic, tipodefic, tamanhoestabelecimento, naturezajuridica, 
 dataadmissaodeclarada, vlremunmediasm, vlremunmedianom, vlremundezembrosm, vlremundezembronom, 
 tempoemprego, qtdhoracontr, vlultimaremuneracaoano, vlsalariocontratual, ceivinculado, 
 cnpjcei, cnpjraiz, cboocupacao2002, cnae20classe, idade
into cursotec.rv2013
FROM DB_CODEPLAN.rais_id.Vinc2013
WHERE cast(vinculoativo3112 as float) = 1 and municipio in ('520010','520017','520025','520030','520400','520549','520551',
                                             '520580','520620','520800','521250','521305','521523','521560',
                                             '521730','521760','521975','522185','522220','522230','530010')
go

---2014
---2 - Criar coluna-chave para batimento
IF OBJECT_ID('cursotec.rv2014', 'U') IS NOT NULL DROP TABLE cursotec.rv2014
go

SELECT
 CONCAT(case when CHARINDEX(' ',LTRIM(RTRIM(nometrabalhador)))>0 then LEFT(LTRIM(RTRIM(nometrabalhador)),CHARINDEX(' ',LTRIM(RTRIM(nometrabalhador)))-1) else '' end,
		case when CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nometrabalhador))))>0 then RIGHT(LTRIM(RTRIM(nometrabalhador)),CHARINDEX(' ',REVERSE(LTRIM(RTRIM(nometrabalhador))))-1) else '' end,
        dbo.PrimLetras(LTRIM(RTRIM(nometrabalhador)),' '))
		as chave,
 nometrabalhador, 
 ltrim(rtrim(datadenascimento)) as datadenascimento, 
 ltrim(rtrim(pis)) as pis, 
 ltrim(rtrim(numeroctps)) as numeroctps, 
 ltrim(rtrim(cpf)) as cpf,
 municipio, tipovinculo, tipoadmissao, tiposalario, escolaridadeapos2005, sexotrabalhador, 
 nacionalidade, racacor, indportadordefic, tipodefic, tamanhoestabelecimento, naturezajuridica, 
 dataadmissaodeclarada, vlremunmediasm, vlremunmedianom, vlremundezembrosm, vlremundezembronom, 
 tempoemprego, qtdhoracontr, vlultimaremuneracaoano, vlsalariocontratual, ceivinculado, 
 cnpjcei, cnpjraiz, cboocupacao2002, cnae20classe, idade
into cursotec.rv2014
FROM DB_CODEPLAN.rais_id.Vinc2014
WHERE cast(vinculoativo3112 as float) = 1 and municipio in ('520010','520017','520025','520030','520400','520549','520551',
                                             '520580','520620','520800','521250','521305','521523','521560',
                                             '521730','521760','521975','522185','522220','522230','530010')
go

---3 - Batimento da tabela-chave com a coluna-chave para 2010
IF OBJECT_ID('cursotec.v2010 ', 'U') IS NOT NULL DROP TABLE cursotec.v2010 
go

select 
 2010 as ano,
 t2.chave,
 t2.nometrabalhador, 
 t2.datadenascimento, 
 t2.pis, 
 t2.numeroctps, 
 t2.cpf,
 t2.municipio, t2.tipovinculo, t2.tipoadmissao, t2.tiposalario, t2.escolaridadeapos2005, t2.sexotrabalhador, 
 t2.nacionalidade, t2.racacor, t2.indportadordefic, t2.tipodefic, t2.tamanhoestabelecimento, t2.naturezajuridica, 
 t2.dataadmissaodeclarada, t2.vlremunmediasm, t2.vlremunmedianom, t2.vlremundezembrosm, t2.vlremundezembronom, 
 t2.tempoemprego, t2.qtdhoracontr, t2.vlultimaremuneracaoano, t2.vlsalariocontratual, t2.ceivinculado, 
 t2.cnpjcei, t2.cnpjraiz, t2.cboocupacao2002, t2.cnae20classe, t1.curso, t1.ano_conc
into cursotec.v2010 
from cursotec.tbchave as t1,
     cursotec.rv2010 as t2
where t1.chave = t2.chave
and t1.cpf = t2.cpf
go

---3 - Batimento da tabela-chave com a coluna-chave 2011
IF OBJECT_ID('cursotec.v2011 ', 'U') IS NOT NULL DROP TABLE cursotec.v2011 
go

select 
 2011 as ano,
 t2.chave,
 t2.nometrabalhador, 
 t2.pis, 
 t2.numeroctps, 
 t2.cpf,
 t2.municipio, t2.tipovinculo, t2.tipoadmissao, t2.tiposalario, t2.escolaridadeapos2005, t2.sexotrabalhador, 
 t2.nacionalidade, t2.racacor, t2.indportadordefic, t2.tipodefic, t2.tamanhoestabelecimento, t2.naturezajuridica, 
 t2.dataadmissaodeclarada, t2.vlremunmediasm, t2.vlremunmedianom, t2.vlremundezembrosm, t2.vlremundezembronom, 
 t2.tempoemprego, t2.qtdhoracontr, t2.vlultimaremuneracaoano, t2.vlsalariocontratual, t2.ceivinculado, 
 t2.cnpjcei, t2.cnpjraiz, t2.cboocupacao2002, t2.cnae20classe, t2.idade
into cursotec.v2011 
from cursotec.tbchave as t1,
     cursotec.rv2011 as t2
where t1.chave = t2.chave
and t1.cpf = t2.cpf
go

---3 - Batimento da tabela-chave com a coluna-chave 2012
IF OBJECT_ID('cursotec.v2012 ', 'U') IS NOT NULL DROP TABLE cursotec.v2012 
go

select 
 2012 as ano,
 t2.chave,
 t2.nometrabalhador, 
 t2.pis, 
 t2.numeroctps, 
 t2.cpf,
 t2.municipio, t2.tipovinculo, t2.tipoadmissao, t2.tiposalario, t2.escolaridadeapos2005, t2.sexotrabalhador, 
 t2.nacionalidade, t2.racacor, t2.indportadordefic, t2.tipodefic, t2.tamanhoestabelecimento, t2.naturezajuridica, 
 t2.dataadmissaodeclarada, t2.vlremunmediasm, t2.vlremunmedianom, t2.vlremundezembrosm, t2.vlremundezembronom, 
 t2.tempoemprego, t2.qtdhoracontr, t2.vlultimaremuneracaoano, t2.vlsalariocontratual, t2.ceivinculado, 
 t2.cnpjcei, t2.cnpjraiz, t2.cboocupacao2002, t2.cnae20classe, t2.idade
into cursotec.v2012 
from cursotec.tbchave as t1,
     cursotec.rv2012 as t2
where t1.chave = t2.chave
and t1.cpf = t2.cpf
go

---3 - Batimento da tabela-chave com a coluna-chave 2013
IF OBJECT_ID('cursotec.v2013 ', 'U') IS NOT NULL DROP TABLE cursotec.v2013 
go

select 
 2013 as ano,
 t2.chave,
 t2.nometrabalhador, 
 t2.pis, 
 t2.numeroctps, 
 t2.cpf,
 t2.municipio, t2.tipovinculo, t2.tipoadmissao, t2.tiposalario, t2.escolaridadeapos2005, t2.sexotrabalhador, 
 t2.nacionalidade, t2.racacor, t2.indportadordefic, t2.tipodefic, t2.tamanhoestabelecimento, t2.naturezajuridica, 
 t2.dataadmissaodeclarada, t2.vlremunmediasm, t2.vlremunmedianom, t2.vlremundezembrosm, t2.vlremundezembronom, 
 t2.tempoemprego, t2.qtdhoracontr, t2.vlultimaremuneracaoano, t2.vlsalariocontratual, t2.ceivinculado, 
 t2.cnpjcei, t2.cnpjraiz, t2.cboocupacao2002, t2.cnae20classe, t2.idade
into cursotec.v2013 
from cursotec.tbchave as t1,
     cursotec.rv2013 as t2
where t1.chave = t2.chave
and t1.cpf = t2.cpf
go

---3 - Batimento da tabela-chave com a coluna-chave 2014
IF OBJECT_ID('cursotec.v2014 ', 'U') IS NOT NULL DROP TABLE cursotec.v2014 
go

select 
 2014 as ano,
 t2.chave,
 t2.nometrabalhador, 
 t2.datadenascimento, 
 t2.pis, 
 t2.numeroctps, 
 t2.cpf,
 t2.municipio, t2.tipovinculo, t2.tipoadmissao, t2.tiposalario, t2.escolaridadeapos2005, t2.sexotrabalhador, 
 t2.nacionalidade, t2.racacor, t2.indportadordefic, t2.tipodefic, t2.tamanhoestabelecimento, t2.naturezajuridica, 
 t2.dataadmissaodeclarada, t2.vlremunmediasm, t2.vlremunmedianom, t2.vlremundezembrosm, t2.vlremundezembronom, 
 t2.tempoemprego, t2.qtdhoracontr, t2.vlultimaremuneracaoano, t2.vlsalariocontratual, t2.ceivinculado, 
 t2.cnpjcei, t2.cnpjraiz, t2.cboocupacao2002, t2.cnae20classe, t2.idade
into cursotec.v2014 
from cursotec.tbchave as t1,
     cursotec.rv2014 as t2
where t1.chave = t2.chave
and t1.cpf = t2.cpf
go
