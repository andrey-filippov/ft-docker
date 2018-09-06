start:
	@docker-compose up -d

stop:
	@docker-compose down

build:
	@docker-compose build

ssh:
	@docker exec -it web-fysiotest bash

restart: stop start

ssh-db:
	@docker exec -it db-fysiotest bash

ssh-app:
	@docker exec -it fysiotest-app bash

ssh-api:
	@docker exec -it fysiotest-api bash
