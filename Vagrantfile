Vagrant.configure("2") do |config|

    config.vm.provider "docker" do |d|
      d.build_dir = "."
      d.remains_running = true
      d.has_ssh = true
      d.create_args = ['--cpuset-cpus=2']
      d.create_args = ['--memory=2g', '--privileged']
    end

    config.winrm.timeout =   1500 
    config.vm.boot_timeout = 1500 

    config.vm.network(:forwarded_port, {:guest=>80, :host=>40080})
    config.vm.network(:forwarded_port, {:guest=>443, :host=>40443})

  end