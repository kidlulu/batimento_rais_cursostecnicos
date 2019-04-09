use DB_CODEPLAN
go

IF OBJECT_ID('cursotec.concluintes', 'U') IS NOT NULL DROP TABLE cursotec.concluintes
go

create table cursotec.concluintes
(
  nome varchar(37) NOT NULL,
  dt_nasc varchar(9) NOT NULL,
  curso varchar(20) NOT NULL,
  cpf_aluno varchar(11) NOT NULL,
  ano_conc float NOT NULL
) ON [PRIMARY]
GO

BULK INSERT cursotec.concluintes
FROM '\\320CDL415.codeplandf.gdfnet.df\batimento_rais_cursostecnicos\lista_concluintes_carga_db_codeplan.txt' WITH (FIELDTERMINATOR='|',FIRSTROW=2,codepage=1252)
GO

alter table
 cursotec.concluintes 
add matchcode 
as  ltrim(rtrim(replace(concat(substring(nome,1,patindex('% %',nome)),
                        DBO.FnRecuperaPedacosNomeComposto(nome,''),
                        substring(nome,(len(nome) - (patindex('% %',reverse(nome))))+2,patindex('% %',reverse(nome)) ))
	            ,' ','')))
go

IF OBJECT_ID('rais_id.tmp', 'U') IS NOT NULL DROP TABLE rais_id.tmp
GO 

select 
 2017 as referencia,
 t2.municipio,
 t2.nometrabalhador,
 ltrim(rtrim(replace(concat(substring(t2.nometrabalhador,1,patindex('% %',t2.nometrabalhador)),
                            DBO.FnRecuperaPedacosNomeComposto(t2.nometrabalhador,''),
                            substring(t2.nometrabalhador,(len(t2.nometrabalhador) - (patindex('% %',reverse(t2.nometrabalhador))))+2,patindex('% %',reverse(t2.nometrabalhador)) ))
	          ,' ',''))) as matchcode,
 t2.cpf,
 cast(t2.tipovinculo as int) as tipovinculo,
 cast(t2.tipoadmissao as int) as tipoadmissao,
 cast(t2.tiposalario as int) as tiposalario,
 cast(t2.escolaridade as int) as escolaridade,
 cast(t2.sexotrabalhador as int) as sexotrabalhador,
 cast(t2.nacionalidade as int) as nacionalidade,
 cast(t2.racacor as int) as racacor,
 cast(t2.naturezajuridica as int) as naturezajuridica,
 cast(t2.dtnascimento as nchar(8)) as dtnascimento,	
 cast(t2.vlremunmedianom as float) as vlremunmedianom,
 cast(t2.vlsalariocontratual as float) as vlsalariocontratual,
 cast(t2.dtadmissao as nchar(8)) as dtadmissao,
 cast(t2.cboocupacao2002 as nchar(6)) as cboocupacao2002,
 t2.cnae20subclasse,
 t2.vinculoativo3112
into rais_id.tmp
from rais_id.Vinc2017 t2
where t2.municipio = '530010'

insert rais_id.tmp
select 
 2016 as referencia,
 t2.municipio,
 t2.nometrabalhador,
 ltrim(rtrim(replace(concat(substring(t2.nometrabalhador,1,patindex('% %',t2.nometrabalhador)),
                            DBO.FnRecuperaPedacosNomeComposto(t2.nometrabalhador,''),
                            substring(t2.nometrabalhador,(len(t2.nometrabalhador) - (patindex('% %',reverse(t2.nometrabalhador))))+2,patindex('% %',reverse(t2.nometrabalhador)) ))
	          ,' ',''))) as matchcode,
 t2.cpf,
 cast(t2.tipovinculo as int) as tipovinculo,
 cast(t2.tipoadmissao as int) as tipoadmissao,
 cast(t2.tiposalario as int) as tiposalario,
 cast(t2.escolaridade as int) as escolaridade,
 cast(t2.sexotrabalhador as int) as sexotrabalhador,
 cast(t2.nacionalidade as int) as nacionalidade,
 cast(t2.racacor as int) as racacor,
 cast(t2.naturezajuridica as int) as naturezajuridica,
 cast(t2.dtnascimento as nchar(8)) as dtnascimento,	
 cast(t2.vlremunmedianom as float) as vlremunmedianom,
 cast(t2.vlsalariocontratual as float) as vlsalariocontratual,
 cast(t2.dtadmissao as nchar(8)) as dtadmissao,
 cast(t2.cboocupacao2002 as nchar(6)) as cboocupacao2002,
 t2.cnae20subclasse,
 t2.vinculoativo3112
from rais_id.Vinc2016 t2
where t2.municipio = '530010'
union
select 
 2015 as referencia,
 t2.municipio,
 t2.nometrabalhador,
 ltrim(rtrim(replace(concat(substring(t2.nometrabalhador,1,patindex('% %',t2.nometrabalhador)),
                            DBO.FnRecuperaPedacosNomeComposto(t2.nometrabalhador,''),
                            substring(t2.nometrabalhador,(len(t2.nometrabalhador) - (patindex('% %',reverse(t2.nometrabalhador))))+2,patindex('% %',reverse(t2.nometrabalhador)) ))
	          ,' ',''))) as matchcode,
 t2.cpf,
 cast(t2.tipovinculo as int) as tipovinculo,
 cast(t2.tipoadmissao as int) as tipoadmissao,
 cast(t2.tiposalario as int) as tiposalario,
 cast(t2.escolaridadeapos2005 as int) as escolaridade,
 cast(t2.sexotrabalhador as int) as sexotrabalhador,
 cast(t2.nacionalidade as int) as nacionalidade,
 cast(t2.racacor as int) as racacor,
 cast(t2.naturezajuridica as int) as naturezajuridica,
 cast(t2.datadenascimento as nchar(8)) as dtnascimento,	
 cast(t2.vlremunmedianom as float) as vlremunmedianom,
 cast(t2.vlsalariocontratual as float) as vlsalariocontratual,
 cast(t2.dataadmissaodeclarada as nchar(8)) as dtadmissao,
 cast(t2.cboocupacao2002 as nchar(6)) as cboocupacao2002,
 t2.cnae20subclasse,
 t2.vinculoativo3112
from rais_id.Vinc2015 t2
where t2.municipio = '530010'
union
select 
 2014 as referencia,
 t2.municipio,
 t2.nometrabalhador,
 ltrim(rtrim(replace(concat(substring(t2.nometrabalhador,1,patindex('% %',t2.nometrabalhador)),
                            DBO.FnRecuperaPedacosNomeComposto(t2.nometrabalhador,''),
                            substring(t2.nometrabalhador,(len(t2.nometrabalhador) - (patindex('% %',reverse(t2.nometrabalhador))))+2,patindex('% %',reverse(t2.nometrabalhador)) ))
	          ,' ',''))) as matchcode,
 t2.cpf,
 cast(t2.tipovinculo as int) as tipovinculo,
 cast(t2.tipoadmissao as int) as tipoadmissao,
 cast(t2.tiposalario as int) as tiposalario,
 cast(t2.escolaridadeapos2005 as int) as escolaridade,
 cast(t2.sexotrabalhador as int) as sexotrabalhador,
 cast(t2.nacionalidade as int) as nacionalidade,
 cast(t2.racacor as int) as racacor,
 cast(t2.naturezajuridica as int) as naturezajuridica,
 cast(t2.datadenascimento as nchar(8)) as dtnascimento,	
 cast(t2.vlremunmedianom as float) as vlremunmedianom,
 cast(t2.vlsalariocontratual as float) as vlsalariocontratual,
 cast(t2.dataadmissaodeclarada as nchar(8)) as dtadmissao,
 cast(t2.cboocupacao2002 as nchar(6)) as cboocupacao2002,
 t2.cnae20subclasse,
 t2.vinculoativo3112
from rais_id.Vinc2014 t2
where t2.municipio = '530010'
union
select 
 2013 as referencia,
 t2.municipio,
 t2.nometrabalhador,
 ltrim(rtrim(replace(concat(substring(t2.nometrabalhador,1,patindex('% %',t2.nometrabalhador)),
                            DBO.FnRecuperaPedacosNomeComposto(t2.nometrabalhador,''),
                            substring(t2.nometrabalhador,(len(t2.nometrabalhador) - (patindex('% %',reverse(t2.nometrabalhador))))+2,patindex('% %',reverse(t2.nometrabalhador)) ))
	          ,' ',''))) as matchcode,
 t2.cpf,
 cast(t2.tipovinculo as int) as tipovinculo,
 cast(t2.tipoadmissao as int) as tipoadmissao,
 cast(t2.tiposalario as int) as tiposalario,
 cast(t2.escolaridadeapos2005 as int) as escolaridade,
 cast(t2.sexotrabalhador as int) as sexotrabalhador,
 cast(t2.nacionalidade as int) as nacionalidade,
 cast(t2.racacor as int) as racacor,
 cast(t2.naturezajuridica as int) as naturezajuridica,
 cast(t2.idade as nchar(8)) as dtnascimento,	
 cast(t2.vlremunmedianom as float) as vlremunmedianom,
 cast(t2.vlsalariocontratual as float) as vlsalariocontratual,
 cast(t2.dataadmissaodeclarada as nchar(8)) as dtadmissao,
 cast(t2.cboocupacao2002 as nchar(6)) as cboocupacao2002,
 t2.cnae20subclasse,
 t2.vinculoativo3112
from rais_id.Vinc2013 t2
where t2.municipio = '530010'
union
select 
 2012 as referencia,
 t2.municipio,
 t2.nometrabalhador,
 ltrim(rtrim(replace(concat(substring(t2.nometrabalhador,1,patindex('% %',t2.nometrabalhador)),
                            DBO.FnRecuperaPedacosNomeComposto(t2.nometrabalhador,''),
                            substring(t2.nometrabalhador,(len(t2.nometrabalhador) - (patindex('% %',reverse(t2.nometrabalhador))))+2,patindex('% %',reverse(t2.nometrabalhador)) ))
	          ,' ',''))) as matchcode,
 t2.cpf,
 cast(t2.tipovinculo as int) as tipovinculo,
 cast(t2.tipoadmissao as int) as tipoadmissao,
 cast(t2.tiposalario as int) as tiposalario,
 cast(t2.escolaridadeapos2005 as int) as escolaridade,
 cast(t2.sexotrabalhador as int) as sexotrabalhador,
 cast(t2.nacionalidade as int) as nacionalidade,
 cast(t2.racacor as int) as racacor,
 cast(t2.naturezajuridica as int) as naturezajuridica,
 cast(t2.idade as nchar(8)) as dtnascimento,	
 cast(t2.vlremunmedianom as float) as vlremunmedianom,
 cast(t2.vlsalariocontratual as float) as vlsalariocontratual,
 cast(t2.dataadmissaodeclarada as nchar(8)) as dtadmissao,
 cast(t2.cboocupacao2002 as nchar(6)) as cboocupacao2002,
 t2.cnae20subclasse,
 t2.vinculoativo3112
from rais_id.Vinc2012 t2
where t2.municipio = '530010'
union
select 
 2011 as referencia,
 t2.municipio,
 t2.nometrabalhador,
 ltrim(rtrim(replace(concat(substring(t2.nometrabalhador,1,patindex('% %',t2.nometrabalhador)),
                            DBO.FnRecuperaPedacosNomeComposto(t2.nometrabalhador,''),
                            substring(t2.nometrabalhador,(len(t2.nometrabalhador) - (patindex('% %',reverse(t2.nometrabalhador))))+2,patindex('% %',reverse(t2.nometrabalhador)) ))
	          ,' ',''))) as matchcode,
 t2.cpf,
 cast(t2.tipovinculo as int) as tipovinculo,
 cast(t2.tipoadmissao as int) as tipoadmissao,
 cast(t2.tiposalario as int) as tiposalario,
 cast(t2.escolaridadeapos2005 as int) as escolaridade,
 cast(t2.sexotrabalhador as int) as sexotrabalhador,
 cast(t2.nacionalidade as int) as nacionalidade,
 cast(t2.racacor as int) as racacor,
 cast(t2.naturezajuridica as int) as naturezajuridica,
 cast(t2.idade as nchar(8)) as dtnascimento,	
 cast(t2.vlremunmedianom as float) as vlremunmedianom,
 cast(t2.vlsalariocontratual as float) as vlsalariocontratual,
 cast(t2.dataadmissaodeclarada as nchar(8)) as dtadmissao,
 cast(t2.cboocupacao2002 as nchar(6)) as cboocupacao2002,
 t2.cnae20subclasse,
 t2.vinculoativo3112
from rais_id.Vinc2011 t2
where t2.municipio = '530010'
union
select 
 2010 as referencia,
 t2.municipio,
 t2.nometrabalhador,
 ltrim(rtrim(replace(concat(substring(t2.nometrabalhador,1,patindex('% %',t2.nometrabalhador)),
                            DBO.FnRecuperaPedacosNomeComposto(t2.nometrabalhador,''),
                            substring(t2.nometrabalhador,(len(t2.nometrabalhador) - (patindex('% %',reverse(t2.nometrabalhador))))+2,patindex('% %',reverse(t2.nometrabalhador)) ))
	          ,' ',''))) as matchcode,
 t2.cpf,
 cast(t2.tipovinculo as int) as tipovinculo,
 cast(t2.tipoadmissao as int) as tipoadmissao,
 cast(t2.tiposalario as int) as tiposalario,
 cast(t2.escolaridadeapos2005 as int) as escolaridade,
 cast(t2.sexotrabalhador as int) as sexotrabalhador,
 cast(t2.nacionalidade as int) as nacionalidade,
 cast(t2.racacor as int) as racacor,
 cast(t2.naturezajuridica as int) as naturezajuridica,
 cast(t2.datadenascimento as nchar(8)) as dtnascimento,	
 cast(t2.vlremunmedianom as float) as vlremunmedianom,
 cast(t2.vlsalariocontratual as float) as vlsalariocontratual,
 cast(t2.dataadmissaodeclarada as nchar(8)) as dtadmissao,
 cast(t2.cboocupacao2002 as nchar(6)) as cboocupacao2002,
 t2.cnae20subclasse,
 t2.vinculoativo3112
from rais_id.Vinc2010 t2
where t2.municipio = '530010'

select * from cursotec.concluintes
go

IF OBJECT_ID('cursotec.concluintes_id', 'U') IS NOT NULL DROP TABLE cursotec.concluintes_id
GO 

select 
 1 tp_match,
 t2.ano_conc,
 t2.curso,
 t2.dt_nasc,
 t1.*
into cursotec.concluintes_id
from rais_id.tmp t1,
     cursotec.concluintes t2
where ltrim(rtrim(t1.matchcode)) = ltrim(rtrim(t2.matchcode))
and ltrim(rtrim(t1.dtnascimento)) = ltrim(rtrim(t2.dt_nasc))
and ltrim(rtrim(t1.cpf)) = ltrim(rtrim(t2.cpf_aluno))
go

insert into cursotec.concluintes_id
select 
 2 tp_match,
 t2.ano_conc,
 t2.curso,
 t2.dt_nasc,
 t1.*
from rais_id.tmp t1,
     cursotec.concluintes t2
where ltrim(rtrim(t1.matchcode)) = ltrim(rtrim(t2.matchcode))
and ltrim(rtrim(t1.dtnascimento)) = ltrim(rtrim(t2.dt_nasc))
go

insert into cursotec.concluintes_id
select 
 3 tp_match,
 t2.ano_conc,
 t2.curso,
 t2.dt_nasc,
 t1.*
from rais_id.tmp t1,
     cursotec.concluintes t2
where ltrim(rtrim(t1.cpf)) = ltrim(rtrim(t2.cpf_aluno))
