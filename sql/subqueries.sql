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
            

--


SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(SALARY)
                      FROM employees
                      WHERE department_id = 50)

