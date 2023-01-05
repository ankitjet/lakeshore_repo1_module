resource "aws_cloudwatch_log_group" "monitoring_log_group" {
  name              = var.job_cloudwatch_log_group
  retention_in_days = 0
}

resource "aws_glue_job" "sample_job" {
  name     = var.glue_job_name
  description = "Glue Job for Lakeshore Learning"
  role_arn = var.glue_role
  glue_version = "3.0"
  max_retries = var.maximum_retries
  number_of_workers = var.workers
  execution_class = "STANDARD"
  worker_type = var.type_of_worker
  timeout =  var.time
  

  command {
    script_location = var.script_loc
    python_version = 3
  }

    default_arguments = {
    # ... potentially other arguments ...
    "--job-bookmark-option" ="job-bookmark-disable"
    "--TempDir" = var.temporary_directory
    "--continuous-log-logGroup"          = aws_cloudwatch_log_group.monitoring_log_group.name
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = ""
  }
  tags ={
        Name = var.glue_job_name
        project = "datalake"
        business = "technology"
        department = "data-engineering"
        environment = var.env
    }
}
