resource "null_resource" "main" {

  connection {
    type     = "ssh"
    host     = "172.31.35.13"
    user     = "ec2-user"
    password = "DevOps321"
    # Better practice:
    # private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "ansible-pull -i localhost, -U https://github.com/wavedevops/expense-ansible.git -e env=${var.env} expense.yml role_name=${var.component}"
    ]
  }
}

variable "env" {
  type    = string
  default = "dev"
}

variable "component" {
  type    = string
  default = "frontend"
}