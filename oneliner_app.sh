#!/bin/bash


read -p "Enter the full path to your file:" file_path
tmp_file_name="one_line_tmp.sh"
tmp_file_path=$(pwd)"/"$tmp_file_name

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
