IMAGE_NAME = "bento/ubuntu-20.04"
Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.define "devops-ansible" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.31"
        master.vm.hostname = "devops-ansible" 
        master.vm.provider "virtualbox" do |v|
            v.name = "devops-ansible" 
            v.memory = 1024
            v.cpus = 1
        end
    end

    config.vm.define "devops-influxdb" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.32"
        master.vm.hostname = "devops-influxdb"
        master.vm.provider "virtualbox" do |v|
            v.name = "devops-influxdb"
            v.memory = 1024
            v.cpus = 2
        end
    end

    config.vm.define "devops-grafana" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.33"
        master.vm.hostname = "devops-grafana"
        master.vm.provider "virtualbox" do |v|
            v.name = "devops-grafana"
            v.memory = 1024
            v.cpus = 2
        end
    end

    ## VM army 
    config.vm.define "centos-soldier" do |master|
        master.vm.box = "bento/centos-7"
        master.vm.network "private_network", ip: "192.168.50.34"
        master.vm.hostname = "centos-soldier"
        master.vm.provider "virtualbox" do |v|
            v.name = "centos-soldier"
            v.memory = 512
            v.cpus = 1
        end
    end

    config.vm.define "debian-soldier" do |master|
        master.vm.box = "bento/debian-10"
        master.vm.network "private_network", ip: "192.168.50.35"
        master.vm.hostname = "debian-soldier"
        master.vm.provider "virtualbox" do |v|
            v.name = "debian-soldier"
            v.memory = 512
            v.cpus = 1
        end
    end

    config.vm.define "ubuntu-soldier" do |master|
        master.vm.box = "bento/ubuntu-18.04"
        master.vm.network "private_network", ip: "192.168.50.36"
        master.vm.hostname = "ubuntu-soldier"
        master.vm.provider "virtualbox" do |v|
            v.name = "ubuntu-soldier"
            v.memory = 512
            v.cpus = 1
        end
    end

end
