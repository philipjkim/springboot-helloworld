IMAGE_NAME=springboot-helloworld

build-img:
	docker build -t $(IMAGE_NAME) .

run: build-img
	docker run -i -t --rm -p=8080:8080 --name="$(IMAGE_NAME)" $(IMAGE_NAME)
