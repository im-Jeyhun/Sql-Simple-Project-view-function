SELECT  Customers.CustomerID, Customers.ContactName, Customers.Country , Customers.City FROM Customers

GO
CREATE OR ALTER FUNCTION GetCustomerByCountryOrCity (
@country nvarchar(50),
@city nvarchar(50)
)
RETURNS TABLE
AS
RETURN 
(SELECT Customers.CustomerID, Customers.ContactName, Customers.Country , Customers.City FROM Customers
WHERE Customers.Country = @country OR Customers.City = @city
)

GO
SELECT * FROM GetCustomerByCountryOrCity('Mexico',null);

SELECT Region.RegionDescription 'Region name', COUNT(Region.RegionID) AS 'Territories count'
FROM Territories
JOIN Region ON Territories.RegionID = Region.RegionID
GROUP BY  Region.RegionID , Region.RegionDescription

GO
CREATE VIEW TerritoriesStatisticsBasedOnRegion
AS 
SELECT Region.RegionDescription 'Region name', COUNT(Region.RegionID) AS 'Territories count'
FROM Territories
JOIN Region ON Territories.RegionID = Region.RegionID
GROUP BY  Region.RegionID , Region.RegionDescription

	SELECT * FROM  TerritoriesStatisticsBasedOnRegion