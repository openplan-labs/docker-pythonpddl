# Docker PythonPDDL

A Dockerized version of PythonPDDL

## Requirements

- Install docker
- Install docker-compose
- Clone the project: `git clone https://github.com/openplan-labs/docker-pythonpddl`

## Usage

### Prepare the docker

- Copy .env.example into .env
- Enter the domain path, problem path and log level (WARNING, FATAL, DEBUG, INFO...)

### Terminal 1

- Go to the repo directory: `cd docker-pythonpddl`
- Build and run the docker: `docker-compose -f docker/docker-compose.yml up`
- Wait for termination of the process... (Line: "Attaching to docker python-pddl_1")
### Terminal 2

- Attach yourself to the bash env of the dev docker: `docker exec -it $(docker ps -qf "name=docker_python-pddl") /bin/bash`
- Use [the PythonPDDL Readme](https://github.com/openplan-labs/readme.md) guidelines
