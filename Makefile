.PHONY: all up down clean re

all :	up

up :
	cd ./srcs && docker compose up --build -d

down :
	docker-compose down && cd ..

stop :
	docker stop $$(docker ps -qa)

rm :
	docker rm $$(docker ps -qa)

rmi :
	docker rmi -f $$(docker image ls -qa)

vol :
	docker volume rm $$(docker volume ls -q)

clean :	
	docker stop $$(docker ps -qa)
	docker rm $$(docker ps -qa)
	docker rmi -f $$(docker image ls -qa)
	docker volume rm $$(docker volume ls -q)
	# docker network rm $$(docker network ls -q) 2>dev/null

re : clean all