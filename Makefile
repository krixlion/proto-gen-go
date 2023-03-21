build:
	docker build . -t go-grpc-gen
	
run:
	docker run  -v $(shell pwd)/testdata:/app \
		--env-file .env \
		go-grpc-gen