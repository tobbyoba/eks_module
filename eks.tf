#create eks cluster
resource "aws_eks_cluster" "demo" {
  name     = "demo"
  role_arn = "data.terraform_remote_state.network.outputs.node_role"

  vpc_config {
    subnet_ids = [
      "data.terraform_remote_state.network.outputs.public_subnet_cidr[0]", "data.terraform_remote_state.network.outputs.public_subnet_cidr[1]",
      "data.terraform_remote_state.network.outputs.private_subnet_cidr[0]", "data.terraform_remote_state.network.outputs.private_subnet_cidr[1]"

    ]
  }

}