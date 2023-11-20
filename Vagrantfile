Vagrant.configure("2") do |config|
  config.vm.base_mac = nil
  config.vm.synced_folder ".", "/vagrant", disable: true
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = 1
    vb.linked_clone = false
  end


  N = 3
  N.downto(1) do |machine_id|
    config.vm.define "s4103-server#{machine_id}" do |n|
      n.vm.hostname = "server#{machine_id}"
      n.vm.network "public_network", ip: "192.168.57.#{40+machine_id}"
      n.vm.network "forwarded_port", guest: 22, host: "#{2000+machine_id}", id: "ssh" # ssh for ansible
      n.vm.network "forwarded_port", guest: 8201, host: "#{8200+machine_id}", id: "http1" # vault debug port for host
      n.vm.network "forwarded_port", guest: 9392, host: "#{9440+machine_id}", id: "http2" # openvas debug port for host
      n.vm.network "forwarded_port", guest: 8080, host: "#{8080+machine_id}", id: "https" # defectdogo debug port for host
      n.vm.box = "debian/bullseye64"
      n.vm.provision :shell, path: "add_ans_user.sh"
      config.disksize.size = '30GB' # vagrant plugin install vagrant-disksize on thr host, and sudo resize2fs -p -F /dev/sda1 on the machine_1
    end
  end
end