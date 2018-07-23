workspace=$(cd "$(dirname "$0")"; pwd)/..

cd $workspace/../../skynet
./skynet ${workspace}/etc/${1}.cfg
