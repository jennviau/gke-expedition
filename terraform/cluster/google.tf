provider "google" {
  credentials = "${file("..//terraform-admin.json")}"
}
