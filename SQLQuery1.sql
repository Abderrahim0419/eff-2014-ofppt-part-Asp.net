create database EFF_2014_PRATIQUE

use EFF_2014_PRATIQUE

create table region(
    idregion int primary key identity,
	nomregion varchar(90)


)

create table academie(
   idacademie int primary key identity,
   nomacademie varchar(90),
   idregion# int foreign key references region(idregion)

)

create table lycee(
   idlycee int primary key identity,
   nomlycee varchar(90),
   ville varchar(90),
   idacademie# int foreign key references academie(idacademie)

)

create table professeur(
   idprofesseur int primary key identity,
   nom varchar(90),
   prenom varchar(90),
   daten date,
   email varchar(90),
   pass varchar(90),
   dateafflycee date,
   etatCivil varchar(90),
   nenfants int,
   idlycee# int foreign key references lycee(idlycee)

)

create table demande(
   iddemande int primary key identity,
   datedem date,
   idprofesseur# int foreign key references professeur(idprofesseur)

)


create table detail_demande(
   iddemande# int foreign key references demande(iddemande),
   idlycee# int foreign key references lycee(idlycee),
   numorder int,
   primary key(iddemande#,idlycee#),
   

)


alter trigger prof_lycee 
on detail_demande 
for insert 
as begin 
    
	declare @idprof int, @idlycee int,@iddemande int,@idlyceeprof int,@numorder int 
     

	 set @iddemande = (select iddemande# from inserted)
	 set @numorder = (select numorder from inserted)
	 set @idlycee = (select idlycee# from inserted)
	 set @idprof = (select idprofesseur# from demande where iddemande = @iddemande)
	 set @idlyceeprof = (select idlycee# from professeur where idprofesseur = @idprof)

	 if(@idlycee = @idlyceeprof) 
	 begin
	     rollback
	end	 
     
	   
end 




alter function calcul(@idprof int)
returns int 
as begin 

    declare @totalpoint int, @nbenfant int, @dateadd date,@datedem date
	set @nbenfant = (select nenfants  from professeur where idprofesseur = @idprof)
	set @dateadd = (select  dateafflycee from professeur)
	set @datedem  =(select datedem from demande where idprofesseur# = @idprof)

	set @totalpoint = @nbenfant + (DATEDIFF(YEAR,@dateadd,@datedem) * 2)
	return @totalpoint

end 



alter proc lycee_gr_nbr (@regionid int )
as begin 
     select top 1 nomlycee,count(dd.idlycee#) as nb from detail_demande dd,lycee l,academie a 
	 where dd.idlycee# = l.idlycee and l.idacademie# = a.idacademie and a.idregion# = @regionid group by nomlycee 

end 



create proc prof_exeter 
as 
begin 
     
	 select nom,prenom from professeur p,lycee l,demande d,detail_demande dd where p.idprofesseur = d.idprofesseur# and d.iddemande = dd.iddemande# and dd.idlycee# <> (select p.idlycee# from lycee l,academie a, region r,professeur p where l.idacademie# = a.idacademie and a.idregion# = r.idregion  )

end 



create trigger prof_saisie 
on professeur 
for insert 
as begin 
    
	declare @etatcivil varchar(90),@nenfant int
	set @etatcivil = (select etatCivil from inserted)
	set @nenfant = (select nenfants from inserted)

	if(@nenfant <> 0 and @etatcivil = 'celibataire')
	begin 
	    rollback 
	end

end


insert into region values('casa_sud')
insert into region values('casa_nord')
insert into region values('rabat')




insert into academie values ('casa_sattat', 1)
insert into academie  values('casa' , 2)
insert into  academie values ('rabat_tmara' , 3)


insert into lycee values ('makdissi','casablanca',1)
insert into lycee values ('akkad','casablanca',2)
insert into lycee values ('idrissi','rabat',3)


insert into professeur values ('youssef','asrar','06/06/2006','youssef_lmaryoul','asrar','2009','encouple',3,1)
insert into professeur values ('oussama','essaghraoui','06/06/2006','oussama-essagh','2006','2009','celibataire',5,2)
insert into professeur values ('homdi','amin','06/06/2006','youssef_lmaryoul','asrar','2009','encouple',4,3)



insert into demande values ( '06/06/2020',1)
insert into demande values ( '02/03/2019',2)
insert into demande values ( '04/05/2019',3)


select * from professeur
select * from detail_demande
select * from demande


insert into detail_demande values ( 3,3,1)
insert into detail_demande values ( 2,3,3)



