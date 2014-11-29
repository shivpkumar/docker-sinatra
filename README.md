# Sinatra + Docker + Boot2Docker

Example of running a web server from a Docker image for someone
that already has a basic understanding of Docker.

```
git clone git@github.com:corytheboyd/docker-sinatra.git
cd docker-sinatra
bundle install
```

## Nothing special here

On it's own, this is nothing more than a web server that
replies with "Hello, world!" when prompted.

```
$ rackup -p 3000
[2014-11-29 04:10:45] INFO  WEBrick 1.3.1
[2014-11-29 04:10:45] INFO  ruby 2.1.2 (2014-05-08) [x86_64-darwin13.0]
[2014-11-29 04:10:45] INFO  WEBrick::HTTPServer#start: pid=3326 port=3000
```

```
$ curl localhost:3000
Hello, world!
```

## Building the image

Building a Docker image is nothing more than configuring...
well, a VM image. Configuring the image would be an incredibly
tedious and error-prone process if done by hand for each build,
which is why such actions are defined in a `Dockerfile`.

As an example, the `Dockerfile` in this repository does the following:

1. Specifies a base image to build off of. In this case,
`ruby:2.1.5`.
1. Copies the application source to the specified app directory.
1. Installs the applications dependencies.
1. Specifies the port which the container listens on during
runtime.

Building the image:
```
$ docker build -t docker-sinatra .
```

## Running the image

```
$ docker run -d -p 3000:3000 docker-sinatra
```

The only extra step needed here is forwarding a port on the host
to the Docker container, which is done with the `p` flag.

Test that the container is running properly:

```
$ boot2docker ip

The VM's Host only interface IP address is: 192.168.59.103

$ curl http://192.168.59.103:3000
Hello, world!
```

:zap: :metal: :zap:
