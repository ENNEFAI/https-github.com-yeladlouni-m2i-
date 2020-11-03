-- Describe permet de d�crire une table 

DESCRIBE employees;

DESC employees;


-- Ins�rer des enregistrements dans une table

-- Ins�rer un nouveau d�partement 999 qui a le nom dummy et dont la localistation est � Gen�ve

DESC departments;

INSERT INTO departments(department_id,department_name, location_id) 
VALUES (999,'dummy',2900);

INSERT INTO departments  
VALUES (988,'dummy',NULL,2900);

COMMIT;  -- Permet de valider les changements

ROLLBACK; -- Permet d'annuler les changements

-- Aujourd'hui on vient de recruter un employ� qui s'appelle Dupont mais on connait pas son nom encore
-- dans le d�partement Shipping et qui n'a pas de manager pour le moment

-- Ecrire une requ�te afin de le stocker dans la base de donn�es

INSERT INTO employees (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID)
VALUES ('209',NULL,'Dupont','dupont@gmail.com',NULL,SYSDATE,'SA_REP',NULL,NULL,NULL,50);

COMMIT;

-- Cr�ation d'une table � partir d'un SELECT

CREATE TABLE department50
AS
SELECT *
FROM employees
WHERE department_id = 50;

-- Ins�rer dans la nouvelle table les employ�s du d�partement 90

INSERT INTO department50
SELECT *
FROM employees
WHERE department_id = 90;

-- L'employ� Dupont a chang� son adresse email, la nouvelle est dupont_dupont@outlook.com
-- Ecrire une requ�te afin de mettre � jour son email

UPDATE employees
SET email = 'dupont_dupont@outlook.com'
WHERE LOWER(last_name) = 'dupont';

COMMIT;


-- On se trompe lors d'une instruction DELETE, on met pas de condition

DELETE FROM department50;

COMMIT;

ROLLBACK;  -- Si le commit a �t� d�j� ex�cut�, on ne peut plus r�cup�rer les donn�es

-- DROP permet de supprimer une table ou un objet d'une mani�re g�n�rale

DROP TABLE department50;


-- SAVEPOINT permet de subdiviser le script en groupes

UPDATE departments
SET department_name = 'Logistiques'
WHERE department_name = 'Shipping';

SAVEPOINT A;

INSERT INTO departments
VALUES(777, 'Fraude interne', NULL, NULL);


DELETE FROM departments
WHERE department_id = 999;

SAVEPOINT B;

COMMIT TO A;

ROLLBACK TO B;

-- Pour les DDL = data definition language, elles permettent de cr�er, supprimer des objets/tables, e.g DROP, CREATE...
-- La m�me chose pour les DCL: data control language ==> gestion de permissions

-- Ecrire une requ�te afin de 
-- Cr�er une table employees_usa qui contient juste les employ�s qui sont situ�s aux USA
-- Ajouter un employ� dummy � la table avec des donn�es fictives en mettant comme date de recrutement 01/05/2020 et comme email test@gmail.com
-- Mettre � jour l'email de l'employ� afin de le mettre en majuscules
-- Supprimer cet employ�
-- Valider jusqu'� la MAJ afin que l'employ� ne soit pas supprim�
