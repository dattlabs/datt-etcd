FROM datt/datt-base:latest
MAINTAINER John Albietz "inthecloud247@gmail.com"

# standard directory setup
RUN \
  `# Install etcd 0.3`; \
  mkdir -vp /opt/etcd/; cd /opt/etcd/; \
  DL_LOCATION="https://github.com/coreos/etcd/releases/download/v0.3.0/"; \
  DL_FILE="etcd-v0.3.0-linux-amd64.tar.gz"; \
  wget --continue --no-check-certificate $DL_LOCATION$DL_FILE ; \
  tar --strip-components=1 -xvf $DL_FILE -C /opt/etcd/; \
  rm -v *.gz;

RUN \
  `# Install symlinks so it's in the path`; \
  ln -s /opt/etcd/etcd /usr/sbin/etcd; \
  ln -s /opt/etcd/etcdctl /usr/sbin/etcdctl;

# Add app to supervisor
RUN mkdir /var/log/supervisor/etcd
ADD files/etcd.conf /etc/supervisor/conf.d/
