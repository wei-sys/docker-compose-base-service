<img src="images/docker.bg.webp" alt="Docker Header" width="100%">

## Where to get Docker Compose and setup

### Windows and macOS

Docker Compose is included in [Docker Desktop](https://www.docker.com/products/docker-desktop/) for Windows and macOS.

### Installing Linux and running it using WSL 2 in Windows.
- Win > Turn Windows features on or off > ☑ windows Subsystem for Linux
- Win > microsoft store > search "Ubuntu" > Install the appropriate version of Ubuntu
- Set WSL to version 2, Refer to [Docker Desktop WSL 2 backend on Windows](https://docs.docker.com/desktop/wsl/)
- After restart computer, launcher ubuntu and setup username & password
- launcher Docker Desktop > Setting > Resources > WSL integration > enable Ubuntu
- Done

## Service list
- proxy (Nginx)
- database (mySQL)
- pma (phpmyadmin)
- redis

## Docker compose command
The following demonstrates only basic usage, More details command please refer [ Docker compser document ](https://docs.docker.com/compose/)
```
# Start up service by default file docker-compose.yml
docker-compose up -d

# Start up service by naming docker-compose
docker-compose -f docker-compose.local.yml

# Start up service by container name
docker-compose up -d proxy database pma redis

# Stop service
docker-compose stop

# remove service, This operation requires attention because if the data exists only inside the container, it will be deleted. 
# However, this can also be cleverly used to reset container settings.
docker-compose down

```

### Custom config
```
mkdir .env
echo "DB_ROOT_PASSWORD='db_password'" >> .env
echo "REDIS_PASSWORD='redis_password'" >> .env
```