DROP SCHEMA IF EXISTS [ACADEMY_HR]

CREATE SCHEMA [ACADEMY_HR] AUTHORIZATION[dbo]

drop PROCEDURE if EXISTS dbo.uspGetAddress, dbo.uspGetAddress2

USE AdventureWorks
GO
CREATE PROCEDURE dbo.uspGetAddress
AS
SELECT * FROM Person.Address
GO
EXEC dbo.uspGetAddress



BEGIN TRY
SELECT 1000/0 AS Result;
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS [Error_Code], 
ERROR_PROCEDURE() AS [Invalid_Proc], 
ERROR_MESSAGE() AS [Error_Details];

END CATCH










USE AdventureWorks
GO






CREATE PROC dbo.uspGetEmployeeRecords @EmpID nvarchar(30)
AS
SELECT *FROM tblEmployees.Portland
WHERE EmpKey = @EmpID
GO
EXEC dbo.uspGetEmployeeRecords @EmpID ='98002zd89'





CREATE PROCEDURE dbo.uspGetAddress2 @city nvarchar(30) 
AS

SELECT *FROM Person.Address
 WHERE city LIKE @city + '%'
GO
 EXEC dbo.uspGetAddress2 @city ='New'





CREATE PROC dbo.uspGetAddress3 @City nvarchar(30), @PostalCode nvarchar(10) 
AS
SELECT * FROM Person.Address
WHERE City LIKE @City + '%' AND PostalCode LIKE @PostalCode
 GO
EXEC dbo.uspGetAddress3 @City = 'New', @PostalCode = ' [98]%'




CREATE PROCEDURE dbo.uspGetAddress4 @CityName nvarchar(30) OUTPUT
 AS
SELECT City FROM Person.Address
WHERE AddressID = 38 AND PostalCode = 48226
GO
DECLARE @CityName nvarchar(30)
EXEC dbo.uspGetAddress4 @CityName = @CityName OUTPUT
PRINT @CityName

