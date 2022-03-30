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

* **./fwcloud-docker/db**: `mariadb` data volume.
* **./fwcloud-docker/api/DATA**: `fwcloud-api`'s `DATA` directory
* **./fwcloud-docker/api/sessions**: `fwcloud-api`'s open sessions. You can remove it in case you want to close sessions.
* **./fwcloud-docker/api/BACKUP**: `fwcloud-api`'s backups directory.
* **./fwcloud-docker/api/logs**: `fwcloud-api`'s logs directory.
* **./fwcloud-docker/api/config**: `fwcloud-api`'s `.env` file. Any change in `.env` file requires restart the `fwcloud-api` service.
* **./fwcloud-docker/websrv/logs**: `fwcloud-websrv`'s logs directory.
* **./fwcloud-docker/websrv/config**: `fwcloud-websrv`'s config directory.

If you want to change the directory where volumes are created, modify `docker-compose.yml` volumes sections.

## Running multiple FWCloud instances
If you want to run multiple dockerized FWCloud instances on the same server you can use the `docker-compose-multi.yml` file.

You can use it this way:
```bash
export B2=10 B3=100 ROOT_DIR="/opt/fwcloud-saas" && docker-compose -f docker-compose-multi.yml -p ${B2}{$B3} up
```

The environment variables `B2` and `B3` are the second and third bytes of the IPv4 used in the FWCloud docker instance.

In this example, our network would be: `172.10.100.0/24`

The project's name is the combination of `B2` and `B3` and will be used by means of the `-p` option for the `docker-compose` command.

It will be used too for the bridge name. The docker bridge of our example will have the name: `fwc_10100`

 `B2` and `B3` are used too in combination with the `ROOT_DIR` environment variable for define the root directory of the docker application. In our the example, the root directory will be:
`/opt/fwcloud-saas/10100`

The application exposed TCP port is the combination of `B2` and `B3` environment variables. For our example, the exposed TCP port will be: 10100.

This is useful for FWCloud running in several virtual machines. For example, in the first virtual machine we can use 10 for the `B2` variable and then from 100 to 199 for dockerized FWCloud instances. This way we can have 100 instances for each virtual machine.
