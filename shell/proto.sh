workspace=$(cd $(dirname $0); pwd)/..

cd  ${workspace}/script/def/proto
find . -name "*.proto" | xargs ${workspace}/../../common/tools/protoc3 -o package.pb
pbjs -t static-module -w commonjs -o ${workspace}/data/SocketProtobuf.js *.proto --keep-case
sed -i '4,4c var $protobuf = protobuf;' ${workspace}/data/SocketProtobuf.js

echo done.

