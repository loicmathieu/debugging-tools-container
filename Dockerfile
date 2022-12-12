FROM ubuntu:22.04

# Install useful linux tools:
# - 'curl'
# - 'wget'
# - 'dstat' for global system statistics (better than vmstat that is already included)
# - 'systat' for more system statistic tools like 'iostat'
# - 'net-tools' for networking tools like 'netstat' and 'ifconfig'
# - 'linux-tools-common' and 'linux-tools-generic' for 'perf'
# - 'netcat' for 'nc'
# - 'iputils-ping' for 'ping'
# - 'telnet' for the 'telnet' client
# - 'vim'
# - 'htop'
# - 'nano'
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y --no-install-recommends install curl wget dstat sysstat net-tools ifstat linux-tools-common linux-tools-generic netcat iputils-ping telnet htop nano && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash
