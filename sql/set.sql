-- UNION il permet de faire l'union de deux ou plusieurs tables

SELECT *
FROM employees
WHERE department_id IN (10, 20);

-- La requ�te �quivalente en utilisant UNION

SELECT *
FROM employees
WHERE department_id = 10
UNION
SELECT *
FROM employees
WHERE department_id = 20;

-- Et si on avait plusieurs d�partements?

SELECT employee_id
FROM employees
WHERE department_id = 10
UNION
SELECT employee_id
FROM employees
WHERE department_id = 20
UNION
SELECT employee_id
FROM employees
WHERE department_id = 50;

-- Et si je veux afficher les d�partments qui ont des employ�s?

SELECT DISTINCT department_id
FROM employees;

-- Ou alors utiliser INTERSECT

SELECT department_id
FROM departments
INTERSECT
SELECT department_id
FROM employees;

-- A U B  = B U A  
-- A ^ B = B ^ A 
-- A - B <> B - A