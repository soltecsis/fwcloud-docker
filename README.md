# fwcloud-docker

## Getting Started
This project contains a `docker-compose.yml` file which run a `fwcloud` instance automatically for you. This is **an example** and you can change it in order to fit your needs.

### Requirements
You will need `docker` and `docker-compose`.

### Run it
Run the instance with:

```
docker-compose up // Run all the services
docker-compose stop // Stop the containers
```

## Volumes
By default, all volumes created will be located in `./fwcloud-docker`. The following list describes all volumes created by `docker-compose`:

* **./fwcloud-docker/mysql**: `mariadb` data volume.
* **./fwcloud-docker/DATA**: `fwcloud`'s `DATA` directory
* **./fwcloud-docker/sessions**: `fwcloud`'s open sessions. You can remove it in case you want to close sessions.
* **./fwcloud-docker/BACKUP**: `fwcloud`'s backups directory.
* **./fwcloud-docker/logs**: `fwcloud`'s logs directory.
* **./fwcloud-docker/config**: `fwcloud`'s `.env` file. Any change in `.env` file requires restart the `fwcloud-api` service.

If you want to change the directory where volumes are created, modify `docker-compose.yml` volumes sections.
