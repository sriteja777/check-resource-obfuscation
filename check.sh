if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    exit;
fi

apk_file=`basename $1`
rel_path="${1%/*}" || "./"

if [ $rel_path == $apk_file ]
then
	rel_path="./"
fi

dir_path=`builtin cd $rel_path; pwd`
dir_name=`basename $dir_path`
apk_path="$dir_path/$apk_file"

# echo "$apk_path" 

# count=$(apkanalyzer resources names --config=default --type=anim  $apk_path | grep 2130771968 -c)
count=$(aapt dump resources  "$apk_path" | ggrep 2130771968 -c)

if [ $count -gt 0 ]
then
	echo "$apk_file -> doesn't work"
else 
	echo "$apk_file -> works"
fi