# p4c-docker

To get the [P4 programming language](https://p4.org/) compiler, you can
- build p4 compiler from [source](https://github.com/p4lang/p4c)
- install pre-built packages on [ubuntu 20.04 or 21.04](https://github.com/p4lang/p4c#ubuntu), [debian 11](https://github.com/p4lang/p4c#debian)
- run pre-built docker images from Open Networking Foundation. They didn't name docker tag with version, so the version may be changed in the future.
  - `opennetworking/p4c:stable`: Version 1.1.0-rc1 (SHA: e2934ab32)
  - `opennetworking/p4c:stable-20210108`: Version 1.2.0 (SHA: 41b6968f8 BUILD: RELEASE)
  - `opennetworking/p4c:latest`: Version 1.2.2.1 (SHA: cc9e4c5d3 BUILD: RELEASE)
- install pre-built packages in docker. It's fast for installation and cross-platform.

To build p4 compiler from source with the [Dockerfile](https://github.com/opennetworkinglab/p4c-docker) from ONF, it takes me 24 minutes. They didn't provide an easy installation method for p4 developer, so I install the pre-build packages in docker to compile my p4 program.

Installing from the repo gives you newer compiler version than `opennetworking/p4c:latest` because the pre-built compiler on ubuntu 20.04 is newer.

## Installation

Install [docker](https://www.docker.com/get-started/) or [podman](https://podman.io/getting-started/installation) first.

```sh
docker build -t doraeric/p4c "https://github.com/doraeric/p4c-docker.git#main"
# or
podman build -t doraeric/p4c "https://github.com/doraeric/p4c-docker.git#main"
```

## Usage

You can save the alias in `~/.bashrc`, so it's added to bash automatically.

```sh
# for docker
alias p4c-bm2-ss='docker run --rm \
  -u $UID:$GID \
  -v "`pwd`:/cwd" \
  -w /cwd \
  doraeric/p4c \
  p4c-bm2-ss'

# for podman
alias p4c-bm2-ss='podman run --rm \
  -v "`pwd`:/cwd" \
  -w /cwd \
  doraeric/p4c \
  p4c-bm2-ss'

# compile p4
mkdir -p build
p4c-bm2-ss --arch v1model -o build/bmv2.json --p4runtime-files build/p4info.txt src/main.p4
```
