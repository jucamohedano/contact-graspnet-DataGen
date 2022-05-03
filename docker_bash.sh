#docker exec -it -u root contact-graspnet-datagen_workspace:latest bash
sudo docker-compose -f docker-compose.yml exec workspace bash -ic "bash; (exit 0)"
