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
  version = "0.0.1"

  project_name = var.project_name
  domain       = "brandenmartin.com"
  records = [
    {
      name    = "*.local"
      type    = "A"
      ttl     = "300"
      records = ["127.0.0.1"]
      }, {
      name    = "local"
      type    = "A"
      ttl     = "300"
      records = ["127.0.0.1"]
      }, {
      name    = "pi"
      type    = "A"
      ttl     = "300"
      records = ["68.57.195.38"]
      }, {
      name    = "*.devr"
      type    = "CNAME"
      ttl     = "300"
      records = ["c3my2ijp.cname.us.ngrok.io"]
      }, {
      name    = "_acme-challenge.devr"
      type    = "CNAME"
      ttl     = "300"
      records = ["2dkcm6ecd.acme-challenge.ngrok-dns.com"]
      }, {
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
