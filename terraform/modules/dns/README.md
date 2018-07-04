# terraform-google-dns


## Usage

```
module "mydns" {
  source = ""

  ip_address = "35.35.35.35"
  zone_name = "automateit"
  record_name = "gke"
}
```
