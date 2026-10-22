use project_medical_data_history; 
select * from patients; 
select * from admissions; 
SELECT first_name,last_name,gender FROM patients where gender='M' ; 
 update patientes set allergies = 'NKA' where allergies is NULL; 
 SELECT concat(first_name,last_name) as full_name from patients; 
 SELECT count(*) as total_patients FROM patients where year(birth_date)=2010; 
 SELECT first_name,last_name,height FROM patients where height = (select max(height)from patients);  
 SELECT count(*) as total_admissions FROM admissions ;
 SELECT * from admissions where admission_date=discharge_date; 
 SELECT count(*) as total_admissions FROM admissions where patient_id=579;
 SELECT DISTINCT city FROM patients where province_id='NS';  
 SELECT first_name,last_name,birth_date FROM patients where height>160 and weight>70; 
 SELECT DISTINCT YEAR(birth_date)as birth_year FROM patients order by birth_year asc; 
 SELECT first_name FROM patients GROUP BY first_name having count(*)=1; 
 SELECT patient_id,first_name FROM patients where first_name LIKE 'S%S' and length(first_name)>=6; 
 SELECT p.patient_id,p.first_name,p.last_name from patients p join admissions a on p.patient_id = a.patient_id where a.diagnosis='Dementia'; 
 SELECT first_name FROM patients ORDER BY lenght(first_name),first_name; 
 SELECT SUM (CASE WHEN gender='M' THEN 1 ELSE 0 END ) AS male_patients, SUM (CASE WHEN gender='F' THEN 1 ELSE 0 END) AS female_patients FROM patients; 
 SELECT patient_id,diagnosis FROM admissions GROUP BY patient_id,diagnosis HAVING count(*)>1; 
 SELECT city, count(*) as total_patients FROM patients GROUP BY city order by total_patients DESC, city ASC; 
 SELECT * FROM doctors; 
 SELECT first_name,last_name,'Patient'as role from patients 
 UNION all
 SELECT first_name,last_name,'Doctor'as role from doctors; 
 SELECT allergies,count(*) as popularity from patients where allergies is not null 
 group by allergies 
 order by popularity DESC ;  
 SELECT  first_name, last_name,birth_date  FROM  patients where birth_date>= '1970-01-01' AND birth_date<= '1980-01-01' ORDER BY birth_date ASC; 
 SELECT CONCAT (UPPER(last_name),',',LOWER(first_name)) as full_name FROM patients ORDER BY first_name DESC; 
 select province_id, sum(height)as total_height from patients  group by province_id having sum(height)>=7000; 
 select max(weight) - min(weight) as weight_difference from patients where last_name ='Maroni'; 
 select day(admission_date) admission_day,count(*) as total_admission from admissions group by day (admission_date)order by total_admission desc;
 select* from admissions; 
 select floor(weight/10)*10 as weight_group,count(*) as total_patients from patients where weight is not NULL group by floor(weight/10) order by weight_group desc; 
select patient_id,weight,height, case when weight/power(height/100.0,2) >=30 then 1 else 0 end as isObese  from patients where height>0; 
select p.patient_id,p.first_name,p.last_name,d.specialty 
from patients p join admissions a on p.patient_id = a.patient_id join doctors d on a.attending_doctor_id=d.doctor_id
where a.diagnosis='Epilepsy' and d.first_name='Lisa'; 
select distinct p.patient_id, concat(p.patient_id,CHAR_LENGTH(p.last_name),year(p.birth_date)) as temp_password from patients p join admissions a on p.patient_id =a.patient_id;