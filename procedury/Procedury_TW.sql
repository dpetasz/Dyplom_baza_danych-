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
go
-------------------
------------------
alter procedure pokazPrzedstawienie
as
select (p.nazwa +'/ rodzaj: '+ rj.nazwa +'/ re¿yser: '+ r.nazwisko + ' ' + r.imie + '/ kompozytor: '
	+ k.nazwisko + ' ' + k.imie + '/ data premiery: ' 
	+ CAST(p.datapremiery as nvarchar(20))) as Przedstawienie, p.nazwa, p.idprzed, p.opis, p.dlugosc, p.datapremiery, 
	r.nazwisko + ' ' + r.imie as rezyser , k.nazwisko + ' ' + k.imie as kompozytor , rj.nazwa as rodzaj
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
alter procedure dodajRezyser
@nazw nvarchar (50),
@imie nvarchar (50),
@kom nvarchar (200) output

as 
begin try
if exists  (select * from Rezyser
			where nazwisko = @nazw and imie = @imie)
		
throw 60000,'Taki re¿yser istnieje ',10

if  @nazw = '' and @imie = ''
		
throw 60003,'Nie poda³eœ danych ',10

if  @nazw = '' 
		
throw 60004,'Nie poda³eœ nazwiska ',10

if  @imie = '' 
		
throw 60005,'Nie poda³eœ imienia ',10

begin tran


insert into Rezyser(nazwisko,imie)
select @nazw,
		@imie

commit tran
set @kom = 'Zapisano: ' + @nazw +' ' + @imie
		
end try

begin catch
if @@trancount>0
rollback tran
set @kom =  ERROR_MESSAGE() 
					
end catch
go
--------------------
--------------------

alter procedure dodajKompozytor
@nazw nvarchar (50),
@imie nvarchar (50),
@kom nvarchar (200) output

as 
begin try
if exists  (select * from Kompozytor
			where nazwisko = @nazw and imie = @imie)
		
throw 60000,'Taki kompozytor istnieje ',10

if  @nazw = '' and @imie = ''
		
throw 60003,'Nie poda³eœ danych ',10

if  @nazw = '' 
		
throw 60004,'Nie poda³eœ nazwiska ',10

if  @imie = '' 
		
throw 60005,'Nie poda³eœ imienia ',10

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
alter procedure dodajRodzaj
@nazwa nvarchar (50),
@kom nvarchar (200) output

as 
begin try
if exists  (select * from rodzaj
			where nazwa = @nazwa)
		
throw 60000,'Taki rodzaj przedstawienia ju¿ istnieje ',10

if  @nazwa = '' 
		
throw 60003,'Nie poda³eœ danych ',10

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

go

--------------------------
--------------------------

alter procedure DodajPrzedstawienie
@idkomp int,
@idrez int,
@idrodz int,
@nazwa varchar(50),
@data date,
@kom nvarchar(200) output

as
begin try

if exists  (select * from Przedstawienie as p join Kompozytor as k on p.idkompozytor = k.idkompozytor
												join Rezyser as r on p.idrezyser = r.idrezyser
												join Rodzaj on p.idrodzaj = Rodzaj.idrodzaj
			where p.nazwa = @nazwa and p.datapremiery = @data)
		
throw 60000,'Takie przedstawienie ju¿ istnieje ',10

if   @nazwa = '' 
		
throw 60003,'Nie poda³eœ nazwy przedstawienia ',10

if @idkomp = '' 
		
throw 60002,'Nie poda³eœ kompozytora',10

if  @idrez = '' 
		
throw 60001,'Nie poda³eœ re¿ysera',10

if exists  (select * from Powiadomienie
			where @idrodz = '' )
		
throw 60004,'Nie poda³eœ rodzaju',10

if exists  (select * from Powiadomienie
			where @data = '' )
		
throw 60005,'Nie poda³eœ daty',10

begin tran

insert into Przedstawienie(idkompozytor, idrezyser, idrodzaj, nazwa, datapremiery)
		select @idkomp,
				@idrez,
				@idrodz,
				@nazwa,
				@data

commit tran

set @kom = 'zapisano: ' + @nazwa 
		
end try

begin catch
if @@trancount>0
rollback tran
set @kom = ERROR_MESSAGE() 
					
end catch

go


-------------------------------
-------------------------------


create procedure AktualizujPrzedstawienie
@idprzed int,
@idkomp int,
@idrez int,
@idrodz int,
@nazwa varchar(50),
@data date,
@time time,
@opis varchar(200),
@kom nvarchar(200) output

as
begin try

if not exists  (select * from Przedstawienie where @idprzed = idprzed)
		
throw 60000,'Nie ma takiego przedstawienia ',10



begin tran

update  Przedstawienie
		set idkompozytor = @idkomp,
			idrezyser =	@idrez,
			idrodzaj =	@idrodz,
			nazwa =	@nazwa,
			datapremiery =	@data,
			dlugosc = @time,
			opis = @opis
			where @idprzed = idprzed

commit tran

set @kom = 'zaktualizowano: ' + @nazwa 
		
end try

begin catch
if @@trancount>0
rollback tran
set @kom = ERROR_MESSAGE() 
					
end catch

go

---------------------------
---------------------------
alter procedure DodajAkt
@idprzed int,
@nazwa varchar(50),
@kom nvarchar(200) output

as


begin try

if exists  (select * from Akt as a join przedstawienie as p on a.idprzed = p.idprzed
												
			where a.nazwa = @nazwa and p.idprzed = @idprzed  )
		
throw 60000,'Taki akt ju¿ istnieje ',10

if   @nazwa = '' 
		set @nazwa = 'Akt'




begin tran

insert into Akt(idprzed,  nazwa)
		select @idprzed,
				@nazwa

commit tran

set @kom = 'zapisano: ' + @nazwa 
		
end try

begin catch
if @@trancount>0
rollback tran
set @kom = ERROR_MESSAGE() 
					
end catch

go

--------------------------
---------------------------

create procedure AktualizujAkt
@idakt int,
@nazwa varchar(50),
@opis nvarchar(200),
@dlugosc time(0),
@kom nvarchar(200) output

as
begin try

if not exists  (select * from Akt where @idakt = idakt)
		
throw 60000,'Nie ma takiego Aktu ',10



begin tran

update  Akt
		set 
			nazwa =	@nazwa,
			dlugosc = @dlugosc,
			opis = @opis
			where @idakt = idakt

commit tran

set @kom = 'zaktualizowano: ' + @nazwa 
		
end try

begin catch
if @@trancount>0
rollback tran
set @kom = ERROR_MESSAGE() 
					
end catch

go
