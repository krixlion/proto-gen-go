FROM golang:1.21.0


ADD entrypoint.sh /

RUN apt-get update 
RUN apt-get install unzip
RUN git clone https://github.com/googleapis/api-common-protos /google

WORKDIR /app

# Install protoc
RUN curl -LOSs https://github.com/protocolbuffers/protobuf/releases/download/v22.2/protoc-22.2-linux-x86_64.zip 
RUN unzip protoc-22.2-linux-x86_64.zip -d ./proto
RUN chmod 755 -R ./proto/bin

RUN cp ./proto/bin/protoc /usr/local/bin
RUN cp -R ./proto/include/* /usr/local/include

# Install plugins
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest 
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest 
RUN go install github.com/favadi/protoc-go-inject-tag@latest 
RUN go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc@latest

ENTRYPOINT ["sh", "/entrypoint.sh"]