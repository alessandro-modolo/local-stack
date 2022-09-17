# Local Stack

Local stack created with docker compose that helps to get up and running in no time

> DB changelog has been generated starting from the version `10.0.0` of the foundation

## How to run it
Docker compose is required. If you haven't installed it yet, please refer to the 
[install](https://docs.docker.com/compose/install) documentation.

Open a shell within the root of this project and run
```
docker-compose up -d
```

Wait a few seconds, maybe have a sip of 🍺...ok now you have your redis server and a postgres DB fully initialized
with the table required by the foundation

## Useful info
### Redis
| host      | port | connection url         |
|-----------|------|------------------------|
| localhost | 6379 | redis://localhost:6379 |


### Postgres
| jdbc url                            | user     | password |
|-------------------------------------|----------|----------|
| jdbc:postgresql://localhost:5432/db | postgres | password |

### Credentials
| username | password | company |
|----------|----------|---------|
| admin    | password | admin   |
| admin    | password | company |

## How to stop, restart and destroy
If you don't want to destroy everything and start from scratch every time, you can simply stop the services using
```
docker-compose stop
```

To restart all the services later on, you can run
```
docker-compose restart
```

If you have enough and wants to remove all that stuffs, all you have to do is run
```
docker-compose down
```

## How to fetch database changes
If you have a new database, and you have never fetched its DDL before,
you should generate a new changelog, by running the command

```
sh ./generate-changelog.sh
```
This will produce a file, named `db.changelog-<todayDate>.yaml` inside 
the changelog folder. This file will contain all the tables, constraints, indexes, etc.,
defined in the database that you will define during the script's execution.

If you have generates a changelog yet, you can use fetch the changes with a database by running the command
```
sh ./diff-changelog.sh
```
This will produce a file, named `db.changelog-<todayDate>.yaml`, inside the changelog folder,
containing only the missing changes.

> both commands require [Liquibase CLI](https://www.liquibase.org/download) 
