use [TW]
go

create procedure pokazLogin
as
select login from Pracownik
go
-------------------
------------------
create procedure logowanie
@login varchar (20),
@haslo varchar (20),
@Kom varchar (200) output

as 
begin try
if not exists  (select * from Pracownik
			where login = @login )
		
throw 60000,'Nie ma takiego u¿ytkownika ',10

if not exists  (select * from Pracownik
			where login = @login and password = @haslo )
		
throw 60001,'B³êdne has³o ',10
begin tran
if exists  (select * from Pracownik
			where login = @login and password = @haslo )
commit tran
select login, idpracownik from Pracownik where login = @login and password = @haslo
set @kom = 'Jesteœ zalogowany'

end try

begin catch
if @@trancount>0
rollback tran
set @kom =  'B³¹d wykonania procedury: ' + ERROR_MESSAGE() 
					
end catch

go
-------------------
------------------
create procedure pokazRezyser
as
select *, nazwisko + ' ' + imie as rezyser from Rezyser
order by nazwisko

-------------------
------------------
create procedure pokazKompozytor
as
select *, nazwisko + ' ' + imie as Kompozytor from Kompozytor
order by nazwisko

-------------------
------------------
create procedure pokazRodzaj
as
select * from Rodzaj
order by nazwa

-------------------
------------------
create procedure pokazPrzedstawienie
as
select  p.nazwa +' rodzaj: '+ rj.nazwa +' re¿yser: '+ r.nazwisko + ' ' + r.imie + ', kompozytor: '
	+ k.nazwisko + ' ' + k.imie + ', data premiery: ' 
	+ CAST(p.datapremiery as nvarchar(20)) as Przedstawienie, * 
		from Przedstawienie as p
		join Rezyser as r on p.idrezyser = r.idrezyser
		join Kompozytor as k on p.idkompozytor = k.idkompozytor
		join Rodzaj as rj on p.idrodzaj = rj.idrodzaj
order by p.nazwa


-------------------
------------------
create procedure pokazAkt
@id int
as
select * from Akt where @id = idprzed
order by nazwa

-------------------
------------------

create procedure pokazFxObrotowka
@id int
as 
select * from Fx_obrotowka where @id = idakt
order by nazwa

go
--------------------------
---------------------------
create procedure dodajRezyser
@nazw nvarchar (50),
@imie nvarchar (50),
@kom nvarchar (200) output

as 
begin try
if exists  (select * from Rezyser
			where nazwisko = @nazw and imie = @imie)
		
throw 60000,'Taki re¿yser istnieje ',10

begin tran

insert into Rezyser(nazwisko,imie)
select @nazw,
		@imie

commit tran
set @kom = 'zapisano nowego re¿ysera: ' + @nazw 
		
end try

begin catch
if @@trancount>0
rollback tran
set @kom =  'B³¹d wykonania procedury: ' + ERROR_MESSAGE() 
					
end catch

--------------------
--------------------

create procedure dodajKompozytor
@nazw nvarchar (50),
@imie nvarchar (50),
@kom nvarchar (200) output

as 
begin try
if exists  (select * from Kompozytor
			where nazwisko = @nazw and imie = @imie)
		
throw 60000,'Taki kompozytor istnieje ',10

begin tran

insert into Kompozytor(nazwisko,imie)
select @nazw,
		@imie

commit tran
set @kom = 'zapisano nowego kompozytora: ' + @nazw 
		
end try

begin catch
if @@trancount>0
rollback tran
set @kom =  'B³¹d wykonania procedury: ' + ERROR_MESSAGE() 
					
end catch

go 

----------------------
---------------------
create procedure dodajRodzaj
@nazwa nvarchar (50),
@kom nvarchar (200) output

as 
begin try
if exists  (select * from rodzaj
			where nazwa = @nazwa)
		
throw 60000,'Taki rodzaj przedstawienia ju¿ istnieje ',10

begin tran

insert into Rodzaj(nazwa)
select @nazwa

commit tran
set @kom = 'zapisano: ' + @nazwa 
		
end try

begin catch
if @@trancount>0
rollback tran
set @kom = ERROR_MESSAGE() 
					
end catch
