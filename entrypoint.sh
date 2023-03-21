#! /bin/sh.

mkdir -p $DOC_OUT

protoc \
    -I /app/$PROTO_DIRPATH \
    -I /google \
    --doc_out=$DOC_OUT \
    --doc_opt=markdown,api.md \
    --go-grpc_out=module=$MODULE_NAME:/app/. \
    --go_out=module=$MODULE_NAME:/app/. \
    $PROTO_FILENAME

protoc-go-inject-tag -input="/app/$PB_PATH/*.pb.go"
