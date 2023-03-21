build:
	docker build . -t krixlion/go-grpc-gen
	
run:
	docker run  -v $(shell pwd)/testdata:/app \
		--env-file .env \
		krixlion/go-grpc-gen