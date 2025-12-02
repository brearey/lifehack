-- TODO: delete this file

-- ex07
INSERT INTO menu
(id, pizzeria_id, pizza_name, price)
VALUES
(19, 2, 'greek pizza', 800);

-- ex08
INSERT INTO menu
(id, pizzeria_id, pizza_name, price)
VALUES (
(SELECT MAX(m.id) FROM menu AS m) + 1,
(SELECT pi.id FROM pizzeria AS pi WHERE name = 'Dominos'),
'sicilian pizza', 
900
);

-- ex09
INSERT INTO person_visits
(
  id, person_id, pizzeria_id, visit_date
)
VALUES
(
  (SELECT MAX(id) FROM person_visits) + 1,
  (SELECT id FROM person WHERE name = 'Denis'),
  (SELECT id FROM pizzeria WHERE name = 'Dominos'),
  '2022-02-24'
),
(
  (SELECT MAX(id) FROM person_visits) + 2,
  (SELECT id FROM person WHERE name = 'Irina'),
  (SELECT id FROM pizzeria WHERE name = 'Dominos'),
  '2022-02-24'
);

-- ex10
INSERT INTO person_order
(
  id, person_id, menu_id, order_date
)
VALUES
(
  (SELECT MAX(id) FROM person_order) + 1,
  (SELECT id FROM person WHERE name = 'Denis'),
  (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
  '2022-02-24'
),
(
  (SELECT MAX(id) FROM person_order) + 2,
  (SELECT id FROM person WHERE name = 'Irina'),
  (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
  '2022-02-24'
);

-- ex11
UPDATE menu SET price = ROUND(price - price / 10) WHERE pizza_name = 'greek pizza';

-- ex12
INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT
  generate_series(
    (SELECT MAX(id) FROM person_order) + 1,
    (SELECT MAX(id) FROM person_order) + (SELECT COUNT(id) FROM person),
    1
  ),
  generate_series(
    (SELECT MIN(id) FROM person),
    (SELECT MAX(id) FROM person),
    1
  ),
  (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
  '2022-02-25';
  
-- ex13
DELETE FROM person_order WHERE order_date = '2022-02-25';

DELETE FROM menu WHERE pizza_name = 'greek pizza';