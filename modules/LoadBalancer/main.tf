# modules/LoadBalancer/main.tf

resource "google_compute_global_address" "static_ip" {
  name = "website-ip"
}

resource "google_compute_url_map" "website_map" {
  name            = "website-url-map"
  default_service = google_compute_backend_bucket.website_backend.self_link
}

resource "google_compute_target_http_proxy" "website_http_proxy" {
  name    = "website-http-proxy"
  url_map = google_compute_url_map.website_map.self_link
}

resource "google_compute_global_forwarding_rule" "website_forwarding_rule" {
  name        = "website-forwarding-rule"
  target      = google_compute_target_http_proxy.website_http_proxy.self_link
  port_range  = "80"
  ip_address  = google_compute_global_address.static_ip.address
  ip_protocol = "TCP"
}

resource "google_compute_backend_bucket" "website_backend" {
  name        = "website-backend-bucket"
  bucket_name = var.storage_bucket_name
  enable_cdn  = true
}