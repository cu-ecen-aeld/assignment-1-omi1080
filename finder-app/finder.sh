#!/usr/bin/bash

help() {
	echo "Usage: ./finder.sh <filesdir> <searchstr>"
}

if [[ "$#" -ne 2 ]]; then
	help && exit 1
fi

filesdir=$1
searchstr=$2

if [[ ! (-d "$filesdir") ]]; then
	echo "$searchstr doesn't exist"
	exit 1
fi

number_of_files=$(find "$filesdir" -type f | wc -l)
number_of_matches=$(find "$filesdir" -type f -exec grep -Ec "$searchstr" {} \; | paste -sd + | bc -l)

echo "The number of files are $number_of_files and the number of matching lines are $number_of_matches"
exit 0

