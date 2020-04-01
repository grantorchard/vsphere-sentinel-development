resource "nsxt_policy_group" "group1" {
    display_name = "tf-group1"
    description  = "Terraform provisioned Group"


    criteria {
        ipaddress_expression {
            ip_addresses = ["0.0.0.0/0", "192.168.10.0/24"]
        }
    }
}

resource null_resource "extract" {
  provisioner local-exec {
    command = "echo TF_VAR_NSXT_PASSWORD"
  }
}

/*
resource "nsxt_policy_security_policy" "policy1" {
    display_name = "policy1"
    description  = "Terraform provisioned Security Policy"
    category     = "Application"
    locked       = false
    stateful     = true
    tcp_strict   = false
    scope        = [nsxt_policy_group.pets.path]

    rule {
      display_name       = "block_icmp"
      destination_groups = [nsxt_policy_group.cats.path, nsxt_policy_group.dogs.path]
      action             = "DROP"
      services           = [nsxt_policy_service.icmp.path]
      logged             = true
    }

    rule {
      display_name     = "allow_udp"
      source_groups    = [nsxt_policy_group.fish.path]
      sources_excluded = true
      scope            = [nsxt_policy_group.aquarium.path]
      action           = "ALLOW"
      services         = [nsxt_policy_service.udp.path]
      logged           = true
      disabled         = true
      notes            = "Disabled by starfish for debugging"
    }
}

*/