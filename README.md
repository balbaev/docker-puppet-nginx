# Puppet with nginx in docker
# Install
The instructions assume that you have already installed [Docker](https://docs.docker.com/installation/) and [Docker Compose](https://docs.docker.com/compose/install/).
Requires Docker Engine version __18.06.0__ and higher.

In order to get started be sure to clone this project onto your host.

	git clone https://github.com/zorgan/docker-puppet-nginx.git

# Up and running
Once you've cloned the project to your host we can now start our demo project. Navigate to the directory in which you cloned the project. Run the following command from this directory 

	docker-compose up -d

After the command completes we can now view the status of our stack

	docker ps

# Puppet-agent simulation:
In order to simulate puppet-agent we would run docker container with Ubuntu 18.04 image and exposed TCP 80 port. Run the following command from the project directory

	docker run --name apply-test --net puppetnetwork --volume "${PWD}"/scripts:/mnt -p 80:80 -it ubuntu:18.04 /bin/bash

Once bash prompt appears we would install puppet-agent and fetch configuration from the puppet server applying the following:

	/mnt/apply-test.sh

After the command completes we can now curl the host and get *Hello __world__!*

	curl http://<host>/
