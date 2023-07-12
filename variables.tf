variable "cloudrun_name" {
  description = "The name of the cloudrun service"
  type        = string
}
variable "cloudrun_location" {
  description = "The location of the cloudrun service"
  type        = string
}
variable "project" {
  description = "The project of the cloudrun service"
  type        = string
}
variable "cloudrun_image" {
  description = "The image for the cloudrun service"
  type        = string
}

variable "cloudrun_cpu" {
  description = "Amt of cpu for the cloudrun - service "
  type        = string
  default     = "1000m"
}
variable "cloudrun_memory" {
  description = "Amt of memory for the cloudrun - service"
  type        = string
  default     = "512M"
}

variable "max_scale" {
  description = "No. of parallel srvs to which scaling is done"
  type        = string
}
variable "egress_traffic" {
  description = "Allowed egress for the connector.Can be either of private-ranges-only and all-traffic."
  type        = string
}

variable "vpc_connector_self_link" {
  type        = string
  description = "The self link of host project vpc connector"
}