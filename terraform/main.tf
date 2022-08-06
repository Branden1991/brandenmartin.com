/* module "frontend" {
  source  = "app.terraform.io/branden/dns-zone/hive"
  version = "0.0.1" 
  source = "./terraform-hive-static-website"

  project_name = var.project_name
  env          = var.env
  website_fqdn = "dev.brandenmartin.com"
} */

module "dns-zone-brandenmartin-dot-com" {
  source  = "app.terraform.io/branden/dns-zone/hive"
  version = "0.0.2"

  project_name = var.project_name
  domain       = "brandenmartin.com"
  records = [
    {
      id      = 1
      name    = "*.local"
      type    = "A"
      ttl     = "300"
      records = ["127.0.0.1"]
      }, {
      id      = 2
      name    = "local"
      type    = "A"
      ttl     = "300"
      records = ["127.0.0.1"]
      }, {
      id      = 3
      name    = "pi"
      type    = "A"
      ttl     = "300"
      records = ["68.57.195.38"]
      }, {
      id      = 4
      name    = "*.devr"
      type    = "CNAME"
      ttl     = "300"
      records = ["c3my2ijp.cname.us.ngrok.io"]
      }, {
      id      = 5
      name    = "_acme-challenge.devr"
      type    = "CNAME"
      ttl     = "300"
      records = ["2dkcm6ecd.acme-challenge.ngrok-dns.com"]
      }, {
      id      = 6
      name    = "@"
      type    = "TXT"
      ttl     = "300"
      records = ["MS=ms28693039"]
    },
    {
      id   = 7
      name = "@"
      type = "MX"
      ttl  = "300"
      records = [
        "1 aspmx.l.google.com",
        "5 alt1.aspmx.l.google.com",
        "5 alt2.aspmx.l.google.com",
        "10 alt3.aspmx.l.google.com",
        "10 alt4.aspmx.l.google.com"
      ]
    }
  ]
  aliases = []
}
