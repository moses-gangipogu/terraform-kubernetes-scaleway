resource "scaleway_server" "kubectl-minion" {
  count = 2
  name  = "kubectl-minion"
  image = "89457135-d446-41ba-a8df-d53e5bb54710"
  type  = "VC1S"
  security_group = "${scaleway_security_group.sg-kubectl.id}"
  tags  = ["kubectl", "kubectl-minion", "ansible", "ansible-client"]
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
