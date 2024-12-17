USE AdventureWorks2012;

SELECT * FROM Person.PERSON
SELECT * FROM PERSON.ADDRESS
SELECT * FROM PERSON.ADDRESSTYPE
SELECT * FROM PERSON.EMAILADDRESS
SELECT * FROM PERSON.BUSINESSENTITY
SELECT * FROM PERSON.BUSINESSENTITYADDRESS
SELECT * FROM PERSON.BUSINESSENTITYCONTACT
SELECT * FROM PERSON.CONTACTTYPE
SELECT * FROM PERSON.COUNTRYREGION
SELECT * FROM PERSON.EMAILADDRESS
SELECT * FROM PERSON.PASSWORD
SELECT * FROM PERSON.PERSONPHONE
SELECT * FROM PERSON.PhoneNumberType
SELECT * FROM PERSON.StateProvince

--A. Get all the details from the person table including email ID, phone number and phone number type

SELECT P.FIRSTNAME,P.MIDDLENAME,P.LASTNAME,E.EMAILADDRESS,P1.PHONENUMBER,P2.NAME[PHONETYPE] FROM PERSON.PERSON P
JOIN
PERSON.EMAILADDRESS E
ON
E.BusinessEntityID = P.BusinessEntityID
JOIN
PERSON.PERSONPHONE P1
ON
P1.BusinessEntityID = P.BusinessEntityID
JOIN
PERSON.PhoneNumberType P2
ON
P2.PHONENUMBERTYPEID = P1.PhoneNumberTypeID


-- b. Get the details of the sales header order made in May 2011

SELECT * FROM [Sales].[CountryRegionCurrency]
select * from [Sales].[vSalesPerson]
SELECT * FROM [Sales].[CreditCard]
SELECT * FROM [Sales].[Currency]
SELECT * FROM [Sales].[CurrencyRate]
SELECT * FROM [Sales].[Customer]
SELECT * FROM [Sales].[PersonCreditCard]
SELECT * FROM [Sales].[SalesOrderDetail]
SELECT * FROM [Sales].[SalesOrderHeader]
SELECT * FROM [Sales].[SalesOrderHeaderSalesReason]
SELECT * FROM [Sales].[SalesPerson]
SELECT * FROM [Sales].[SalesPersonQuotaHistory]
SELECT * FROM [Sales].[SalesReason]
SELECT * FROM [Sales].[SalesTaxRate]
SELECT * FROM [Sales].[SalesTerritory]
SELECT * FROM [Sales].[SalesTerritoryHistory]
SELECT * FROM [Sales].[ShoppingCartItem]
SELECT * FROM [Sales].[SpecialOffer]
SELECT * FROM [Sales].[SpecialOfferProduct]
SELECT * FROM [Sales].[Store] */
 
 SELECT * FROM [Sales].[SalesOrderHeader]
 WHERE MONTH(ORDERDATE) = 5 
  AND YEAR(ORDERDATE) = 2011



-- c. Get the details of the sales details order made in the month of May 2011

SELECT * FROM [Sales].[SalesOrderDetail] S1
JOIN
[Sales].[SalesOrderHeader] S2
ON
S2.SalesOrderID = S1.SalesOrderID
WHERE  MONTH(ORDERDATE) = 5 
  AND YEAR(ORDERDATE) = 2011


-- d. Get the total sales made in May 2011

SELECT SUBTOTAL AS  TOTAL_SALES FROM SALES.SalesOrderHeader
WHERE  MONTH(ORDERDATE) = 5 
  AND YEAR(ORDERDATE) = 2011

-- e. Get the total sales made in the year 2011 by month order by increasing sales

SELECT YEAR(ORDERDATE)[YEAR],MONTH(ORDERDATE)[MONTH],SUM(SUBTOTAL) AS  TOTAL_SALES FROM SALES.SalesOrderHeader
WHERE YEAR(ORDERDATE) = 2011
GROUP BY YEAR(ORDERDATE),MONTH(ORDERDATE)
ORDER BY MONTH;

-- f. Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'

SELECT  P.FIRSTNAME , P.LASTNAME, SUM(S.SUBTOTAL)[TOTAL_SALES] FROM SALES.SALESORDERHEADER S
JOIN
SALES.CUSTOMER S1
ON
S1.CUSTOMERID = S.CUSTOMERID
JOIN
PERSON.PERSON P
ON
P.BusinessEntityID = S1.PersonID
WHERE P.FirstName='Gustavo' AND P.LASTNAME = 'ACHONG'
GROUP BY P.FirstName, P.LASTNAME


