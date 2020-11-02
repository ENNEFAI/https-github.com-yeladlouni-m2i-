-- S�lectionner les employ�s avec le nom du d�partement auquel ils sont affect�s

-- 1�re syntaxe (ambigu�t� en cas de pr�sence de deux colonnes en commun)

SELECT employee_id, first_name, last_name, department_name
FROM employees
NATURAL JOIN departments;

-- 2�me syntaxe

SELECT employee_id, first_name, last_name, department_name
FROM employees
JOIN departments USING (department_id);

-- 3�me syntaxe

SELECT employee_id, first_name, last_name, department_name
FROM employees
JOIN departments  ON employees.department_id = departments.department_id;


-- S�lectionner les employ�s m�me ceux qui ne sont affect�s � aucun d�partement

SELECT employee_id, first_name, last_name, emp.department_id, dpt.department_name
FROM employees emp
LEFT OUTER JOIN departments dpt ON emp.department_id = dpt.department_id;

-- S�lectionner les employ�s affect�s aux diff�rents d�partrments et afficher m�me les d�partements auquels aucun employ� n'est affect�

SELECT employee_id, first_name, last_name, department_name
FROM employees emp
RIGHT OUTER JOIN departments dpt ON emp.department_id = dpt.department_id


-- S�lectionner les employ�s affect�s aux diff�rents d�partements ainsi que les employ�s qui ne sont affect�s � aucun des d�partement
-- et les d�partement auquels aucun employ� n'est affect�

SELECT employee_id, first_name, last_name, department_name
FROM employees emp
FULL OUTER JOIN departments dpt ON emp.department_id = dpt.department_id


-- Exemple 1: Afficher pour les employ�s le ID, le pr�nom, le nom, le salaire et le nom du d�partement auquel il est affect�

SELECT employee_id, first_name, last_name, salary, department_name
FROM employees emp
LEFT OUTER JOIN DEPARTMENTS dpt ON (emp.department_id = dpt.department_id);

-- Exemple 2: Afficher pour les employ�s l'ID, le pr�nom, le nom, le salaire et le nom du d�partement auquel il est affect�
-- Pour les employ�s qui ne sont affect�s � aucun d�partement, afficher "Non affect�" comme nom de d�partement


SELECT employee_id, first_name, last_name, salary, NVL(department_name,'Non affect�')
FROM employees emp
LEFT OUTER JOIN DEPARTMENTS dpt ON (emp.department_id = dpt.department_id);

-- Ecrire une requ�te afin d'afficher pour chaque d�partement, le nom de d�partement et le nombre d'employ�s affect�s
SELECT department_name, COUNT(employee_id)
FROM employees
JOIN departments USING (department_id)
GROUP BY department_name;


-- Ecrire une requ�te afin d'afficher pour chaque d�partement, le nom de d�partement et le nombre d'employ�s affect�s
-- Afficher un nombre d'employ�s � 0 pour les d�partements auquels aucun employ� n'est affect�

SELECT NVL(department_name, 'Autres'), COUNT(employee_id)
FROM employees emp
LEFT OUTER JOIN departments dpt ON (emp.department_id = dpt.department_id)
GROUP BY department_name;

-- Ecrire une requ�te pour afficher le nom des d�partement auquels sont affect�s plus que 10 employ�s
SELECT NVL(department_name, 'Autres'), COUNT(employee_id)
FROM employees emp
LEFT OUTER JOIN departments dpt ON (emp.department_id = dpt.department_id)
GROUP BY department_name
HAVING COUNT(employee_id) > 10
ORDER BY COUNT(employee_id);



-- Ecrire une requ�te pour afficher le total des salaires par d�partement, afficher 0 pour les d�partements auquels aucun 
-- employ� n'est affect�

-- Une autre mani�re d'�crire les jointures

SELECT emp1.first_name, emp2.first_name
FROM employees emp1, employees emp2
WHERE emp1.employee_id = emp2.manager_id

-- Ecrire une requ�te afin d'afficher pour chaque nom de r�gion, le nombre total des employ�s
-- Afficher 0 pour les r�gions sans employ�s

SELECT NVL(region_name, 'autre'), COUNT(employee_id)
From employees emp
LEFT JOIN departments dpt ON dpt.department_id = emp.department_id
LEFT JOIN locations loc ON loc.location_id = dpt.location_id
LEFT JOIN countries co ON co.country_id = loc.country_id
LEFT JOIN regions reg ON reg.region_id = co.region_id
GROUP BY region_name;

-- Ecrire une requ�te afin d'afficher pour chaque d�partement et chaque fonction le nombre d'employ�s, 0 pour les combinaisons
-- qui ne correspondent � aucun employ�

SELECT department_name, job_title, COUNT(employee_id)
FROM
(SELECT department_id, job_id
FROM departments
CROSS JOIN jobs) cmb
FULL OUTER JOIN employees emp ON (emp.department_id = cmb.department_id AND emp.job_id = cmb.job_id)
FULL OUTER JOIN departments dpt ON (cmb.department_id = dpt.department_id)
FULL OUTER JOIN jobs job ON (cmb.job_id = job.job_id)
GROUP BY department_name, job_title;


-- Ecrire une requ�te (en utilisant une requ�te imbriqu�e/sous requ�te) afin de retourner tous les employ�s dont la fonction est Programmer
SELECT last_name, job_id
FROM employees
WHERE job_id = (SELECT job_id
            FROM jobs
            WHERE job_title LIKE 'Programmer')

-- Ecrire une requ�te (en utilisant une requ�te imbriqu�e/sous requ�te) afin de retourner tous les employ�s dont la fonction commence avec un "P"
SELECT last_name, job_id
FROM employees
WHERE job_id IN (SELECT job_id
            FROM jobs
            WHERE job_title LIKE ('P%'))
            
            
