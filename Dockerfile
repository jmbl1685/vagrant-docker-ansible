FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
  locales \
  curl \
  lsb-release \
  openssh-server \
  sudo \
  python \
  git \
  ansible

RUN locale-gen en_US.UTF-8

RUN if ! getent passwd vagrant; then useradd -d /home/vagrant -m -s /bin/bash vagrant; fi \
  && echo vagrant:vagrant | chpasswd \
  && echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && mkdir -p /etc/sudoers.d \
  && echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/vagrant \
  && chmod 0440 /etc/sudoers.d/vagrant

ARG SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"

RUN mkdir -p /home/vagrant/.ssh \
  && chmod 0700 /home/vagrant/.ssh \
  && echo $SSH_KEY > /home/vagrant/.ssh/authorized_keys \
  && chmod 0600 /home/vagrant/.ssh/authorized_keys \
  && chown -R vagrant /home/vagrant/.ssh

RUN 

RUN rm /etc/apt/apt.conf.d/docker-clean

RUN mkdir -p /run/sshd

CMD /usr/sbin/sshd -D \
  -o UseDNS=no\
  -o UsePAM=no\
  -o PasswordAuthentication=no\
  -o PidFile=/tmp/sshd.pid

COPY "ansible/playbook.yml" "ansible-config/playbook.yml"

RUN cd .. && cd .. && cd ./ansible-config && ansible-playbook playbook.yml

EXPOSE 1-9999