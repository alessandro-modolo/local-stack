#!/bin/bash
echo "  _                 _     _             _     ";
echo " | |               | |   | |           | |    ";
echo " | | ___   ___ __ _| |___| |_ __ _  ___| | __ ";
echo " | |/ _ \ / __/ _\` | / __| __/ _\` |/ __| |/ / ";
echo " | | (_) | (_| (_| | \__ \ || (_| | (__|   <  ";
echo " |_|\___/ \___\__,_|_|___/\__\__,_|\___|_|\_\ ";
echo "                                              ";
echo "                                              ";

cd changelog || exit

read -rp "Enter JDBC connection url: " url
read -rp "Enter username: " username
read -rsp "Enter password: " password
echo

diff_types=tables,functions,views,columns,indexes,foreignkeys,primarykeys,uniqueconstraints,sequences,data;
root_file=db.changelog-root.yaml
version=$(date +%Y%m%d)
changelog_file=db.changelog-$version.yaml

liquibase \
--diff-types=$diff_types \
generate-changelog \
--changelog-file="$changelog_file" \
--url="$url" \
--username="$username" \
--password="$password"

status=$?;
if [ $status -eq 0 ]; then
    echo "  - include:" >> $root_file
    echo "      file: $changelog_file" >> $root_file
fi
