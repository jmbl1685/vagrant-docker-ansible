icacls ./.vagrant/machines/default/docker/private_key /reset
icacls ./.vagrant/machines/default/docker/private_key /GRANT:R "%username%:(r)"
icacls ./.vagrant/machines/default/docker/private_key /inheritance:r
ssh -i ./.vagrant/machines/default/docker/private_key -p 2222 vagrant@localhost

