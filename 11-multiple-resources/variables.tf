variable "subnet_count" {
  type    = number
  default = 2
}

variable "ec2_instance_count" {
  type    = number
  default = 1
}

variable "ec2_instance_config_list" {
  type = list(object({
    instance_type = string
    ami           = string
    subnet_name   = optional(string, "default")
  }))

  default = []

  # Ensure that only t2.micro is used
  validation {
    condition     = alltrue([for config in var.ec2_instance_config_list : contains(["t2.micro"], config.instance_type)])
    error_message = "Only t2.micro instances are allowed."
  }

  # Ensure that only ubuntu and nginx images are used
  validation {
    condition     = alltrue([for config in var.ec2_instance_config_list : contains(["ubuntu", "nginx"], config.ami)])
    error_message = "At least one of the provided \"ami\" values is not supported.\nSupported \"ami\" values: \"ubuntu\", \"nginx\"."
  }
}

variable "ec2_instance_config_map" {
  type = map(object({
    instance_type = string
    ami           = string
    subnet_name   = optional(string, "default")
  }))

  # Ensure that only t2.micro is used 
  validation {
    condition     = alltrue([for key, config in var.ec2_instance_config_map : contains(["t2.micro"], config.instance_type)])
    error_message = "Only t2.micro instances are allowed."
  }

  # Ensure that only ubuntu and nginx images are used
  validation {
    condition     = alltrue([for config in values(var.ec2_instance_config_map) : contains(["ubuntu", "nginx"], config.ami)])
    error_message = "At least one of the provided \"ami\" values is not supported.\nSupported \"ami\" values: \"ubuntu\", \"nginx\"."
  }
}

variable "subnet_config" {
  type = map(object({
    cidr_block = string
  }))

  validation {
    condition     = alltrue([for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))])
    error_message = "At least one of the provided CIDR blocks is not valid."
  }
}

