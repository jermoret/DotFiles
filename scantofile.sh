#! /bin/sh
set +o noclobber
#
#   $1 = scanner device
#   $2 = friendly name
#

#   
#       100,200,300,400,600
#
resolution=200
device=$1
BASE="/home/jerome/gdrive/Scan"
mkdir -p $BASE
if [ "`which usleep  2>/dev/null `" != '' ];then
    usleep 10000
else
    sleep  0.01
fi
output_tmp=$BASE/$(date +"%Y%m%d")_change

echo "scan from $2($device)"
scanimage --device-name "$device" --resolution $resolution --batch="$output_tmp"_%04d.tiff  --format=tiff -x 210 -y 297

for tifffile in $(ls "$output_tmp"*)
do
   tiffcp -c lzw "$tifffile" "$tifffile".lzw.tiff
   tiff2pdf -j "$tifffile".lzw.tiff > "$tifffile".pdf
   rm -f "$tifffile"
   rm -f "$tifffile".lzw.tiff
done

pdftk $output_tmp*.pdf cat output "$output_tmp".pdf
rm -f "$output_tmp"_*
