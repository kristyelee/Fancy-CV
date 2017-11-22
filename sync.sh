#!/bin/bash
while getopts ":b:" opt; do
  case $opt in
    b)
    build = true
    echo "found -b switch, build: $build"
    ;;
    # \?) echo "Invalid option: -$OPTARG" >&2;;
  esac
done
branch=`git rev-parse --abbrev-ref HEAD`
branches=`ls .git/refs/heads`;
for BRANCH in $branches;
    do git checkout $BRANCH;
    git merge master $BRANCH;
done;
if [ "$build" = true ] ; then
    echo "build is true: $build"
    for BRANCH in $branches;
        do git checkout $BRANCH;
        bash run.sh;
    done;
fi
git checkout $branch;
