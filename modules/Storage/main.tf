# modules/Storage/main.tf

resource "google_storage_bucket" "website_bucket" {
  name          = "${var.project_id}-website-bucket"
  location      = "US"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "all_users_view" {
  bucket = google_storage_bucket.website_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}