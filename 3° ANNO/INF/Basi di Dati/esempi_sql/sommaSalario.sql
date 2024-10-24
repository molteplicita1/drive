USE SALARIO;

SELECT employee_id, q1_2022 + q2_2022 + q3_2022 + q4_2022 as y_2022
FROM quarterly_sales
ORDER BY employee_id ASC;

SELECT SUM(q1_2022 + q2_2022 + q3_2022 + q4_2022) as totale
FROM quarterly_sales
