SELECT employee_id, first_name, last_name, department_id,
CASE department_id
WHEN 50 THEN 'Logistiques'
WHEN 80 THEN 'Commercial'
ELSE 'Autres'
END department
FROM employees;


-- Ecrire une requ�te en utilisant CASE afin d'afficher 'inf' pour les employ�s affect�s � un d�partment dont l'ID est <= 50
-- 'mid' pour les employ�s qui sont affect�s � un d�apartement >50 et <= 80 et 'sup' pour ceux qui ont un d�partement id > 80

SELECT employee_id, first_name, last_name, department_id,
CASE 
    WHEN department_id <=50 THEN 'inf'
    WHEN department_id > 50 AND department_id <= 80 THEN 'mid'
    ELSE 'sup'
END department
FROM employees;

-- Cr�ation de vue/view � partir de la requ�te pr�c�dente

CREATE VIEW my_departments
AS
SELECT employee_id, first_name, last_name, department_id,
CASE 
    WHEN department_id <=50 THEN 'inf'
    WHEN department_id > 50 AND department_id <= 80 THEN 'mid'
    ELSE 'sup'
END department
FROM employees;

SELECT * FROM my_departments;
