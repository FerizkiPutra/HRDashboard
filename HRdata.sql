-- Total Employee
select  sum([Employee Count])  Employee_Count 
from dbo.HRdata

-- Total Attrition 
select count(attrition) 
from hrdata 
where attrition='Yes'

-- Attrition Rate
select 
round (((select count(attrition)
from hrdata where attrition='Yes')/ 
sum([Employee Count])) * 100,2)
from hrdata;

--Active Employee

select (select sum([Employee Count]) from hrdata) - count(attrition)  active_employee 
from hrdata
where attrition='Yes'

--Average Age
select round(avg(age),0) 
from hrdata;

--Attrition by Gender
Select gender, count(attrition)  attrition_count 
From hrdata
Where attrition='Yes'
Group by gender
Order by count(attrition) DESC

-- Department wise Attrition
select department, count(attrition), round((cast (count(attrition) as numeric) / 
(select count(attrition) from hrdata where attrition= 'Yes')) * 100, 2) as pct from hrdata
where attrition='Yes'
group by department 
order by count(attrition) DESC

--No of Employee by Age Group
SELECT age,  sum([Employee Count]) AS employee_count
FROM hrdata
GROUP BY age
order by age

-- Education Field wise Attrition
select [Education Field], count(attrition) as attrition_count 
From hrdata
Where attrition='Yes'
Group by [Education Field]
Order by count(attrition) DESC

--Attrition Rate by Gender for different Age Group
select [CF_age band], gender, count(attrition) as attrition, 
round((cast(count(attrition) as numeric) / (select count(attrition) from hrdata where attrition = 'Yes')) * 100,2) as pct
from hrdata
where attrition = 'Yes'
group by [CF_age band], gender
order by [CF_age band], gender desc







