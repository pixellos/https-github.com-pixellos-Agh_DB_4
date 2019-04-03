﻿/*
    Add a client that is a company
*/
CREATE OR ALTER PROCEDURE AddClient 
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@PersonalNumber nvarchar(50),
	@Telephone nvarchar(50),
	@Street nvarchar(50),
	@ApartmentNumber int,
	@BuildingNumber int,
	@ZipCode nvarchar(6),
	@City nvarchar(50),
	@Province nvarchar(50),
	@Country nvarchar(50)
	AS
	
	BEGIN TRANSACTION
	DECLARE @building_id int;
	EXEC @building_id = AddAddress
	@Street,
	@ApartmentNumber,
	@BuildingNumber,
	@ZipCode,
	@City,
	@Province,
	@Country
	
	BEGIN
	   IF NOT EXISTS (SELECT * FROM [dbo].IndividualClients WHERE FirstName = @FirstName and LastName = @LastName and PersonalNumber = @PersonalNumber)
	   BEGIN
			INSERT INTO [dbo].Clients(Telephone, BuildingId) VALUES (@Telephone, @building_id);
			INSERT INTO [dbo].IndividualClients(Id, FirstName, LastName, PersonalNumber) VALUES (@@IDENTITY, @FirstName, @LastName, @PersonalNumber)  
	   END
	END

	COMMIT;
	RETURN 0;
	GO