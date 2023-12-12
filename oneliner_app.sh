#!/bin/bash


read -p "Enter the full path to your file:" file_path
#file_name="/Users/suraj.kumar/Documents/bash_learn/test2bash.sh"
tmp_file_path="/Users/suraj.kumar/Documents/bash_learn/one_line_tmp.sh"

tmp=$(cat $file_path | awk '{$1=$1;print}'); echo -n "$tmp" > $tmp_file_path
IFS=$'\n'
final=""
for LINE in $(cat "$tmp_file_path")
    do final=$final$LINE" ;"
        #echo "$LINE"
done
size=${#final}  ##size of the final line of command
rm -rf "$tmp_file_path"
#echo "$size"
final="${final[@]:13:$size-15}"
echo "$final" | pbcopy


