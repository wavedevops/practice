variable "houses_data" {
  default = {
    house_1 = {
      name = "raju"
      age = 22
      sex = "m"
    }
    house_2 = {
      name = "john"
      age = 21
      sex = "m"
    }
    house_3 = {
      name = "rani"
      age = 32
      sex = "f"
    }
  }
}
output "data" {
  value = var.houses_data.house_1["name"]
}