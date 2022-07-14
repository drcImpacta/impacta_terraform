resource "aws_instance" "mongodb" {
  ami                         = data.aws_ami.app_ami.id
  instance_type               = lookup(var.instance_type, var.env)
  subnet_id                   = data.aws_subnet.app_subnet.id
  associate_public_ip_address = false
  tags = {
    Name = format("%s-mongodb_server-%s", var.project, var.env)
  }
  key_name  = aws_key_pair.app_ssh_key.id
  user_data = data.template_file.mongodb_startup_script.rendered
}

resource "aws_key_pair" "app_ssh_key" {
  key_name   = format("%s-ssh-%s", var.project, var.env)
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbTASc1hCubN6sXKCAzV1Ku76qODtXFoWHqKv0KNoTCEOQ69zRjAaakTzvombTwWSPCuJg1z0nQUS/ArpkzCM1yc+GkGHrww7hPSG9oR/Fi1iPl35Za/cFGCEKM0HPIb305zVWfO8KeyNLj6CbLl/jXZWYJPM+W+Vlw7Ge7pxLkmzi1xconsGr4J2Owf0RsefKEttvXNwS/RbUgbH+E5eaZbTIojk660i0NbnBbwDQ1n0S4glmL6wA0f7w6rDKljHzq3iZIcm4CNJnZLbtNzecNAt5CrqrjtM+4eXJ/QVTwjsnrcjROhJ3dVLq3ucBNRkR3SNuo7OX46rX1czMoX3iiwKwOZ5wiIPYJxf5WwW6YL8uOo2T8XXl2n4BQLC4t/UlUqnEe7mJPQs+v7ntRCkWGSy9lBuyMxqYiWBQNB7hvO+qG+TVbuIfvEpN26aJd7oDXVhJCPpq97azsxmD9kiK9QKfYws4QZ4yUhiIcqNGbPI2+6zmpBTUU4QUH2xbEik= douglas@BRUTO"
}
