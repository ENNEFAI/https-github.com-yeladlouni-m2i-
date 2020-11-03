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
values ('209',NULL,'Dupont','dupont@gmail.com',NULL,SYSDATE,'SA_REP',NULL,NULL,NULL,50);

