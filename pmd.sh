#!/bin/bash

while getopts t:p:o:r: flag
do
    case "${flag}" in
        t) type=${OPTARG};;
        p) path=${OPTARG};;
        o) output=${OPTARG};;
        r) reportfile=${OPTARG};;
    esac
done

RED='\033[0;31m'
NC='\033[0m' # No Color

echo $type
echo $path

if [ "$type" = "apexclasses" ]; then
    ruleset="category/apex/design.xml";
elif [ "$type" = "apexpages" ]; then
    ruleset="category/vf/security.xml/VfUnescapeEl";
else
    ruleset=""
fi

if [ "$path" = "classes" ]; then
    path="./force-app/main/default/classes";
elif [ "$path" = "pages" ]; then
    path="./force-app/main/default/pages";
fi

if [ -z "$reportfile" ] && [ -z "$output" ]; then
    reportfile="./pmdoutput.html"
elif [ -z "$reportfile" ]; then
    reportfile="./pmdoutput.${output}"   
fi

if [ "$type" != "apexclasses" ] && [ "$type" != "apexpages" ]; then
    printf "${RED}ERROR!${NC} valid types are apexclasses or apexpages"
    exit 0
elif [ -z "$type" ]; then
    printf "${RED}Missing!${NC} type -t"
    exit 0
elif [ -z "$path" ]; then
    printf "${RED}Missing!${NC} path -p"
    exit 0
elif [ -z "$reportfile" ]; then
    printf "${RED}Missing!${NC} output directory -r"
    exit 0
else
    if [ "$OSTYPE" == msys ]; then
        pmd.bat -d "$path" -f "$output" -R "$ruleset" --report-file "$reportfile" --no-cache
    elif [ "$OSTYPE" == darwin ]; then
        pmd -d "$path" -f "$output" -R "$ruleset" --report-file "$reportfile" --no-cache
    fi
fi
