build:
	docker build -t jmcarbo/docker-postfix .

run:
	docker-compose up

exec:
	docker exec -ti dockerpostfix_postfix_1 /bin/bash
