# pks-rtpengine

A docker image for RTP Engine and used in P-KISS-SBC project, but the container could be used in any project.

## Available Versions

You can see all images available to pull from Dockerhub registry via the [Tags](https://hub.docker.com/repository/docker/mwolff44w/pks-rtpengine) page. Docker tag names that begin with a "change type" word such as task, bug, or feature are available for testing and may be removed at any time.

> The version is the same of the RTP Engine and Debian this is image is based on

## Installation

You can clone this repository and manually build it.

```bash
cd mwolff44/pks-rtpengine\:%%VERSION%%
docker build -t mwolff44/pks-rtpengine:%%VERSION%% .
```

Otherwise you can pull this image from gitlab index.

```bash
docker push mwolff44w/pks-rtpengine:%%VERSION%%
```


## Usage Example

The following is a basic example of using this image.

```bash
docker run -it --net=host \
  -p 8080:8080 \
  -e BIND_HTTP_PORT=8080 \
  -e LOG_LEVEL=8 \
  mwolff44/pks-rtpengine
```

## Environment Variables

Environment variables are used in the entry point script to render configuration templates. You can specify the values of these variables during `docker run`, `docker-compose up`, or in Kubernetes manifests in the `env` array.

- `PUBLIC_IP` - Host's external IP. If undefined, the container will attempt to guess the host's public IP
- `BIND_HTTP_PORT` - The port the container is listening on for HTTP requests. Defaults to `8080`
- `BIND_NG_PORT` - The port the container is listening on for NG requests. Defaults to `22222`
- `LOG_LEVEL` - Level of verbosity of the logs. Defaults to `7`
- `PORT_MIN` - Lower value of port range. Defaults to `10000`
- `PORT_MAX` - Upper value of port range. Defalts to `10500`
- `CLOUD` - Name of cloud the provided. This will help the container determine its public IP. Acceptable values are: `gcp`, `aws`, `digitalocean`, `scaleway`, `azure`, and `*`. Defaults to `*`

## Exposed ports

- `8080` - Default HTTP port
- `22222` - Default NG port

> This container requires of "host" mode to do its job. The ports PORT_MIN to PORT_MAX must be open on the host.

## References (and Credit)

- [https://github.com/sipwise/rtpengine](https://github.com/sipwise/rtpengine)
- [https://github.com/fonoster/rtpengine](https://github.com/fonoster/rtpengine)
