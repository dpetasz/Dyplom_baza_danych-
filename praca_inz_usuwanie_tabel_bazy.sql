--usuwanie powi¹zañ
use TW
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_Przedstawienie_Rezyser'))
begin
	print 'Powi¹zanie "FK_Przedstawienie_Rezyser" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_Przedstawienie_Rezyser"'
	alter table Przedstawienie drop
					constraint [FK_Przedstawienie_Rezyser]
end
go


if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_Przedstawienie_Kompozytor'))
begin
	print 'Powi¹zanie "FK_Przedstawienie_Kompozytor" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_Przedstawienie_Kompozytor"'
	alter table Przedstawienie drop
					constraint [FK_Przedstawienie_Kompozytor]
end
go


if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_Przedstawienie_Rodzaj'))
begin
	print 'Powi¹zanie "FK_Przedstawienie_Rodzaj" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_Przedstawienie_Rodzaj"'
	alter table Przedstawienie drop
					constraint [FK_Przedstawienie_Rodzaj]
end
go


if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_Akt_Przedstawienie'))
begin
	print 'Powi¹zanie "FK_Akt_Przedstawienie" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_Akt_Przedstawienie"'
	alter table Akt drop
					constraint [FK_Akt_Przedstawienie]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FX_Obrotowka_Akt'))
begin
	print 'Powi¹zanie "FK_FX_Obrotowka_Akt" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FX_Obrotowka_Akt"'
	alter table FX_Obrotowka drop
					constraint [FK_FX_Obrotowka_Akt]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FX_Zapadnia_Akt'))
begin
	print 'Powi¹zanie "FK_FX_Zapadnia_Akt" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FX_Zapadnia_Akt"'
	alter table FX_Zapadnia drop
					constraint [FK_FX_Zapadnia_Akt]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FX_Wozek_Akt'))
begin
	print 'Powi¹zanie "FK_FX_Wozek_Akt" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FX_Wozek_Akt"'
	alter table FX_Wozek drop
					constraint [FK_FX_Wozek_Akt]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FX_Most_Akt'))
begin
	print 'Powi¹zanie "FK_FX_Most_Akt" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FX_Most_Akt"'
	alter table FX_Most drop
					constraint [FK_FX_Most_Akt]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FX_Sztankiet_Akt'))
begin
	print 'Powi¹zanie "FK_FX_Sztankiet_Akt" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FX_Sztankiet_Akt"'
	alter table FX_Sztankiet drop
					constraint [FK_FX_Sztankiet_Akt]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXZapadnia_Zapadnia_Zapadnia'))
begin
	print 'Powi¹zanie "FK_FXZapadnia_Zapadnia_Zapadnia" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FXZapadnia_Zapadnia_Zapadnia"'
	alter table FX_Zapadnia_Zapadnia drop
					constraint [FK_FXZapadnia_Zapadnia_Zapadnia]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXZapadnia_Zapadnia_FX_Zapadnia'))
begin
	print 'Powi¹zanie "FK_FXZapadnia_Zapadnia_FX_Zapadnia" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FXZapadnia_Zapadnia_FX_Zapadnia"'
	alter table FX_Zapadnia_Zapadnia drop
					constraint [FK_FXZapadnia_Zapadnia_FX_Zapadnia]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXWozek_Wozek_Wozek'))
begin
	print 'Powi¹zanie "FK_FXWozek_Wozek_Wozek" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FXWozek_Wozek_Wozek"'
	alter table FX_Wozek_Wozek drop
					constraint [FK_FXWozek_Wozek_Wozek]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXWozek_Wozek_FX_Wozek'))
begin
	print 'Powi¹zanie "FK_FXWozek_Wozek_FX_Wozek" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FXWozek_Wozek_FX_Wozek"'
	alter table FX_Wozek_Wozek drop
					constraint [FK_FXWozek_Wozek_FX_Wozek]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXMost_Most_Most'))
begin
	print 'Powi¹zanie "FK_FXMost_Most_Most" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FXMost_Most_Most"'
	alter table FX_Most_Most drop
					constraint [FK_FXMost_Most_Most]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXMost_Most_FX_Most'))
begin
	print 'Powi¹zanie "FK_FXMost_Most_FX_Most" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FXMost_Most_FX_Most"'
	alter table FX_Most_Most drop
					constraint [FK_FXMost_Most_FX_Most]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXSztankiet_Sztankiet_Sztankiet'))
begin
	print 'Powi¹zanie "FK_FXSztankiet_Sztankiet_Sztankiet" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FXSztankiet_Sztankiet_Sztankiet"'
	alter table FX_Sztankiet_Sztankiet drop
					constraint [FK_FXSztankiet_Sztankiet_Sztankiet]
end
go

if not exists (select * from dbo.sysobjects where id = OBJECT_ID(N'FK_FXSztankiet_Sztankiet_FX_Sztankiet'))
begin
	print 'Powi¹zanie "FK_FXSztankiet_Sztankiet_FX_Sztankiet" nie istnieje!'
end
else 
	begin
		print 'Usuwam powi¹zanie "FK_FXSztankiet_Sztankiet_FX_Sztankiet"'
	alter table FX_Sztankiet_Sztankiet drop
					constraint [FK_FXSztankiet_Sztankiet_FX_Sztankiet]
end
go

--usuwanie tabel

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Przedstawienie'))
begin
	print 'Tabela Przedstawienie nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele Przedstawienie'
	drop table Przedstawienie
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Rezyser'))
begin
	print 'Tabela Rezyser nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele Rezyser'
	drop table Rezyser
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Kompozytor'))
begin
	print 'Tabela Kompozytor nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele Kompozytor'
	drop table Kompozytor
	
end
go


if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Rodzaj'))
begin
	print 'Tabela Rodzaj nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele Rodzaj'
	drop table Rodzaj
	
end
go



if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Akt'))
begin
	print 'Tabela Akt nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele Akt'
	drop table Akt
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'fx_obrotowka'))
begin
	print 'Tabela fx_obrotowka nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele fx_obrotowka'
	drop table fx_obrotowka
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Zapadnia'))
begin
	print 'Tabela FX_Zapadnia nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele FX_Zapadnia'
	drop table FX_Zapadnia
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Zapadnia_Zapadnia'))
begin
	print 'Tabela FX_Zapadnia_Zapadnia nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele FX_Zapadnia_Zapadnia'
	drop table FX_Zapadnia_Zapadnia
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Zapadnia'))
begin
	print 'Tabela Zapadnia nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele Zapadnia'
	drop table Zapadnia
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Wozek'))
begin
	print 'Tabela FX_Wozek nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele FX_Wozek'
	drop table FX_Wozek
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Wozek_Wozek'))
begin
	print 'Tabela FX_Wozek_Wozek nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele FX_Wozek_Wozek'
	drop table FX_Wozek_Wozek
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Wozek'))
begin
	print 'Tabela Wozek nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele Wozek'
	drop table Wozek
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Most'))
begin
	print 'Tabela FX_Most nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele FX_Most'
	drop table FX_Most
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Most_Most'))
begin
	print 'Tabela FX_Most_Most nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele FX_Most_Most'
	drop table FX_Most_Most
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Most'))
begin
	print 'Tabela Most nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele Most'
	drop table Most
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Sztankiet'))
begin
	print 'Tabela FX_Sztankiet nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele FX_Sztankiet'
	drop table FX_Sztankiet
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'FX_Sztankiet_Sztankiet'))
begin
	print 'Tabela FX_Sztankiet_Sztankiet nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele FX_Sztankiet_Sztankiet'
	drop table FX_Sztankiet_Sztankiet
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Sztankiet'))
begin
	print 'Tabela Sztankiet nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele Sztankiet'
	drop table Sztankiet
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Pracownik'))
begin
	print 'Tabela Pracownik nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele Pracownik'
	drop table Pracownik
	
end
go

if not EXISTS (select * from dbo.sysobjects where id = OBJECT_ID(N'Powiadomienie'))
begin
	print 'Tabela Powiadomienie nie istnieje!'
	end
else 
	begin
		print 'Usuwam tabele Powiadomienie'
	drop table Powiadomienie
	
end
go

--usuwam bazê danych TW
use master;
go
IF not EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'TW')
BEGIN
	print 'Baza danych "TW" nie istnieje'
	
	END
else
	begin
		print 'Usuwam bazê danych "TW"'

	drop DATABASE [TW];
end
GO
