#!/bin/bash
echo "  _                 _     _             _     ";
echo " | |               | |   | |           | |    ";
echo " | | ___   ___ __ _| |___| |_ __ _  ___| | __ ";
echo " | |/ _ \ / __/ _\` | / __| __/ _\` |/ __| |/ / ";
echo " | | (_) | (_| (_| | \__ \ || (_| | (__|   <  ";
echo " |_|\___/ \___\__,_|_|___/\__\__,_|\___|_|\_\ ";
echo "                                              ";
echo "                                              ";

db="db"
url="jdbc:postgresql://localhost:65432/$db"
username="postgres"
password="password"
version=$(date +%Y%m%d)
root_file=db.changelog-root.yaml
changelog_file=db.changelog-$version.yaml

cd changelog || exit;

# start a local postgres. this contains the latest snapshot taken and acts as a reference DB
docker run -d \
--name "localstack-postgres" \
-p 65432:5432 \
-e POSTGRES_PASSWORD=$password \
-e POSTGRES_DB=$db \
postgres &> /dev/null

# let the postgres db to start
sleep 5

# get the target DB information
read -rp "Enter JDBC connection url: " referenceUrl
read -rp "Enter username: " referenceUsername
read -rsp "Enter referencePassword: " referencePassword
echo
echo
echo "setup latest db snapshot..."
liquibase \
--changelog-file=$root_file \
--url=$url \
--username=$username \
--password=$password \
update &> /dev/null

echo "create diff changelog..."
liquibase \
--changelog-file="$changelog_file" \
--url=$url \
--username=$username \
--password=$password \
--referenceUrl="$referenceUrl" \
--referenceUsername="$referenceUsername" \
--referencePassword="$referencePassword" \
diff-changelog

status=$?;
if [ $status -eq 0 ]; then
    echo "  - include:" >> $root_file
    echo "      file: $changelog_file" >> $root_file
fi

docker container stop localstack-postgres &> /dev/null
docker container rm localstack-postgres &> /dev/null
