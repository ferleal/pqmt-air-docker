FROM nucleardreamer/air-docker

RUN apt-get update && apt-get install -y -q xvfb

WORKDIR /pqmt
COPY . /pqmt
RUN tar jxf mt_driver_kit_linux.tar.bz2 && \
  chmod +x pqmt_install.sh && \
  /bin/bash pqmt_install.sh && \
  cp run.sh /usr/local/bin/run && \
  chmod +x /usr/local/bin/run

ENTRYPOINT ["/usr/local/bin/run"]

ENV DISPLAY=:0