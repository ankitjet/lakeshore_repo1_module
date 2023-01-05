variable "job_cloudwatch_log_group" {
  type        = string
  description = "Name of the log group for the job"
}

variable "glue_job_name" {
  type        = string
  description = "Name of the Glue Job"
}

variable "glue_role" {
  type        = string
  description = "IAM role associated to glue job"
}

variable "maximum_retries" {
  type        = number
  description = "Number of retries for the Job"
}

variable "workers" {
  type        = number
  description = "Specify the bumber of Workers"
}

variable "type_of_worker" {
  type        = string
  description = "Specify the Worker Type"
}

variable "time" {
  type        = number
  description = "Specify time in minutes"
}

variable "script_loc" {
  type        = string
  description = "Location of the glue job script"
}

variable "temporary_directory" {
  type        = string
  description = "Path of the Working Directory"
}

variable "env" {
  type        = string
  description = "environment for tagging"
}
