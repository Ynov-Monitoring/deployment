IMAGE_NAME = "bento/ubuntu-18.04"

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.define "devops-ansible" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.31"
        master.vm.hostname = "devops-ansible" 
        master.vm.provider "virtualbox" do |v|
            v.name = "devops-ansible" 
            v.memory = 1024
            v.cpus = 2
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
end