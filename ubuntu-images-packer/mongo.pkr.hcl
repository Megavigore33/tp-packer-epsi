source "docker" "ubuntu" {
  image  = "ubuntu:20.04"
  commit = true
  changes = [
    "CMD [\"/start.sh\"]"
  ]
}

build {
  name = "ubuntu-mongo"
  sources = ["source.docker.ubuntu"]

  provisioner "shell" {
    script = "scripts/common.sh"
  }

  provisioner "shell" {
    script = "scripts/install-mongo.sh"
  }
}