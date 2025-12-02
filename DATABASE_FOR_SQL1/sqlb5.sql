-- ex00
CREATE VIEW v_persons_female AS SELECT * FROM person WHERE gender = 'female';
CREATE VIEW v_persons_male AS SELECT * FROM person WHERE gender = 'male';

-- ex02
CREATE VIEW
v_generated_dates AS
SELECT
generated_date::date
FROM
generate_series(
  '2022-01-01'::date,
  '2022-01-31'::date,
  '1 day'::interval)
AS generated_date
ORDER BY generated_date;

-- ex04
CREATE VIEW v_symmetric_union AS
WITH
R AS (SELECT person_id FROM person_visits WHERE visit_date = '2022-01-02'),
S AS (SELECT person_id FROM person_visits WHERE visit_date = '2022-01-06')
(SELECT * FROM R EXCEPT SELECT * FROM S)
UNION
(SELECT * FROM S EXCEPT SELECT * FROM R)

ORDER BY person_id;

-- ex05
CREATE VIEW v_price_with_discount AS
SELECT
p.name,
m.pizza_name,
m.price,
(m.price - m.price * 0.1)::integer AS discount_price
FROM person_order AS po
INNER JOIN menu AS m ON m.id = po.menu_id
INNER JOIN person AS p ON p.id = po.person_id
ORDER BY p.name, m.pizza_name;

-- ex06
CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT
pi.name
FROM pizzeria AS pi
  JOIN person_visits AS pv ON pv.pizzeria_id = pi.id
  JOIN menu AS m ON m.pizzeria_id = pi.id
WHERE pv.visit_date = '2022-01-08' AND pv.person_id = 9 AND m.price < 800
WITH DATA;

-- ex07
INSERT INTO person_visits
(
  id, person_id, pizzeria_id, visit_date
)
VALUES
(
  (SELECT MAX(id) FROM person_visits) + 1,
  (SELECT id FROM person WHERE name = 'Dmitriy'),
  (SELECT pi.id
  FROM pizzeria pi
  JOIN menu m ON m.pizzeria_id = pi.id
  WHERE m.price < 800
    AND pi.name NOT IN (SELECT name FROM mv_dmitriy_visits_and_eats)
  LIMIT 1),
  '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

-- ex08
DROP VIEW v_persons_female;
DROP VIEW v_persons_male;
DROP VIEW v_generated_dates;
DROP VIEW v_symmetric_union;
DROP VIEW v_price_with_discount;
DROP MATERIALIZED VIEW mv_dmitriy_visits_and_eats;