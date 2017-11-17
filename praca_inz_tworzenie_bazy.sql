use master;
go
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'TW')
BEGIN
	print 'Baza danych "TW" istnieje'
--DROP DATABASE [TW];
	END
else
	begin
		print 'Tworzê bazê danych "TW"'

	CREATE DATABASE [TW];
end
GO
use [TW];
GO

------------------------------------------------
--Tabela Przedstawienie
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Przedstawienie'))
begin
	print 'Tabela Przedstawienie istnieje!'
	end
else 
	begin
		print 'Tworzê tabele Przedstawienie'
	create table Przedstawienie
	(
		idprzed int primary key identity (1,1),
		idkompozytor int not null,
		idrezyser int not null,
		idrodzaj int not null,
		nazwa nvarchar (50) not null,
		datapremiery date  null,
		dlugosc time(0) default ('02:30')null,
		opis nvarchar(200) default ('brak opisu') null
	)
end
go
------------------------------------------------
--Tabela Rezyser
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Rezyser'))
begin
	print 'Tabela Rezyser istnieje!'
	end
else 
	begin
		print 'Tworzê tabele Rezyser'
	create table Rezyser
	(
		idrezyser int primary key identity (1,1),
		nazwisko nvarchar (50) not null,
		imie nvarchar (50) default ('Nieznane')  null
		
	)
end
go
------------------------------------------------
--Tabela Kompozytor
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Kompozytor'))
begin
	print 'Tabela Kompozytor istnieje!'
	end
else 
	begin
		print 'Tworzê tabele Kompozytor'
	create table Kompozytor
	(
		idkompozytor int primary key identity (1,1),
		nazwisko nvarchar (50) not null,
		imie nvarchar (50) default ('Nieznane') null
		
	)
end
go
------------------------------------------------
--Tabela Rodzaj
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Rodzaj'))
begin
	print 'Tabela Rodzaj istnieje!'
	end
else 
	begin
		print 'Tworzê tabele Rodzaj'
	create table Rodzaj
	(
		idrodzaj int primary key identity (1,1),
		nazwa nvarchar (50) not null,

	)
end
go
------------------------------------------------
--Tabela Akt
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Akt'))
begin
	print 'Tabela Akt istnieje!'
	end
else 
	begin
		print 'Tworzê tabele Akt'
	create table Akt
	(
		idakt int primary key identity (1,1),
		idprzed int not null,
		nazwa nvarchar (15) default ('akt ')  null,
		opis nvarchar (200) default ('brak opisu')   null,
		dlugosc time(0) default ('00:45')   null
	)
end
go

------------------------------------------------
--Tabela fx_obrotowka
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'fx_obrotowka'))
begin
	print 'Tabela fx_obrotowka istnieje!'
	end
else 
	begin
		print 'Tworzê tabele fx_obrotowka'
	create table Fx_obrotowka
	(
		idfx_obrotowka int primary key identity (1,1),
		idakt int not null,
		nazwa nvarchar (20) default ('efekt ') not null,
		predkosc int check (predkosc between 0 and 100) not null ,
		kierunek bit default (0) not null,
		miejsce_stop decimal (5,2) not null,
		opis nvarchar (200) default ('brak opisu')  null,
	)
end
go

------------------------------------------------
--Tabela FX_Zapadnia
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Zapadnia'))
begin
	print 'Tabela FX_Zapadnia istnieje!'
	end
else 
	begin
		print 'Tworzê tabele FX_Zapadnia'
	create table FX_Zapadnia
	(
		idfx_zapadnia int primary key identity (1,1),
		idakt int not null,
		nazwa nvarchar (20) default ('efekt ')  null,
		opis nvarchar (200) default ('brak opisu')   null,
	)
end
go

------------------------------------------------
--Tabela FX_Zapadnia_Zapadnia
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Zapadnia_Zapadnia'))
begin
	print 'Tabela FX_Zapadnia_Zapadnia istnieje!'
	end
else 
	begin
		print 'Tworzê tabele FX_Zapadnia_Zapadnia'
	create table FX_Zapadnia_Zapadnia
	(
		idfx_zapadnia_zapadnia int primary key identity (1,1),
		idfx_zapadnia int not null,
		idzapadnia int not null,
		z_portalem bit not null,
		predkosc int check (predkosc between 0 and 100)  not null ,
		miejsce_stop decimal (4,2) not null,
		unique (idfx_zapadnia,idzapadnia)
	)
end
go

------------------------------------------------
--Tabela Zapadnia
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Zapadnia'))
begin
	print 'Tabela Zapadnia istnieje!'
	end
else 
	begin
		print 'Tworzê tabele Zapadnia'
	create table Zapadnia
	(
		idzapadnia int primary key identity (1,1),
		nazwa nvarchar (20) not null,
		pozycja decimal (4,2) not null,
		predkosc_max int not null ,
		krancowa_gora decimal (4,2) check (krancowa_gora between 0 and 0.10) not null,
		krancowa_dol decimal (4,2) check (krancowa_dol between -9.60 and -9.00)not null,
	)
end
go

------------------------------------------------
--Tabela FX_Wozek
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Wozek'))
begin
	print 'Tabela FX_Wozek istnieje!'
	end
else 
	begin
		print 'Tworzê tabele FX_Wozek'
	create table FX_Wozek
	(
		idfx_wozek int primary key identity (1,1),
		idakt int not null,
		nazwa nvarchar (20) default ('efekt ')  null,
		opis nvarchar (200) default ('brak opisu')   null,
	)
end
go

------------------------------------------------
--Tabela FX_Wozek_Wozek
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Wozek_Wozek'))
begin
	print 'Tabela FX_Wozek_Wozek istnieje!'
	end
else 
	begin
		print 'Tworzê tabele FX_Wozek_Wozek'
	create table FX_Wozek_Wozek
	(
		idfx_wozek_wozek int primary key identity(1,1),
		idfx_wozek int not null,
		idwozek int not null,
		predkosc int check (predkosc between 0 and 100) not null ,
		miejsce_stop decimal (4,2) not null,
		unique (idfx_wozek,idwozek)
	)
end
go

------------------------------------------------
--Tabela Wozek
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Wozek'))
begin
	print 'Tabela Wozek istnieje!'
	end
else 
	begin
		print 'Tworzê tabele Wozek'
	create table Wozek
	(
		idwozek int primary key identity (1,1),
		nazwa nvarchar (20) not null,
		pozycja decimal (4,2) not null,
		predkosc_max int not null ,
	)
end
go

------------------------------------------------
--Tabela FX_Most
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Most'))
begin
	print 'Tabela FX_Most istnieje!'
	end
else 
	begin
		print 'Tworzê tabele FX_Most'
	create table FX_Most
	(
		idfx_most int primary key identity (1,1),
		idakt int not null,
		nazwa nvarchar (20) default ('efekt ') null,
		opis nvarchar (200) default ('brak opisu')   null,
	)
end
go

------------------------------------------------
--Tabela FX_Most_Most
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Most_Most'))
begin
	print 'Tabela FX_Most_Most istnieje!'
	end
else 
	begin
		print 'Tworzê tabele FX_Most_Most'
	create table FX_Most_Most
	(
		idfx_most_most int primary key identity(1,1),
		idfx_most int not null,
		idmost int not null,
		predkosc int check (predkosc between 0 and 100) not null ,
		miejsce_stop decimal (4,2) not null,
		unique (idfx_most,idmost)
	)
end
go

------------------------------------------------
--Tabela Most
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Most'))
begin
	print 'Tabela Most istnieje!'
	end
else 
	begin
		print 'Tworzê tabele Most'
	create table Most
	(
		idmost int primary key identity (1,1),
		nazwa nvarchar (20) not null,
		pozycja decimal (4,2) not null,
		predkosc_max int not null ,
		krancowa_gora decimal (4,2) check (krancowa_gora between 22 and 25) not null,
		krancowa_dol decimal (4,2) check (krancowa_dol between 0 and 0.50) not null,
	)
end
go

------------------------------------------------
--Tabela FX_Sztankiet
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Sztankiet'))
begin
	print 'Tabela FX_Sztankiet istnieje!'
	end
else 
	begin
		print 'Tworzê tabele FX_Sztankiet'
	create table FX_Sztankiet
	(
		idfx_sztankiet int primary key identity (1,1),
		idakt int not null,
		nazwa nvarchar (20) default ('efekt ') null,
		
		opis nvarchar (200) default ('brak opisu') null,
	)
end
go

------------------------------------------------
--Tabela FX_Sztankiet_Sztankiet
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Sztankiet_Sztankiet'))
begin
	print 'Tabela FX_Sztankiet_Sztankiet istnieje!'
	end
else 
	begin
		print 'Tworzê tabele FX_Sztankiet_Sztankiet'
	create table FX_Sztankiet_Sztankiet
	(
		idfx_sztankiet_sztankiet int primary key identity(1,1),
		idfx_sztankiet int not null,
		idsztankiet int not null,
		predkosc int check (predkosc between 0 and 100) not null ,
		miejsce_stop decimal (4,2) not null,
		unique (idfx_sztankiet,idsztankiet)
	)
end
go

------------------------------------------------
--Tabela Sztankiet
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Sztankiet'))
begin
	print 'Tabela Sztankiet istnieje!'
	end
else 
	begin
		print 'Tworzê tabele Sztankiet'
	create table Sztankiet
	(
		idsztankiet int primary key identity (1,1),
		nazwa nvarchar (20) not null,
		pozycja decimal (4,2) not null,
		predkosc_max int not null ,
		krancowa_gora decimal (4,2) check (krancowa_gora between 28 and 30) not null,
		krancowa_dol decimal (4,2) check (krancowa_dol between 0 and 0.50) not null,
	)
end
go

------------------------------------------------
--Tabela Pracownik
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Pracownik'))
begin
	print 'Tabela Pracownik istnieje!'
	end
else 
	begin
		print 'Tworzê tabele Pracownik'
	create table Pracownik
	(
		idpracownik int primary key identity (1,1),
		login nvarchar (20) not null,
		password nvarchar (20) not null,		
	)
end
go

------------------------------------------------
--Tabela Powiadomienie
------------------------------------------------

if EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Powiadomienie'))
begin
	print 'Tabela Powiadomienie istnieje!'
	end
else 
	begin
		print 'Tworzê tabele Powiadomienie'
	create table Powiadomienie
	(
		idpowiadomienie int primary key identity (1,1),
		opis nvarchar (200) not null,	
	)
end
go
------------------------------------------------
-- Tworzê powi¹zania 
------------------------------------------------
if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_Przedstawienie_Rezyser'))
begin
	print 'Powi¹zanie "FK_Przedstawienie_Rezyser" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_Przedstawienie_Rezyser"'
	alter table Przedstawienie add
					constraint [FK_Przedstawienie_Rezyser] foreign key
	(idrezyser) references Rezyser(idrezyser)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_Przedstawienie_Kompozytor'))
begin
	print 'Powi¹zanie "FK_Przedstawienie_Kompozytor" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_Przedstawienie_Kompozytor"'
	alter table Przedstawienie add
					constraint [FK_Przedstawienie_Kompozytor] foreign key
	(idkompozytor) references Kompozytor(idkompozytor)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_Przedstawienie_Rodzaj'))
begin
	print 'Powi¹zanie "FK_Przedstawienie_Rodzaj" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_Przedstawienie_Rodzaj"'
	alter table Przedstawienie add
					constraint [FK_Przedstawienie_Rodzaj] foreign key
	(idrodzaj) references Rodzaj(idrodzaj)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_Akt_Przedstawienie'))
begin
	print 'Powi¹zanie "FK_Akt_Przedstawienie" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_Akt_Przedstawienie"'
	alter table Akt add
					constraint [FK_Akt_Przedstawienie] foreign key
	(idprzed) references Przedstawienie(idprzed)	
	
end
go


if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FX_Obrotowka_Akt'))
begin
	print 'Powi¹zanie "FK_FX_Obrotowka_Akt" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FX_Obrotowka_Akt"'
	alter table FX_Obrotowka add
					constraint [FK_FX_Obrotowka_Akt] foreign key
	(idakt) references Akt(idakt)	
	
end
go


if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FX_Zapadnia_Akt'))
begin
	print 'Powi¹zanie "FK_FX_Zapadnia_Akt" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FX_Zapadnia_Akt"'
	alter table FX_Zapadnia add
					constraint [FK_FX_Zapadnia_Akt] foreign key
	(idakt) references Akt(idakt)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FX_Wozek_Akt'))
begin
	print 'Powi¹zanie "FK_FX_Wozek_Akt" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FX_Wozek_Akt"'
	alter table FX_Wozek add
					constraint [FK_FX_Wozek_Akt] foreign key
	(idakt) references Akt(idakt)	
	
end
go


if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FX_Most_Akt'))
begin
	print 'Powi¹zanie "FK_FX_Most_Akt" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FX_Most_Akt"'
	alter table FX_Most add
					constraint [FK_FX_Most_Akt] foreign key
	(idakt) references Akt(idakt)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FX_Sztankiet_Akt'))
begin
	print 'Powi¹zanie "FK_FX_Sztankiet_Akt" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FX_Sztankiet_Akt"'
	alter table FX_Sztankiet add
					constraint [FK_FX_Sztankiet_Akt] foreign key
	(idakt) references Akt(idakt)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXZapadnia_Zapadnia_Zapadnia'))
begin
	print 'Powi¹zanie "FK_FXZapadnia_Zapadnia_Zapadnia" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FXZapadnia_Zapadnia_Zapadnia"'
	alter table FX_Zapadnia_Zapadnia add
					constraint [FK_FXZapadnia_Zapadnia_Zapadnia] foreign key
	(idzapadnia) references Zapadnia(idzapadnia)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXZapadnia_Zapadnia_FX_Zapadnia'))
begin
	print 'Powi¹zanie "FK_FXZapadnia_Zapadnia_FX_Zapadnia" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FXZapadnia_Zapadnia_FX_Zapadnia"'
	alter table FX_Zapadnia_Zapadnia add
					constraint [FK_FXZapadnia_Zapadnia_FX_Zapadnia] foreign key
	(idfx_zapadnia) references FX_Zapadnia(idfx_zapadnia)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXWozek_Wozek_Wozek'))
begin
	print 'Powi¹zanie "FK_FXWozek_Wozek_Wozek" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FXWozek_Wozek_Wozek"'
	alter table FX_Wozek_Wozek add
					constraint [FK_FXWozek_Wozek_Wozek] foreign key
	(idwozek) references Wozek(idwozek)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXWozek_Wozek_FX_Wozek'))
begin
	print 'Powi¹zanie "FK_FXWozek_Wozek_FX_Wozek" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FXWozek_Wozek_FX_Wozek"'
	alter table FX_Wozek_Wozek add
					constraint [FK_FXWozek_Wozek_FX_Wozek] foreign key
	(idfx_wozek) references FX_Wozek(idfx_wozek)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXMost_Most_Most'))
begin
	print 'Powi¹zanie "FK_FXMost_Most_Most" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FXMost_Most_Most"'
	alter table FX_Most_Most add
					constraint [FK_FXMost_Most_Most] foreign key
	(idmost) references Most(idmost)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXMost_Most_FX_Most'))
begin
	print 'Powi¹zanie "FK_FXMost_Most_FX_Most" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FXMost_Most_FX_Most"'
	alter table FX_Most_Most add
					constraint [FK_FXMost_Most_FX_Most] foreign key
	(idfx_most) references FX_Most(idfx_most)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXSztankiet_Sztankiet_Sztankiet'))
begin
	print 'Powi¹zanie "FK_FXSztankiet_Sztankiet_Sztankiet" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FXSztankiet_Sztankiet_Sztankiet"'
	alter table FX_Sztankiet_Sztankiet add
					constraint [FK_FXSztankiet_Sztankiet_Sztankiet] foreign key
	(idsztankiet) references Sztankiet(idsztankiet)	
	
end
go

if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXSztankiet_Sztankiet_FX_Sztankiet'))
begin
	print 'Powi¹zanie "FK_FXSztankiet_Sztankiet_FX_Sztankiet" istnieje!'
end
else 
	begin
		print 'Tworzê powi¹zanie "FK_FXSztankiet_Sztankiet_FX_Sztankiet"'
	alter table FX_Sztankiet_Sztankiet add
					constraint [FK_FXSztankiet_Sztankiet_FX_Sztankiet] foreign key
	(idfx_sztankiet) references FX_Sztankiet(idfx_sztankiet)	
	
end
go
