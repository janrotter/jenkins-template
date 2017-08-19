.PHONY: all init

all: up 

init:
	mkdir -p data
	chmod ugo+rwX data

up: init
	docker-compose up -d

logs:
	docker-compose logs -f jenkins
