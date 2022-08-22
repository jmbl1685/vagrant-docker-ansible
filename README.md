## Virtual Machine for Develop or test you ouw settings

### Tools/Settings used: 
  - Vagrant: Intermediary for build and maintain portable virtual machines.
  - Docker: Run the all settings, changes, interaction, etc via containers.
  - Ansible: Automate the processes/actions to prepare infrastructure, manage configuration, implement applications and organize systems.


### Getting Started

  1. Install Vagrant (https://www.vagrantup.com/downloads)
  2. Install Docker-Desktop (https://www.docker.com/products/docker-desktop)

### Run/Execute

```
$ vagrant up
$ vagrant ssh
```

### Helper commands

```
vagrant provision
vagrant reload --provision
vagrant reload --no-provision
vagrant ssh-config
```

### Result sample

```
$> vagrant up
Bringing machine 'default' up with 'docker' provider...
==> default: Creating and configuring docker networks...
==> default: Building the container from a Dockerfile...
    default: #1 [internal] load build definition from Dockerfile
    default: #1 sha256:0102c7d70aaad39af84d15a0e254a99066645474bb08533f2ec1dc3861b8152b
    default: #1 transferring dockerfile: 1.58kB done
    default: #1 DONE 0.1s
    default: 
    default: #2 [internal] load .dockerignore
    default: #2 sha256:5f65d64b4b2f24b655a8ac1733128933ef94dc1af9954a8ddd6026ca010c6a79
    default: #2 transferring context: 2B done
    default: #2 DONE 0.2s
    default: 
    default: #3 [internal] load metadata for docker.io/library/ubuntu:18.04
    default: #3 sha256:ae46bbb1b755529d0da663ca0256a22acd7c9fe21844946c149800baa67c4e4b
    default: #3 DONE 1.0s
    default:
    default: #4 [ 1/10] FROM docker.io/library/ubuntu:18.04@sha256:eb1392bbdde63147bc2b4ff1a4053dcfe6d15e4dfd3cce29e9b9f52a4f88bc74
    default: #4 sha256:ee998b50b8dbab87ea552b8fa0f1cae0dd2efeff67593b77f556d648b0df415d
    default: #4 DONE 0.0s
    default:
    default: #6 [ 3/10] RUN locale-gen en_US.UTF-8
    default: #6 sha256:4835f91510e8ac5681097c37216a1e7a95b58c40055705ef6ad7c21451c09a6a
    default: #6 CACHED
    default:
    default: #5 [ 2/10] RUN apt-get update && apt-get install -y   locales   curl   lsb-release   openssh-server   sudo   python   git   ansible
    default: #5 sha256:110bbe27bd5a0dbdc7ad007b5f57ad473e0611409b05e1208410af98b698f105
    default: #5 CACHED
    default:
    default: #7 [ 4/10] RUN if ! getent passwd vagrant; then useradd -d /home/vagrant -m -s /bin/bash vagrant; fi   && echo vagrant:vagrant | chpasswd   && echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers   && mkdir -p /etc/sudoers.d   && echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/vagrant   && chmod 0440 /etc/sudoers.d/vagrant
    default: #7 sha256:87d396ef9e6b05541f1dfcffdd7e6ef5ab3693656498cd1867f521d6c6426531
    default: #7 CACHED
    default:
    default: #12 [internal] load build context
    default: #12 sha256:19bf5e1451068345c0df4faabae6a7b520e62b105adf037b0dbaf1bbe3030e67
    default: #12 transferring context: 2.13kB done
    default: #12 DONE 0.1s
    default:
    default: #8 [ 5/10] RUN mkdir -p /home/vagrant/.ssh   && chmod 0700 /home/vagrant/.ssh   && echo ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key > /home/vagrant/.ssh/authorized_keys   && chmod 0600 /home/vagrant/.ssh/authorized_keys   && chown -R vagrant /home/vagrant/.ssh
    default: #8 sha256:669fb5d11ce6fa553038499e2687e50b67db54a38fb82a89d4c473bd86621e57
    default: #14 0.772  [WARNING]: provided hosts list is empty, only localhost is available. Note
    default: #14 0.772 that the implicit localhost does not match 'all'
    default: #14 0.923
    default: #14 0.923 PLAY [Ansible tasks] ***********************************************************
    default: #14 0.931
    default: #14 0.931 TASK [Gathering Facts] *********************************************************
    default: #14 1.547 ok: [localhost]
    default: #14 1.557
    default: #14 1.557 TASK [Run apt-get updates/upgrades] ********************************************
    default: #14 7.120  [WARNING]: Consider using 'become', 'become_method', and 'become_user' rather
    default: #14 7.120 than running sudo
    default: #14 7.120 changed: [localhost]
    default: #14 7.133
    default: #14 7.133 TASK [Install node.js] *********************************************************
    ...
    default: #14 134.5 PLAY RECAP *********************************************************************
    default: #14 134.5 localhost                  : ok=7    changed=6    unreachable=0    failed=0
    default: #14 134.5
    default: #14 DONE 135.8s
    ...
    ==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: 
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default: 
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
```

```
$> vagrant ssh
vagrant@d6839a85a8f0:~$ cd ..
vagrant@d6839a85a8f0:/home$ cd ..
vagrant@d6839a85a8f0:/$ ls
ansible-config  bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  vagrant  var
vagrant@d6839a85a8f0:/$ node --version
v8.10.0
vagrant@d6839a85a8f0:/$ nginx -v       
nginx version: nginx/1.14.0 (Ubuntu)
```