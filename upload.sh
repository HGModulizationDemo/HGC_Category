#!/bin/bash

Cyan='\033[0;36m'
Default='\033[0;m'

versionNum=""
privatePodsName=""
confirmed="n"

getVersionNum(){
    read -p "Enter VersionNum:" versionNum

    if test -z "$versionNum";then
        getVersionNum
    fi
}

getPrivatePodsName(){
    read -p "Enter privatePodsName:" privatePodsName

    if test -z "$privatePodsName";then
        getPrivatePodsName
    fi
}

getInfomation(){
    getVersionNum
    getPrivatePodsName


    echo -e "============================================"
    echo -e "versionNum       : ${Cyan}${versionNum}${Default}"
    echo -e "privatePodsName  : ${Cyan}${privatePodsName}${Default}"
    echo -e "============================================"
}

echo -e "\n"
while [ "$confirmed" != "y" -a "$confirmed" != "Y" ]
do
    if [ "$confirmed" == "n" -o "$confirmed" == "N" ]; then
       getInfomation
    fi
    read -p "confirm? (y/n):" confirmed
done



git add .  &> /dev/null
git commit -m ${versionNum}  &> /dev/null
git tag ${versionNum}  &> /dev/null
git push origin master --tags  &> /dev/null
cd ~/.cocoapods/repos/${privatePodsName} && git pull origin master && cd - && pod repo push ${privatePodsName} HGC_Category.podspec --verbose --allow-warnings --use-libraries  &> /dev/null
