.PHONY: all init build up logs adminpass stop forcereset shell

all: up

init:
	mkdir -p data
	chmod ugo+rwX data

build:
	docker-compose build

up: init build
	docker-compose up -d

logs:
	docker-compose logs -f jenkins

adminpass:
	docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

stop:
	docker-compose stop

forcereset: stop
	docker-compose rm --force
	rm -rf data

shell:
	docker-compose exec jenkins bash

