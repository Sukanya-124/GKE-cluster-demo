resource "google_container_cluster" "primary" {
  name               = "my-cluster"
  location           = "us-central1-a"
  
  
  initial_node_count = 1
  
  node_config {
    machine_type = "n1-standard-2"
  }
  }
  
resource "google_container_node_pool" "node-pool-1" {
  name       = "node-pool-1"
  cluster    = google_container_cluster.primary.name
  location = google_container_cluster.primary.location
  node_count = 3
  
  node_config {
    machine_type = "n1-standard-2"
  }
  
  lifecycle {
   ignore_changes = [node_count]
   }
   }
   
resource "google_container_node_pool" "node-pool-2" {
  name       = "node-pool-2"
  cluster    = google_container_cluster.primary.name
  location = google_container_cluster.primary.location
  node_count = 2
  
  node_config {
    machine_type = "n1-standard-2"
  }
  
  autoscaling {
  
  min_node_count = 2
  max_node_count = 10
  
  }
  
  lifecycle {
  ignore_changes = [node_count]
  }
  
 }