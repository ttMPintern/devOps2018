1) to run :
  docker build --tag my/macpaw .
  docker run -p 80:80 --name devops -d my/macpaw
  docker exec -it devops bash

2) to delete from computer
  docker stop devops
  docker rm devops
  docker rmi my/macpaw

