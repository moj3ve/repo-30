#!/bin/sh

rm -rf ./Packages

rm -rf ./Packages.bz2

echo Building package list...
dpkg-scanpackages -m ./debs > ./Packages

bzip2 -5fkv ./Packages > ./Packages.bz2

echo ""
echo -e "Push repo? (y/n)"
read -p ">>> " SHOULD

if [[ $SHOULD == "y" ]]; then
    git add .
    git commit -m "Update repo"
    git pull
    git push
    echo "Done!"
fi