FROM eclipse-temurin:17

# Install useful linux tools:
# - 'dstat' for global system statistics (better than vmstat that is already included)
# - 'systat' for more system statistic tools like 'iostat'
# - 'net-tools' for networking tools like 'netstat' and 'ifconfig'
# - 'linux-tools-common' and 'linux-tools-generic' for 'perf'
# - 'netcat' for 'nc'
# - 'iputils-ping' for 'ping'
# - 'telnet' for the 'telnet' client
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install dstat sysstat net-tools ifstat linux-tools-common linux-tools-generic netcat iputils-ping telnet && \
    apt-get -y purge && \
    apt-get -y clean

RUN mkdir /tools
WORKDIR /tools

# Install async-profiler
RUN wget -q -O /tools/async-profiler.tar.gz https://github.com/jvm-profiling-tools/async-profiler/releases/download/v2.9/async-profiler-2.9-linux-x64.tar.gz && \
    tar -xvf /tools/async-profiler.tar.gz && rm /tools/async-profiler.tar.gz

ENTRYPOINT bash
