start:
	@docker-compose up -d

stop:
	@docker-compose down

build:
	@docker-compose build

ssh:
	@docker exec -it web-fysiotest bash

restart: stop start

db: @docker exec -it db-fysiotest bash
