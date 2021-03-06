﻿/*Will add a street 5/5 38-400 City, Provice, Country*/
EXEC AddAddress 'street', 5,5,'38-400','City',  'Country';

/*Will add a street 6/5 38-400 City, Provice, Country  -- Additional building*/
EXEC AddAddress 'street', 5,5,'38-400','City',  'Country';

/*Will add a street 6/5 38-400 City, Provice, Country  -- Whole set in another country*/
EXEC AddAddress 'street', 5,5,'38-400','City', 'AnotherCountry';

/*Will add a street 6/5 38-400 City, Provice, Country  -- Whole set in another country*/
EXEC AddAddress 'AnotherStreet', null, 5,'38-400','City', 'AnotherCountry';
	declare @i int ;
IF (SELECT COUNT(*) FROM Countries) != 2
BEGIN
	set @i = CAST('Assert error.' AS INT);
END

IF (SELECT COUNT(*) FROM Cities) != 2
BEGIN
	set @i = CAST('Assert error.' AS INT);
END

EXEC AddCorporateClient 'Company', '1234567898876', '+48123456789', 'AnotherStreet', null, 5 ,'38-400','City',  'AnotherCountry';

EXEC AddCorporateClient 'ForteDigital', '000000000', '+48 123456789', 'UlicaForte', 10, 6 ,'12-122','Kraków',  'Polska';
EXEC AddCorporateClient 'PowerShellPl', '1234561', '+48 143456789', 'Ulicapower', null, 6 ,'12-122','Kraków',  'Polska';
EXEC AddCorporateClient 'ForteDigital2', '000000002', '+48 111111111', 'UlicaForte', 10, 6 ,'12-122','Kraków', 'Polska';

EXEC AddClient 'Mateusz', 'Popielarz', '97010107005', '+48 111111112', 'Brodzińskiego', 5, 1, '38-400', 'Krosno', 'Polska';
EXEC AddClient 'Mateusz', 'Popielarz', '97010307009', '+48 111111112', 'Brodzińskiego', 5, 1, '38-400', 'Krosno',  'Polska';
EXEC AddClient 'Mateusz', 'Popielarz', '97010207002', '+48 111111112', 'Mickiewicza', 4, 1, '38-400', 'Krosno',  'Polska';

EXEC AddStudent 'Mateusz', 'Popielarz', '85082768299','600988', '+48 123456789', 'Mickiewicza', 4, 1, '38-400', 'Krosno',  'Polska';
EXEC AddStudent 'NotExisting', 'NotExisting', '68072754249','600000', '+48 123456680', 'Mickiewicza2', 4, 1, '38-400', 'Krosno',  'Polska';

EXEC AssignEmployerToEmployee '1234561', 'Associate', 'Mateusz', 'Popielarz', '97010207002', '+48 111111112', 'Mickiewicza', 4, 1, '38-400', 'Krosno',  'Polska';
EXEC AssignEmployerToEmployee '1234561', 'Associate', 'Mateusz', 'Popielarz', '97010207002', '+48 111111112', 'Mickiewicza', 4, 1, '38-400', 'Krosno',  'England';

DECLARE @confitura int;

EXEC @confitura = AddConference '1234561', 'ConfituraPL',0 , 500, 'Konferencyjna', 14, 7, '32-234', 'Kraków', 'Polska';

EXEC AddPriceToConference 400, 2, @confitura;
EXEC AddPriceToConference 300, 14, @confitura;
EXEC AddPriceToConference 200, 31, @confitura;
EXEC AddPriceToConference 100, 9999, @confitura;
EXEC AddPriceToConference 100, 32766, @confitura; 

EXEC AddConferenceDay @confitura,  '2017/08/25', 5
EXEC AddConferenceDay @confitura,  '2017/08/25', 4
EXEC AddConferenceDay @confitura,  '2018/08/25', 4

IF (SELECT COUNT(*) FROM ConferenceDays) != 2
BEGIN
	set @i = CAST(('(SELECT COUNT(*) FROM ConferenceDays) != 2) ' +  CAST((SELECT COUNT(*) FROM ConferenceDays) AS varchar(10))) AS INT);
END


IF (SELECT COUNT(*) FROM ConferencePrices) != 6
BEGIN
	set @i = CAST(('IF (SELECT COUNT(*) FROM ConferencePrices) != 6 ' +  CAST((SELECT COUNT(*) FROM ConferencePrices) AS varchar(10))) AS INT);
END

EXEC AddConference '1234561', 'ConfituraStudent', 100, 800, 'Konferencyjna', 14, 7, '32-234', 'Kraków',  'Polska';

EXEC MakeReservation '85082768299', @confitura;
EXEC MakeReservation '68072754249', @confitura;
EXEC MakeReservation '68072754249', @confitura;


IF (SELECT COUNT(*) FROM Reservations) != 2
BEGIN
	set @i = CAST('Assert error.' AS INT);
END

DECLARE @dayBefore decimal;
SELECT @dayBefore = dbo.GetConferencePrice(@confitura,  '68072754249', '2018/08/24');
SELECT @dayBefore

IF @dayBefore != 400
BEGIN
	set @i = CAST(('@dayBefore != 400, ' + @dayBefore) AS INT);
END

DECLARE @twoWeeksBefore decimal;
SELECT @twoWeeksBefore = dbo.GetConferencePrice(@confitura,  '68072754249', '2018/08/12');

SELECT @twoWeeksBefore
IF @twoWeeksBefore != 300

BEGIN
	set @i = CAST(('@twoWeeksBefore != 300, ' + @twoWeeksBefore) AS INT);
END

EXEC PayForReservationWithADate '68072754249', @confitura, '2018/08/24', 400;

/* DeleteUnpaidReservation */
DELETE FROM Reservations WHERE Id > 0;
INSERT INTO Reservations VALUES (4, '2018/08/24', 1 );
EXEC DeleteUnpaidReservations;
IF(SELECT COUNT(*) FROM Reservations where ClientId = 4) > 0
BEGIN
	set @i = CAST('Assert error - DeleteUnpaidReservation' AS INT);
END
