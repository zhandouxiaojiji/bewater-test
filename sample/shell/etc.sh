#生成一份配置
cd ..
workspace=`dirname $0`
workspace=`realpath $workspace`
proj_name=$(basename $workspace)
echo $proj_name
cd -

clustername=$1 #master
start_script=$2
is_deamon=$3 #true

config=${clustername}.cfg

mkdir -p ${workspace}/log
mkdir -p ${workspace}/etc
cd ${workspace}/etc

echo workspace = \"../proj/${proj_name}/\" > ${config}
echo clustername = \"${clustername}\" >> ${config}
echo thread = 8 >> ${config}
echo logpath = \".\" >> ${config}
echo harbor = 0 >> ${config}
echo start = \"${start_script}\" >> ${config}
echo 'cluster = workspace.."config/clustername.lua"' >> ${config}
echo 'bootstrap = "snlua bootstrap"' >> ${config}
echo 'lualoader = "lualib/loader.lua"' >> ${config}
#echo 'preload = workspace.."script/global.lua"' >> ${config}
echo 'snax = workspace.."script/?.lua"' >> ${config}
echo 'luaservice = workspace.."script/service/?.lua;"..workspace.."../../service/?.lua;".."./service/?.lua;".."./liblua/?.lua;"' >> ${config}
echo 'cpath = workspace.."../../luaclib/?.so;".."./cservice/?.so;./luaclib/?.so"' >> ${config}
echo 'lua_path = workspace.."../../lualib/?.lua;"..workspace.."script/?.lua;"..workspace.."../../common/?.lua;".."./lualib/?.lua;"' >> ${config}
echo 'lua_cpath = workspace.."../../luaclib/?.so;".."./luaclib/?.so;"'  >> ${config}

if [ "${is_deamon}" == "true" ]
then
    echo daemon = \"${workspace}/log/pid/${clustername}.pid\" >> ${config}
    echo logger = \"${workspace}/log/${clustername}.log\" >> ${config}
else
    echo logger = nil >> ${config}
fi
