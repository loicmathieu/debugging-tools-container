# debugging-tools-container

Docker image for running a container to debug applications. 

Can be used with the `kubectl debug` command to attach as an ephemeral containers to a running pod.

It currently installs the following tools on top of `ubuntu:22.04` :

- `curl`
- `wget`
- `dstat`
- 'systat' package for more system statistic tools like `iostat`
- 'net-tools' package for networking tools like `netstat` and `ifconfig`
- 'linux-tools-common' and 'linux-tools-generic' packages for `perf`
- `nc`
- `ping`
- `telnet` client
- `htop`
- `nano`

## How to use it with kubectl debug

The following `kubectl` command will launch a debugging-tools container as an ephemeral container using `kubectl debug` on the `my-container` container of the `my-pod` pod.

```shell
kubectl -it my-pod --image loicmathieu/debugging-tools --target my-container
```

**Note**: Ephemeral Containers was introduced in k8s v1.16 as an alpha feature, moved in beta as of 1.23 and is stable since 1.25.

## Build and push

```shell
docker build . -t loicmathieu/debugging-tools
docker push loicmathieu/debugging-tools
```