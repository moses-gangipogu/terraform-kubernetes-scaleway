resource "scaleway_server" "kubectl-master" {
  count = 1
  name  = "kubectl-master"
  image = "89457135-d446-41ba-a8df-d53e5bb54710"
  type  = "VC1S"
  security_group = "${scaleway_security_group.sg-kubectl.id}"
  tags  = ["kubectl", "kubectl-master", "bastion", "ansible", "ansible-server"]
  volume {
    size_in_gb = 50
    type       = "l_ssd"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
  }
}
