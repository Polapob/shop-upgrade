run:
	docker compose up --build -d

migrate:
	docker compose exec webapp rails db:migrate
