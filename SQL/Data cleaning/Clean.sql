/*
Data cleaning
*/

SELECT *
FROM NashVille

--Standardize date format
--its now date time format

Select saleDate, CONVERT(Date,SaleDate)
From NashVille


Update Nashville
SET SaleDate = CONVERT(Date,SaleDate)

-- If it doesn't Update properly

ALTER TABLE Nashville
Add SaleDateConverted Date;

Update Nashville
SET SaleDateConverted = CONVERT(Date,SaleDate)


--Populate property address
-- if any parcel id doesn't have the corresponding propertyaddress, we can populate the property address
-- Basically we are joining the same table to itself taking property address based on parcel id and populating the address where null value is present 

Select *
From Nashville
--Where PropertyAddress is null
order by ParcelID


Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress
From Nashville AS a
JOIN Nashville AS b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ] --a.unique id is not equal to b.unique id. parcel id comes with unique id. so we need to find those unique ids whose corresponding property address is null
Where a.PropertyAddress is null

-- it is the same table but a.unique id and b.unique id are different by the condition. That is why a.property address has null value but b.property address has proper address
-- a.property address is showing a PropertyAddress column with NULL value. we will replace the null value with b.property address
Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress,
ISNULL(a.PropertyAddress,b.PropertyAddress)--if a.property adress is null, it will be replaced with b.property address. it is creating a new column. so we need to update
From Nashville AS a
JOIN Nashville AS b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

--update
Update a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject.dbo.Nashville a
JOIN PortfolioProject.dbo.Nashville b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null



-- we have street address and city separated by comma.
-- Breaking out Address into Individual Columns (Address, City, State) 

Select PropertyAddress
From PortfolioProject.dbo.Nashville
--Where PropertyAddress is null
--order by ParcelID


--separating addresses based on comma
SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address --CHARINDEX looks for comma inside propertyaddress and return a position number. here it is 19
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address

From PortfolioProject.dbo.Nashville


--we need to add two columns and populate them with separated value
ALTER TABLE Nashville
Add PropertySplitAddress Nvarchar(255);

Update Nashville
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )


ALTER TABLE Nashville
Add PropertySplitCity Nvarchar(255);

Update Nashville
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))




Select *
From PortfolioProject.dbo.Nashville





Select OwnerAddress
From PortfolioProject.dbo.Nashville

--another way to separate value
--parsename only looks for periods. that is why replacing comma with periods.

Select
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)-- it counts right to left. 3 means it is returning the string after 3rd period
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)
From PortfolioProject.dbo.NashvilleHousing



ALTER TABLE Nashville
Add OwnerSplitAddress Nvarchar(255);

Update Nashville
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)


ALTER TABLE Nashville
Add OwnerSplitCity Nvarchar(255);

Update Nashville
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)



ALTER TABLE Nashville
Add OwnerSplitState Nvarchar(255);

Update Nashville
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)



Select *
From PortfolioProject.dbo.Nashville




-- Change Y and N to Yes and No in "Sold as Vacant" field


Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From PortfolioProject.dbo.Nashville
Group by SoldAsVacant
order by 2




Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From PortfolioProject.dbo.Nashville


Update Nashville
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END




-- Remove Duplicates

--finding duplicates
WITH RowNumCTE 
AS(
Select *,
	ROW_NUMBER() OVER (
	--The ROW_NUMBER() is a window function that assigns a sequential integer number to each row in the query’s result set.
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) AS row_num

From PortfolioProject.dbo.Nashville
)
Select *
From PortfolioProject.dbo.Nashville


DELETE
From RowNumCTE
Where row_num > 1
Order by PropertyAddress




-- Delete Unused Columns

Select *
From PortfolioProject.dbo.Nashville


ALTER TABLE PortfolioProject.dbo.Nashville
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate

