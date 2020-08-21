provider "nsxt" {
  host                 = var.host
  vmc_token            = var.vmc_token
  allow_unverified_ssl = true
  enforcement_point    = "vmc-enforcementpoint"
}
########### configure the Management Gateway and the Computegateway ###########
/*
You have to do a terraform import first:
terraform import nsxt_policy_gateway_policy.cgw_policy cgw/default
terraform import nsxt_policy_gateway_policy.mgw_policy mgw/default
*/

########### prevent destroy ###########
/*
please take care if you working with the management and compute gateway!
You can destroy your whole SDDC with it!
Lifecycle prevent you to run the destroy command and kill your Gateways.
*/

resource "nsxt_policy_gateway_policy" "mgw_policy" {
  category     = "LocalGatewayRules"
  display_name = "default"
  domain       = "mgw"
    lifecycle {
      prevent_destroy = true
    }
  rule {
        action                = "ALLOW"
        destination_groups    = [
            "/infra/domains/mgw/groups/VCENTER",
        ]
        destinations_excluded = false
        direction             = "IN_OUT"
        disabled              = false
        display_name          = "vCenter Inbound Rule"
        ip_version            = "IPV4_IPV6"
        logged                = false
        profiles              = []
        scope                 = [
            "/infra/labels/mgw",
        ]
        services              = ["/infra/services/HTTPS",
                                 "/infra/services/ICMP-ALL",
        ]
        source_groups         = []
        sources_excluded      = false
    }

  rule {
      action                = "ALLOW"
      destination_groups    = []
      destinations_excluded = false
      direction             = "IN_OUT"
      disabled              = false
      display_name          = "vCenter Outbound Rule"
      ip_version            = "IPV4_IPV6"
      logged                = false
      profiles              = []
      scope                 = [
          "/infra/labels/mgw",
      ]
      services              = []
      source_groups         = [
          "/infra/domains/mgw/groups/VCENTER",
      ]
      sources_excluded      = false
  }
  rule {
      action                = "ALLOW"
      destination_groups    = []
      destinations_excluded = false
      direction             = "IN_OUT"
      disabled              = false
      display_name          = "ESXi Outbound Rule"
      ip_version            = "IPV4_IPV6"
      logged                = false
      profiles              = []
      scope                 = [
          "/infra/labels/mgw",
      ]
      services              = []
      source_groups         = [
          "/infra/domains/mgw/groups/ESXI",
      ]
      sources_excluded      = false
  }
}

resource "nsxt_policy_gateway_policy" "cgw_policy" {
  category     = "LocalGatewayRules"
  display_name = "default"
  domain       = "cgw"
    lifecycle {
      prevent_destroy = true
    }
    rule {
        action                = "ALLOW"
        destination_groups    = [
          "/infra/domains/mgw/groups/VCENTER"
        ]
        destinations_excluded = false
        direction             = "IN_OUT"
        disabled              = false
        display_name          = "Default VTI Rule"
        ip_version            = "IPV4_IPV6"
        logged                = false
        profiles              = []
        scope                 = []
        services              = [
          "/infra/services/HTTPS",
        ]
        source_groups         = []
        sources_excluded      = false
    }
    rule {
        action                = "DROP"
        destination_groups    = []
        destinations_excluded = false
        direction             = "IN_OUT"
        disabled              = false
        display_name          = "Default VTI Rule"
        ip_version            = "IPV4_IPV6"
        logged                = false
        profiles              = []
        scope                 = [
            "/infra/labels/cgw-vpn",
        ]
        services              = []
        source_groups         = []
        sources_excluded      = false
    }
}
