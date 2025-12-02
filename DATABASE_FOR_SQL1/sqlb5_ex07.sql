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