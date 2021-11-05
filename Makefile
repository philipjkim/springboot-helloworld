IMAGE_NAME=springboot-helloworld

build-img:
	docker build -t $(IMAGE_NAME) .

run: build-img
	docker run -i -t --rm -p=8080:8080 --name="$(IMAGE_NAME)" $(IMAGE_NAME)

register-taskdef:
	aws ecs register-task-definition --region ap-northeast-2 --cli-input-json file://./aws/task-def.json

# TODO: replace YOUR_CLUSTER_NAME to real cluster name you want to create with.
create-cluster:
	aws ecs create-cluster --region ap-northeast-2 --cluster-name YOUR_CLUSTER_NAME

create-svc:
	aws ecs create-service --region ap-northeast-2 --cli-input-json file://./aws/svc.json
