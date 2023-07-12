resource "google_project_service" "vpcaccess-api" {
  project = var.project
  service = "vpcaccess.googleapis.com"
}

resource "google_cloud_run_service" "default" {
  name     = var.cloudrun_name
  location = var.cloudrun_location
  project  = var.project

  template {
    metadata {
      annotations = {
        # Limit scale up to prevent any cost blow outs!
        "autoscaling.knative.dev/maxScale"        = var.max_scale
        "run.googleapis.com/vpc-access-connector" = var.vpc_connector_self_link
        "run.googleapis.com/vpc-access-egress"    = var.egress_traffic

      }
    }

    spec {
      containers {
        image = var.cloudrun_image
        resources {
          limits = {
            cpu    = var.cloudrun_cpu
            memory = var.cloudrun_memory
          }
        }
      }
    }
  }
}