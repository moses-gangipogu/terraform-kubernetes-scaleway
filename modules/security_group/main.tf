resource "scaleway_security_group" "sg-kubectl" {
  name        = "sg-kubectl"
  description = "sg-kubectl kubernetes security group"
}
