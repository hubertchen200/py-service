app_name = pyService


if [ $1 = "build" ]; then
    docker buildx build --platform=linux/amd64 -f Dockerfile -t hub.comcast.net/xmt360/mfscaching:$version . --output=type=registry
fi


build:
	docker build -t $(app_name) .

run:
	docker run --name $(app_name) --detach -p 8003:8003 $(app_name)

kill:
	docker stop $(app_name)
	docker container prune -f
	docker rmi -f $(app_name)

