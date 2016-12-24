#!/bin/bash
echo "enter url"
read read_url
IFS='/' get_project=( $read_url )
#if [ ${get_project[0]} == "http:" ] ; then
#	read_url[0]="https:"
#fi
IFS=' '
if [ ${#get_project[*]} -lt 3 ] ; then
	echo "Invalid URL..."
	exit 1
else
	project_name=${get_project[-1]}
	echo $project_name
	echo ${get_project[*]}
fi
echo $read_url
mkdir $project_name
echo $project_folder1
if [ $? -eq 0 ]; then
    cd $project_name
	pwd
    clone="git clone "$read_url" master"
	$clone
#   mkdir "master/docs"
#   git add .
#   git commit -m "docs added"
    copy="cp -r master gh-pages"
	$copy 
	cd gh-pages
	pwd
	git branch
	git branch gh-pages
	git symbolic-ref HEAD refs/heads/gh-pages
	git checkout gh-pages
	git branch
	git branch -d master
	git clean -fdx 
	touch index.html
	echo "<html><body>Site Enabled!!</body></html>" > index.html
	git add index.html
	git commit -m "added Website"
	git push --set-upstream origin gh-pages
else
    echo "$1" 1>&2
fi

