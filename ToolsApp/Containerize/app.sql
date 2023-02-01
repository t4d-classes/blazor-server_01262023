DROP DATABASE IF EXISTS App;
GO

CREATE DATABASE App;
GO

USE App;
GO

DROP TABLE IF EXISTS Color;
GO

CREATE TABLE Color (
  Id INT PRIMARY KEY CLUSTERED IDENTITY,
  Name NVARCHAR(MAX) NOT NULL,
  Hexcode NVARCHAR(MAX) NOT NULL
);
GO

DROP PROCEDURE IF EXISTS InsertColor
GO

CREATE PROCEDURE InsertColor
  @Name NVARCHAR(MAX),
  @Hexcode NVARCHAR(MAX)  
AS   
  SET NOCOUNT ON;

  INSERT INTO Color (Name, Hexcode)
  VALUES (@Name, @Hexcode);

  SELECT Id, Name, Hexcode
  FROM Color WHERE Id = SCOPE_IDENTITY();
GO 

DROP PROCEDURE IF EXISTS UpdateColor
GO

CREATE PROCEDURE UpdateColor
  @Id INT,
  @Name NVARCHAR(MAX),
  @Hexcode NVARCHAR(MAX)  
AS   
  SET NOCOUNT ON;

  UPDATE Color SET Name = @Name, Hexcode = @Hexcode
  WHERE Id = @Id;
GO

DROP PROCEDURE IF EXISTS DeleteColor
GO

CREATE PROCEDURE DeleteColor
  @Id INT
AS   
  SET NOCOUNT ON;

  DELETE Color WHERE Id = @Id;
GO 

IF NOT EXISTS (SELECT 1 FROM Color)
BEGIN
  EXEC InsertColor 'red', 'FF0000';
  EXEC InsertColor 'orange', 'FF7F00';
  EXEC InsertColor 'yellow', 'FFFF00';
  EXEC InsertColor 'green', '00FF00';
  EXEC InsertColor 'blue', '0000FF';
  EXEC InsertColor 'indigo', '4B0082';
  EXEC InsertColor 'violet', '9400D3';
END
GO

---

DROP TABLE IF EXISTS Car;
GO

CREATE TABLE Car (
  Id INT PRIMARY KEY CLUSTERED IDENTITY,
  Make NVARCHAR(MAX) NOT NULL,
  Model NVARCHAR(MAX) NOT NULL,
  Year INT NOT NULL DEFAULT 1900,
  Color NVARCHAR(MAX) NOT NULL,
  Price MONEY NOT NULL DEFAULT 0
);
GO

DROP PROCEDURE IF EXISTS InsertCar
GO

CREATE PROCEDURE InsertCar
  @Make NVARCHAR(MAX),
  @Model NVARCHAR(MAX),
  @Year INT,
  @Color NVARCHAR(MAX),
  @Price MONEY 
AS   
  SET NOCOUNT ON;

  INSERT INTO Car (Make, Model, Year, Color, Price)
  VALUES (@Make, @Model, @Year, @Color, @Price);

  SELECT Id, Make, Model, Year, Color, Price
  FROM Car
  WHERE Id = SCOPE_IDENTITY();
GO 

DROP PROCEDURE IF EXISTS UpdateCar
GO

CREATE PROCEDURE UpdateCar
  @Id INT,
  @Make NVARCHAR(MAX),
  @Model NVARCHAR(MAX),
  @Year INT,
  @Color NVARCHAR(MAX),
  @Price MONEY 
AS   
  SET NOCOUNT ON;

  UPDATE Car
  SET Make=@Make, Model=@Model,
      Year=@Year, Color=@Color,
      Price=@Price
  WHERE Id = @Id;
GO

DROP PROCEDURE IF EXISTS DeleteCar
GO

CREATE PROCEDURE DeleteCar
  @Id INT
AS   
  SET NOCOUNT ON;

  DELETE Car WHERE Id = @Id;
GO

IF NOT EXISTS (SELECT 1 FROM Car)
BEGIN
  EXEC InsertCar 'Ford', 'Fusion Hybrid', 2020, 'blue', 40000;
  EXEC InsertCar 'Tesla', 'S', 2019, 'red', 120000;
END
GO