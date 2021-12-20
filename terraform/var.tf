variable "cluster_version" {
  type    = string
  default = "1.21"
}

variable "env_name" {
  type    = string
  default = "dev"
}

variable "vpc_id" {
  type    = string
  default = "vpc-81c826fc"
}

variable "subnets" {
  type    = list(string)
  default = ["subnet-4ee63428", "subnet-0a60b92b", "subnet-c0e7858d"]
}

variable "instance_type" {
  type    = string
  default = "t3a.micro"
}

variable "asg_desired_capacity" {
  type    = number
  default = 3
}