variable "region" {}

variable "app" {
  type = object(
    {
      id      = string
      version = string
      env     = string
    }
  )
  default = {
    id      = "psi"
    version = "1.0.0"
    env     = "lab"
  }
}

variable "ami" {
  type        = string
  description = "The AMI to use for the instance. By default it is the AMI provided by Amazon with Ubuntu 20.04"
  default     = ""
  # validation {
  #   condition     = can(regex("^ami-", var.ami))
  #   error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  # }
}

variable "instance_type" {
  type        = string
  description = "Type of instance, Default is t2.micro"
  default     = "t2.micro"
}
# Validation on admin as user
variable "ssh_users" {
  type        = list(map(string))
  description = "Bastion host ssh user details"
}