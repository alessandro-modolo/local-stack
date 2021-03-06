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

## Usefull info
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
Of you don't want to destroy everything and start from scratch every time, you can simply stop the services using
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
