# terraform-gke-cluster


## Usage

```
module "mycluster" {
  source = 

  settings = {
    region_name            = "northamerica-northeast1"
    zone_amount            = 3
    cluster_name           = "mycluster"
    gke_min_master_version = "1.9.7-gke.0"
  }
}
```
