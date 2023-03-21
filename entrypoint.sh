#! /bin/sh.

protoc \
    --doc_out=$DOC_OUT \
    --doc_opt=markdown,api.md \
    --go-grpc_out=module=$MODULE_NAME \
    --go_out=module=$MODULE_NAME \
    -I $PROTO_DIRPATH \
    $PROTO_FILENAME

protoc-go-inject-tag -input="./*.pb.go"
