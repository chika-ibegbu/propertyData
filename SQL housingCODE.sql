-- DATA CLEANING PROCESS FOR REALESTATE DATA

SELECT * 
FROM housing.realestate; 

--STANDARDIZE DATE FORMAT

SELECT SaleDate.CONVERT(Date.saleDate)
FROM  housing.realestate;

SELECT SaleDate
FROM housing.realestate;

--POPULATE PROPERTY ADDRESS DATA

SELECT *
FROM  housing.realestate
WHERE PropertyAddress is null
ORDER BY parcelID;

SELECT * 
FROM housing.realestate a
JOIN housing.realestate b 
ON a.ParcelID=b.ParcelID;

SELECT a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress
FROM housing.realestate a
JOIN housing.realestate b 
ON a.ParcelID=b.ParcelID;

--BREAKING OUT ADDRESS INTO INDIVIDUAL COLUMNS(ADDRESS,CITY,STATES)

SELECT * 
FROM housing.realestate a
JOIN housing.realestate b 
ON a.ParcelID=b.ParcelID;

SELECT a.PropertyAddress,b.PropertyAddress
FROM housing.realestate a
JOIN housing.realestate b 
ON a.ParcelID=b.ParcelID;

SELECT PropertyAddress
FROM  housing.realestate;

SELECT 
substring(PropertyAddress, 1, CHARINDEX (',',PropertyAddress)-1) as address
FROM  housing.realestate;

SELECT OwnerAddress
FROM  housing.realestate;

--CHANGE YES AND NO TO Y AND N
SELECT distinct(soldAsvacant)
FROM  housing.realestate;

SELECT distinct(soldAsvacant),count(soldAsvacant)
FROM  housing.realestate
GROUP BY soldAsvacant
ORDER BY 2

SELECT soldAsvacant
CASE WHEN soldAsvacant='Y' THEN 'YES'
	 WHEN soldAsvacant='N' THEN 'NO'
     ELSE soldAsvacant
     END
FROM housing.realestate;

--REMOVE DUPLICATE ROLE
select *
FROM housing.realestate

ALTER TABLE housing.realestate
DROP COLUMN OwnerAddress;


ALTER TABLE housing.realestate
DROP COLUMN TaxDistrict;

ALTER TABLE housing.realestate
DROP COLUMN LandUse;


-----END OF PROJECT
