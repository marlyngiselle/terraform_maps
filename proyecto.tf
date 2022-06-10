# MAP ----- Key:value

provider "aws" {}

variable nombres_redes {
  type        = map
  default     = {prod = "10.80.0.0/16", desa = "192.168.0.0/16", test = "172.16.0.0/16"}
}

resource "aws_vpc" "redes_piratas" {
  for_each   = var.nombres_redes
  cidr_block = "${each.value}"
  tags       = { Name = "red-$(each.key)" }
}




