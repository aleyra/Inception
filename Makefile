.PHONY: all up down clean re

all :	
	mkdir ../data
	mkdir ../data/vol_wordpress
	mkdir ../data/vol_db
	mkdir -p dev
	touch dev/null
	make up

up :
	cd ./srcs && docker-compose up -d --build

down :
	cd .. && docker-compose down
	#or docker-compose -f PATH && cd ..

stop :
	docker stop $$(docker ps -qa)

rm :
	docker rm $$(docker ps -qa)

rmi :
	docker rmi -f $$(docker image ls -qa)

vol :
	docker volume rm $$(docker volume ls -q)

netwk :
	docker network rm $$(docker network ls -q)

clean :	
	docker stop $$(docker ps -qa)
	docker rm $$(docker ps -qa)
	docker rmi -f $$(docker image ls -qa)
	docker volume rm $$(docker volume ls -q)
	#docker network rm $$(docker network ls -q) 2>dev/null

fclean : clean 
	#docker-compose stop
	#docker-compose rm -f
	sudo rm -rf ../data
	rm -rf dev

re : fclean all