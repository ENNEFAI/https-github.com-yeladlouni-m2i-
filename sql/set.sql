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

-- UNION ALL permet de renvoyer l'ensemble des r�sultats y compris les doublons

-- MINUS  permet de renvoyer les enregistements qui sont sur la premi�re table et pas ceux qui sont sur la deuxi�me table


-- Ecrire une requ�te en utilsiant MINUS afin de renvoyer l'id de l'employ� ainsi que son nom complet pour les employ�s de la r�gion d'am�rique

SELECT *
FROM employees
WHERE department_id = 10
MINUS
SELECT *
FROM departments
WHERE manager_id IS NULL;
