/* 1.create database having name project */
create database project;

/* 2.use database project */
use project;

/* 3.create table having name Hospital */
CREATE TABLE Hospital (
    HospitalID INT PRIMARY KEY,
    HospitalName VARCHAR(255),
    Location VARCHAR(255));
    
    /* 4.create table having name medicine */
    CREATE TABLE Medicine (
    MedicineID INT PRIMARY KEY,
    MedicineName VARCHAR(255),
    Manufacturer VARCHAR(255),
    Price DECIMAL(10, 2));
    
    /* 5. insert in the table hospital */
    INSERT INTO Hospital (HospitalID, HospitalName, Location)
     VALUES
    (1, 'City General Hospital', 'New York'),
    (2, 'Regional Medical Center', 'Los Angeles'),
    (3, 'Community Hospital', 'Chicago');
    
    /* 6. insert in the table medicine */
    INSERT INTO Medicine (MedicineID, MedicineName, Manufacturer, Price)
VALUES
    (101, 'Aspirin', 'Bayer', 5.99),
    (102, 'Amoxicillin', 'Pfizer', 12.50),
    (103, 'Ibuprofen', 'Johnson & Johnson', 7.25),
    (104, 'Lisinopril', 'Novartis', 9.75);
    
    /* 7. Retrieve the names of all hospitals. */
    SELECT HospitalName FROM Hospital;
    
    /* 8.Retrieve the names of all medicines. */
    SELECT MedicineName FROM Medicine;
    
    /* 9. Retrieve the details of a specific hospital (e.g., City General Hospital). */
    SELECT * FROM Hospital WHERE HospitalName = 'City General Hospital';
    
    /* 10.  Retrieve the details of a specific medicine (e.g., Aspirin). */
    SELECT * FROM Medicine WHERE MedicineName = 'Aspirin';
    
    /* 11. List all hospitals in a specific location (e.g., New York). */
    SELECT * FROM Hospital WHERE Location = 'New York';
    
    /* 12. Calculate the total price of all medicines in the Medicine table. */
    SELECT SUM(Price) AS TotalPrice FROM Medicine;
    
    /* 13. Retrieve the medicines with a price less than $10. */
    SELECT * FROM Medicine WHERE Price < 10.00;
    
    /* 14 .  Retrieve the hospitals that have "General" in their name. */
    SELECT * FROM Hospital WHERE HospitalName LIKE '%General%';
    
    /* 15. Calculate the average price of all medicines.*/
    SELECT AVG(Price) AS AveragePrice FROM Medicine;
    
    /* 16. Retrieve the most expensive medicine.*/
    SELECT * FROM Medicine WHERE Price = (SELECT MAX(Price) FROM Medicine);
    
    /* 17.Retrieve the hospitals located in Los Angeles or Chicago.*/
    SELECT * FROM Hospital WHERE Location IN ('Los Angeles', 'Chicago');
    
    /* 18. Retrieve the medicines manufactured by Pfizer.*/
    SELECT * FROM Medicine WHERE Manufacturer = 'Pfizer';
    
    /* 19.  List all hospitals in alphabetical order.*/
     SELECT * FROM Hospital ORDER BY HospitalName;
     
     /* 20. List all medicines in descending order of price.*/
     SELECT * FROM Medicine ORDER BY Price DESC;
     
     /* 21. Count the number of hospitals.*/
     SELECT COUNT(*) AS HospitalCount FROM Hospital;
     
     /* 22.  Count the number of medicines.*/
     SELECT COUNT(*) AS MedicineCount FROM Medicine;
     
     /* 23. Calculate the total price of medicines manufactured by Pfizer.*/
     SELECT SUM(Price) AS TotalPrice FROM Medicine WHERE Manufacturer = 'Pfizer';
     
     /* 24. Retrieve the hospitals that have more than 100 beds (assuming there's a 'Beds' column in the Hospital table).*/
     SELECT * FROM Hospital WHERE Beds > 100;
     
     /* 25. Retrieve the medicines with a price between $5 and $10.*/
     SELECT * FROM Medicine WHERE Price BETWEEN 5.00 AND 10.00;

    /* 26. Calculate the average number of beds in all hospitals.*/
    SELECT AVG(Beds) AS AverageBeds FROM Hospital;
    
    /* 27. Retrieve the medicines with names containing the letter 'A'.*/
    SELECT * FROM Medicine WHERE MedicineName LIKE '%A%';
    
    /* 28. Retrieve the hospitals with names starting with 'C'.*/
    SELECT * FROM Hospital WHERE HospitalName LIKE 'C%';
    
    /* 29. Calculate the total cost of all medicines with a price greater than $8.*/
    SELECT SUM(Price) AS TotalCost FROM Medicine WHERE Price > 8.00;
    
    /* 30. Retrieve the hospitals and their respective locations.*/
    SELECT HospitalName, Location FROM Hospital;
    
    /*  31.Retrieve the medicines with prices greater than the average price.*/
    SELECT * FROM Medicine WHERE Price > (SELECT AVG(Price) FROM Medicine);
    
    /* 32.List all medicines along with their manufacturers.*/
    SELECT MedicineName, Manufacturer FROM Medicine;
    
    /*33.  Retrieve the hospitals with the most number of beds. */
    SELECT * FROM Hospital WHERE Beds = (SELECT MAX(Beds) FROM Hospital);
    
    /* 34.Calculate the total number of medicines manufactured by each manufacturer.*/
    SELECT Manufacturer, COUNT(*) AS MedicineCount FROM Medicine GROUP BY Manufacturer;
    
    /* 35. Retrieve the hospitals with names ending in 'Medical Center'.*/
    SELECT * FROM Hospital WHERE HospitalName LIKE '%Medical Center';
    
    /* 36. Retrieve the medicines with prices less than the average price.*/
    SELECT * FROM Medicine WHERE Price < (SELECT AVG(Price) FROM Medicine);
    
    /* 37. Calculate the total price of all medicines manufactured by Novartis.*/
    SELECT SUM(Price) AS TotalPrice FROM Medicine WHERE Manufacturer = 'Novartis';
    
    /* 38. Retrieve the hospitals located in New York and Chicago.*/
    SELECT * FROM Hospital WHERE Location IN ('New York', 'Chicago');
    
    /* 39. Retrieve the medicines with prices rounded to two decimal places.*/
    SELECT MedicineName, ROUND(Price, 2) AS RoundedPrice FROM Medicine;

   /* 40.Calculate the average number of beds in hospitals located in Los Angeles.*/
   SELECT AVG(Beds) AS AverageBeds FROM Hospital WHERE Location = 'Los Angeles';
   
   /* 41.Retrieve the hospitals with the least number of beds.*/
   SELECT * FROM Hospital WHERE Beds = (SELECT MIN(Beds) FROM Hospital);

  /* 42. List all medicines along with their prices and manufacturers.*/
  SELECT MedicineName, Price, Manufacturer FROM Medicine;
  
  /* 43.Retrieve the medicines with names starting with 'I'.*/
  SELECT * FROM Medicine WHERE MedicineName LIKE 'I%';

  /* 44. Retrieve the hospitals with names containing the word 'Community'.*/
  SELECT * FROM Hospital WHERE HospitalName LIKE '%Community%';

/* 45. Calculate the total cost of all medicines with a price less than $5.*/
SELECT SUM(Price) AS TotalCost FROM Medicine WHERE Price < 5.00;

/* 46. Retrieve the hospitals with the highest number of beds.*/
SELECT * FROM Hospital WHERE Beds = (SELECT MAX(Beds) FROM Hospital);

/* 47.Retrieve a list of hospitals located in the same city.*/
SELECT DISTINCT H1.HospitalName, H2.HospitalName AS NearbyHospital
FROM Hospital H1
INNER JOIN Hospital H2 ON H1.Location = H2.Location AND H1.HospitalID <> H2.HospitalID;

/* 48. Find hospitals located in the same city with names that do not share any characters.*/
SELECT H1.HospitalName, H2.HospitalName AS DistinctNameHospital
FROM Hospital H1
INNER JOIN Hospital H2 ON H1.Location = H2.Location AND H1.HospitalName <> H2.HospitalName;


/* 49.Retrieve a list of hospitals and their corresponding medicines in stock*/
SELECT HospitalName as H , MedicineName as M
FROM Hospital
LEFT JOIN medicine
ON hospital.HospitalID = medicine.MedicineID;

/* 50.Retrieve a list of hospitals and their corresponding medicines in stock*/
SELECT HospitalName as H , MedicineName as M
FROM Hospital
RIGHT JOIN medicine
ON hospital.HospitalID = medicine.MedicineID;

 /* 51.Retrieve a list of hospitals and medicines in stock, including hospitals with no medicines and medicines that are not stocked in any hospital.*/
 SELECT HospitalName as H , MedicineName as M
FROM Hospital
LEFT JOIN medicine
ON hospital.HospitalID = medicine.MedicineID
union
SELECT HospitalName as H , MedicineName as M
FROM Hospital
RIGHT JOIN medicine
ON hospital.HospitalID = medicine.MedicineID;

/* 52. that involves a self-join on the Hospital table, which will help you find hospitals in the same city:*/
SELECT H1.HospitalName AS Hospital1, H2.HospitalName AS Hospital2, H1.Location AS City
FROM Hospital H1
INNER JOIN Hospital H2 ON H1.Location = H2.Location
WHERE H1.HospitalID < H2.HospitalID;






    
    
    
