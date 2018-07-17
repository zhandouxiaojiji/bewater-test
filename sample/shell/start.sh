workspace=`dirname $0`
workspace=`realpath $workspace`/..

cd $workspace/../../skynet
./skynet ${workspace}/etc/${1}.cfg
