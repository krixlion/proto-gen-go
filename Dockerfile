FROM golang:1.19.3

WORKDIR /app

# Install protoc
RUN curl -LOSs https://github.com/protocolbuffers/protobuf/releases/download/v3.15.8/protoc-3.15.8-linux-x86_64.zip 
RUN apt-get update && apt-get install unzip
RUN unzip protoc-3.15.8-linux-x86_64.zip -d ./proto
RUN chmod 755 -R ./proto/bin

RUN cp ./proto/bin/protoc /usr/local/bin
RUN cp -R ./proto/include/* /usr/local/include

# Install plugins
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest 
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest 
RUN go install github.com/favadi/protoc-go-inject-tag@latest 
RUN go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc@latest

# ENV DOC_OUT # Relative path
# ENV PROTO_DIRPATH # absolute path
# ENV PROTO_FILENAME
# ENV MODULE_NAME="github.com/krixlion/dev_forum-auth/"

ENTRYPOINT ["/usr/bin/sh", "./entrypoint.sh"]