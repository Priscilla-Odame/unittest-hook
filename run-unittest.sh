#!/bin/env sh

echo 'Running tests'

git stashi > /dev/null
python -m unittest discover -s test/ -p 'test*'
if [ $? -ne 0 ]; then
	echo 'A unit test failed. Aborting commit'
	echo 'Bypass with git commit --no-verify'
	git stash pop > /dev/null
	exit 1
fi 
git stash pop > /dev/null

exit 0
