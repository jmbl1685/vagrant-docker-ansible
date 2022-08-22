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

    # for i in 3000..3380
    #   config.vm.network :forwarded_port, guest: i, host: i, host_ip: "127.0.0.1", auto_correct: true
    # end

    # Angular
    config.vm.network :forwarded_port, guest: "4200", host: "4200", host_ip: "127.0.0.1", auto_correct: true
    # PostgreSQL
    config.vm.network :forwarded_port, guest: "5432", host: "5432", host_ip: "127.0.0.1", auto_correct: true
    # Redis
    config.vm.network :forwarded_port, guest: "6379 ", host: "6379 ", host_ip: "127.0.0.1", auto_correct: true
    
    # Add your port here
    config.vm.network :forwarded_port, guest: "3000", host: "3000", host_ip: "127.0.0.1", auto_correct: true
    config.vm.network :forwarded_port, guest: "3001", host: "3001", host_ip: "127.0.0.1", auto_correct: true
    config.vm.network :forwarded_port, guest: "7282", host: "7282", host_ip: "127.0.0.1", auto_correct: true

  end
