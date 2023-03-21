# proto-gen-go

This is the repo for my [docker image](https://hub.docker.com/r/krixlion/go-grpc-gen) that I use for development of microservices in go.

## Used tools
[protoc-gen-go-grpc](https://github.com/grpc/grpc-go/tree/master/cmd/protoc-gen-go-grpc) \
[protoc-gen-go](https://github.com/golang/protobuf) \
[protoc-gen-doc](https://github.com/pseudomuto/protoc-gen-doc) \
[protoc-go-inject-tag](https://github.com/favadi/protoc-go-inject-tag)

## Environment variables
**DOC_OUT** - where should doc files be created \
**PROTO_DIRPATH** - path to directory containing necessary proto files \
**PROTO_FILENAME** - name of proto file to compile \
**MODULE_NAME** - go module name eg. "github.com/krixlion/go-reflex-dlv" \
**PB_PATH** - relative path to directory where generated files should be placed

## Mount
Container will read everything from `/app` and that's where you should mount your project root. 

## Examples

### Docker run 

```sh
$ docker run --rm -v $(pwd)/project/root:/app \
    -e DOC_OUT=docs/ \
    -e PROTO_DIRPATH=api/ \
    -e PROTO_FILENAME=api.proto \
    -e MODULE_NAME=github.com/org/project \
    -e PB_PATH=pkg/api \
		krixlion/go-grpc-gen:1.19.3

```

Or define these values in the .env file:

```sh
$ docker run --rm -v $(pwd)/project/root:/app \
    --env-file .env \
    krixlion/go-grpc-gen:1.19.3
```
