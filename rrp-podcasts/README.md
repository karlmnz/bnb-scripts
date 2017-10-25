# rrp-podcasts

The bin folder has two scripts used to find and download 
RichRoll podcast files.

## Instructions

Execute

$cd bin
$./generate-podcasts-to-download-list.sh

This will get a list of the most recent visible podcasts and save in file
named podcasts-to-download.list.
*to get more podcasts into the list follow the instructions in the
generate-podcasts-to-download-list.sh, which requires manually visiting
the podcast catalog page in a browser*

Next open/review/update the podcasts-to-download.list 
e.g. generates around 10 entries, but may only want the most recent 2 or 3.

Then to download the files, execute

$./download-rrp-mp3s-from-list.sh

This will save the podcast mp3 file/s in the rrp-podcasts folder.



