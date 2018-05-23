publish:
	docker build -t apisgarpun/simple-app-script-python:latest -f ./Dockerfile .
	docker push apisgarpun/simple-app-script-python:latest

test:
	docker-compose -f docker-compose-test-run.yml run --name "test-simple-app-script-python" --rm app