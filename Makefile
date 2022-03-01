.PHONY all up down clean

all:	up

up:
	cd ./srcs && docker-compose up --build

down:
	docker-compose down && cd ..

clean:	
	docker stop $$(docker ps -qa)
	docker rm $$(docker ps -qa)
	docker rmi -f $$(docker image -qa)
	docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker volume ls -q) 2>/dev/null