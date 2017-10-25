#!/bin/bash

# NOTE: this will only get the visible pods listed which is
# restricted by default to 10 or so.  Should be OK in most cases.

link='https://www.richroll.com/category/podcast/'
page=$(wget $link -q -O -)
pods=$(grep 'article-link' <<< "$page")
echo $pods | sed $"s/\ <a/\n<a/g" > podcasts-to-download.list

# To get the complete list you will have to open the page in chrome,
# manually scroll so all pods are visible then use the chrome dev tools to
# copy the content from the div id=main to a file.  Then you can for example:
# grep 'article-link' main-file > new-out
