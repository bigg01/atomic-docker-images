FROM centos:centos7
MAINTAINER No Reply o.guggenbuehl@gmail.com

RUN yum -y install epel-release && \
    yum -y install salt-minion docker python-docker-py ipolicycoreutils  policycoreutils-python  &&  yum clean all

ENV TZ "Europe/Zurich"
ENV RUN_CMD "/bin/salt-minion"
ENV OPTION "-l debug"

#RUN  echo "10.0.0.4 salt" > etc/hosts

# Expose the default port
EXPOSE 4505
EXPOSE 4506

#ENTRYPOINT bin/salt-minion -l info
ENTRYPOINT ["/bin/bash", "-c", "set -e && $RUN_CMD $OPTION"]
#CMD ["/bin/bash", "-c", "set -e && $RUN_CMD $OPTION"]

#VOLUME /etc/salt/minion
#VOLUME /srv/salt
#VOLUME /var/log/salt
#VOLUME /var/log/salt
