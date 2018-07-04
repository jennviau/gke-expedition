# terraform-google-kubernetes-engine


## Usage

```
module "mycluster" {
  source = 

  settings = {
    region_name            = "europe-west1"
    zone_amount            = 3
    cluster_name           = "mycluster"
    gke_min_master_version = "1.8.6-gke.0"
  }
}
```
