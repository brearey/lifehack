up:
	docker compose up --build

down:
	docker compose down -v

connect:
	psql -U postgres -d school21 -h localhost -p 5432

seed:
	psql -U postgres -h localhost -p 5432 -d school21 < model_4_5.sql

seed-base:
	psql -U postgres -h localhost -p 5432 -d school21 < model.sql