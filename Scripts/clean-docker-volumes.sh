docker stop galmig galmig-writer postgres_galmig postgres_galileo 
docker rm galmig galmig-writer postgres_galmig postgres_galileo 
docker volume rm $(docker volume ls -qf dangling=true)
