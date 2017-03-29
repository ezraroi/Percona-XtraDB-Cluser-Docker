FROM ubuntu:16.04
MAINTAINER Ezra Roi  <ezraroi@gmail.com>
ENV http_proxy http://proxy.iil.intel.com:911
ENV https_proxy https://proxy.iil.intel.com:912

ENV DEBIAN_FRONTEND noninteractive
RUN echo 'Acquire::http::Proxy "http://proxy.iil.intel.com:911";' >> /etc/apt/apt.conf
RUN echo 'Acquire::https::Proxy "http://proxy-chain.intel.com:912";' >> /etc/apt/apt.conf

RUN echo "deb http://repo.percona.com/apt xenial main" >> /etc/apt/sources.list.d/percona.list
RUN echo "deb-src http://repo.percona.com/apt xenial main" >> /etc/apt/sources.list.d/percona.list
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
RUN apt-get update
RUN apt-get install -y --allow-unauthenticated percona-xtradb-cluster-57

RUN apt-get install -y --allow-unauthenticated python-software-properties vim wget curl netcat
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306 4567 4568 4444

