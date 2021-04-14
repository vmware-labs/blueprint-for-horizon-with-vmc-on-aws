provider "nsxt" {
    host                 = var.host
    vmc_token            = var.vmc_token
    allow_unverified_ssl = true
    enforcement_point    = "vmc-enforcementpoint"
 }

###################### creating Network Segments ######################
###################### can be outcommented "/* */" or edited ######################

data "nsxt_policy_transport_zone" "TZ" {
  display_name = "vmc-overlay-tz"
}

resource "nsxt_policy_segment" "ManagementHorizon" {
  display_name        = "Horizon_MGMT"
  description         = "Horizon_MGMT Segment provisioned by Terraform"
  connectivity_path   = "/infra/tier-1s/cgw"
  transport_zone_path = data.nsxt_policy_transport_zone.TZ.path
  subnet {
    cidr              = "172.16.199.1/24"
    dhcp_ranges       = ["172.16.199.2-172.16.199.254"]
  }
}
resource "nsxt_policy_segment" "UAG_external" {
  display_name        = "Horizon_UAG_external"
  description         = "Horizon_UAG_external Segment provisioned by Terraform"
  connectivity_path   = "/infra/tier-1s/cgw"
  transport_zone_path = data.nsxt_policy_transport_zone.TZ.path
  subnet {
    cidr              = "172.16.200.250/29"
  }
}
resource "nsxt_policy_segment" "Windows_Desktops" {
  display_name        = "Horizon_Windows_Desktops"
  description         = "Horizon_Windows_Desktops Segment provisioned by Terraform"
  connectivity_path   = "/infra/tier-1s/cgw"
  transport_zone_path = data.nsxt_policy_transport_zone.TZ.path
  subnet {
    cidr              = "172.16.1.1/20"
    dhcp_ranges       = ["172.16.1.2-172.16.15.254"]
  }
}
resource "nsxt_policy_segment" "Linux_Desktops" {
  display_name        = "Horizon_Linux_Desktops"
  description         = "Horizon_Linux_Desktops Segment provisioned by Terraform"
  connectivity_path   = "/infra/tier-1s/cgw"
  transport_zone_path = data.nsxt_policy_transport_zone.TZ.path
  subnet {
    cidr              = "172.16.16.1/20"
    dhcp_ranges       = ["172.16.16.2-172.16.31.254"]
  }
}

###################### creating all Services ######################

// creating Services TCP 8443:
resource "nsxt_policy_service" "Blast_TCP8443" {
  description  = "Blast service provisioned by Terraform"
  display_name = "Blast_TCP8443"

  l4_port_set_entry {
    display_name      = "TCP8443"
    description       = "TCP port 8443 entry"
    protocol          = "TCP"
    destination_ports = ["8443"]
  }
}

// creating Services UDP 8443:
resource "nsxt_policy_service" "Blast_UDP8443" {
  description  = "Blast service provisioned by Terraform"
  display_name = "Blast_UDP8443"

  l4_port_set_entry {
    display_name      = "UDP8443"
    description       = "UDP port 8443 entry"
    protocol          = "UDP"
    destination_ports = ["8443"]
  }
}

// creating Services TCP 9443:
resource "nsxt_policy_service" "Blast_TCP9443" {
  description  = "Blast service provisioned by Terraform"
  display_name = "Blast_TCP9443"

  l4_port_set_entry {
    display_name      = "TCP9443"
    description       = "TCP port 9443 entry"
    protocol          = "TCP"
    destination_ports = ["9443"]
  }
}

// creating Services TCP 22443:
resource "nsxt_policy_service" "Blast_TCP22443" {
  description  = "Blast service provisioned by Terraform"
  display_name = "Blast_TCP22443"

  l4_port_set_entry {
    display_name      = "TCP22443"
    description       = "TCP port 22443 entry"
    protocol          = "TCP"
    destination_ports = ["22443"]
  }
}

// creating Services UDP 22443:
resource "nsxt_policy_service" "Blast_UDP22443" {
  description  = "Blast service provisioned by Terraform"
  display_name = "Blast_UDP22443"

  l4_port_set_entry {
    display_name      = "UDP22443"
    description       = "UDP port 22443 entry"
    protocol          = "UDP"
    destination_ports = ["22443"]
  }
}

// creating Services TCP 4172:
resource "nsxt_policy_service" "PCoIP_TCP4172" {
  description  = "PCoIP service provisioned by Terraform"
  display_name = "PCoIP_TCP4172"

  l4_port_set_entry {
    display_name      = "TCP4172"
    description       = "TCP port 4172 entry"
    protocol          = "TCP"
    destination_ports = ["4172"]
  }
}

// creating Services UDP 4172:
resource "nsxt_policy_service" "PCoIP_UDP4172" {
  description  = "PCoIP service provisioned by Terraform"
  display_name = "PCoIP_UDP4172"

  l4_port_set_entry {
    display_name      = "UDP4172"
    description       = "UDP port 4172 entry"
    protocol          = "UDP"
    destination_ports = ["4172"]
  }
}

// creating Services UDP 443:
resource "nsxt_policy_service" "Blast_UDP443" {
  description  = "Blast service provisioned by Terraform"
  display_name = "Blast_UDP443"

  l4_port_set_entry {
    display_name      = "UDP443"
    description       = "UDP port 433 entry"
    protocol          = "UDP"
    destination_ports = ["443"]
  }
}

// creating Services TCP 9427:
resource "nsxt_policy_service" "CDR_MMR_TCP9427" {
  description  = "CDR/MMR service provisioned by Terraform"
  display_name = "CDR/MMR_TCP9427"

  l4_port_set_entry {
    display_name      = "TCP9427"
    description       = "TCP port 9427 entry"
    protocol          = "TCP"
    destination_ports = ["9427"]
  }
}

// creating Services TCP 32111:
resource "nsxt_policy_service" "USB_TCP32111" {
  description  = "USB service provisioned by Terraform"
  display_name = "USB_TCP32111"

  l4_port_set_entry {
    display_name      = "TCP32111"
    description       = "TCP port 32111 entry"
    protocol          = "TCP"
    destination_ports = ["32111"]
  }
}

// creating Services TCP 1433:
resource "nsxt_policy_service" "EventDB_TCP1433" {
  description  = "USB service provisioned by Terraform"
  display_name = "EventDB_TCP1433"

  l4_port_set_entry {
    display_name      = "TCP1433"
    description       = "TCP port 1433 entry"
    protocol          = "TCP"
    destination_ports = ["1433"]
  }
}

// creating Services SSL_TCP22:
resource "nsxt_policy_service" "SSL_TCP22" {
  description  = "USB service provisioned by Terraform"
  display_name = "EventDB_TCP22"

  l4_port_set_entry {
    display_name      = "TCP22"
    description       = "TCP port 22 entry"
    protocol          = "TCP"
    destination_ports = ["22"]
  }
}

// creating Services TCP 3091:
resource "nsxt_policy_service" "vROPS_TCP3091" {
  description  = "vROPS service provisioned by Terraform"
  display_name = "vROPS_TCP3091"

  l4_port_set_entry {
    display_name      = "TCP3091"
    description       = "TCP port 3091 entry"
    protocol          = "TCP"
    destination_ports = ["3091"]
  }
}
// creating Services TCP 3099:
resource "nsxt_policy_service" "vROPS_TCP3099" {
  description  = "vROPS service provisioned by Terraform"
  display_name = "vROPS_TCP3099"

  l4_port_set_entry {
    display_name      = "TCP3099"
    description       = "TCP port 3099 entry"
    protocol          = "TCP"
    destination_ports = ["3099"]
  }
}

// creating Services TCP 3101:
resource "nsxt_policy_service" "vROPS_TCP3101" {
  description  = "vROPS service provisioned by Terraform"
  display_name = "vROPS_TCP3101"

  l4_port_set_entry {
    display_name      = "TCP3101"
    description       = "TCP port 3101 entry"
    protocol          = "TCP"
    destination_ports = ["3101"]
  }
}

// creating Services TCP 3100:
resource "nsxt_policy_service" "vROPS_TCP3100" {
  description  = "vROPS service provisioned by Terraform"
  display_name = "vROPS_TCP3100"

  l4_port_set_entry {
    display_name      = "TCP3100"
    description       = "TCP port 3100 entry"
    protocol          = "TCP"
    destination_ports = ["3100"]
  }
}

// creating Services TCP 22389:
resource "nsxt_policy_service" "ADLDS_TCP22389" {
  description  = "ADLDS service provisioned by Terraform"
  display_name = "ADLDS_TCP22389"

  l4_port_set_entry {
    display_name      = "TCP22389"
    description       = "TCP port 22389 entry"
    protocol          = "TCP"
    destination_ports = ["22389"]
  }
}

// creating Services TCP 22636:
resource "nsxt_policy_service" "ADLDS_TCP22636" {
  description  = "ADLDS service provisioned by Terraform"
  display_name = "ADLDS_TCP22636"

  l4_port_set_entry {
    display_name      = "TCP22636"
    description       = "TCP port 22636 entry"
    protocol          = "TCP"
    destination_ports = ["22636"]
  }
}

// creating Services TCP 8472:
resource "nsxt_policy_service" "VIPA_TCP8472" {
  description  = "VIPA service provisioned by Terraform"
  display_name = "VIPA_TCP8472"

  l4_port_set_entry {
    display_name      = "TCP8472"
    description       = "TCP port 8472 entry"
    protocol          = "TCP"
    destination_ports = ["8472"]
  }
}

// creating Services TCP 4101:
resource "nsxt_policy_service" "JMS_SSL_TCP4101" {
  description  = "JMS_SSL service provisioned by Terraform"
  display_name = "JMS_SSL_TCP4101"

  l4_port_set_entry {
    display_name      = "TCP4101"
    description       = "TCP port 4101 entry"
    protocol          = "TCP"
    destination_ports = ["4101"]
  }
}

// creating Services TCP 4002:
resource "nsxt_policy_service" "JMS_SSL_TCP4002" {
  description  = "JMS_SSL service provisioned by Terraform"
  display_name = "JMS_SSL_TCP4002"

  l4_port_set_entry {
    display_name      = "TCP4002"
    description       = "TCP port 4002 entry"
    protocol          = "TCP"
    destination_ports = ["4002"]
  }
}

// creating Services TCP 11002:
resource "nsxt_policy_service" "TCP11002" {
  description  = "service provisioned by Terraform"
  display_name = "TCP11002"

  l4_port_set_entry {
    display_name      = "TCP11002"
    description       = "TCP port 11002 entry"
    protocol          = "TCP"
    destination_ports = ["11002"]
  }
}
// creating Services replica_TCP135:
resource "nsxt_policy_service" "replica_TCP135" {
  description  = "service provisioned by Terraform"
  display_name = "replica_135"

  l4_port_set_entry {
    display_name      = "TCP135"
    description       = "TCP port 135 entry"
    protocol          = "TCP"
    destination_ports = ["135"]
  }
}

// creating Services JMS_TCP4100:
resource "nsxt_policy_service" "JMS_TCP4100" {
  description  = "service provisioned by Terraform"
  display_name = "JMS_TCP4100"

  l4_port_set_entry {
    display_name      = "JMS_TCP4100"
    description       = "TCP port 4100 entry"
    protocol          = "TCP"
    destination_ports = ["4100"]
  }
}

// creating Services RSA_SecureID_UDP5500:
resource "nsxt_policy_service" "RSA_SecureID_UDP5500" {
  description  = "service provisioned by Terraform"
  display_name = "RSA_SecureID_UDP5500"

  l4_port_set_entry {
    display_name      = "RSA_SecureID_UDP5500"
    description       = "UDP port 5500 entry"
    protocol          = "UDP"
    destination_ports = ["5500"]
  }
}

// creating Services iOS_UDP88:
resource "nsxt_policy_service" "iOS_UDP88" {
  description  = "service provisioned by Terraform"
  display_name = "iOS_UDP88"

  l4_port_set_entry {
    display_name      = "iOS_UDP88"
    description       = "UDP port 88 entry"
    protocol          = "UDP"
    destination_ports = ["88"]
  }
}

// creating Services iOS_TCP88:
resource "nsxt_policy_service" "iOS_TCP88" {
  description  = "service provisioned by Terraform"
  display_name = "iOS_TCP88"

  l4_port_set_entry {
    display_name      = "iOS_TCP88"
    description       = "TCP port 88 entry"
    protocol          = "TCP"
    destination_ports = ["88"]
  }
}

// creating Services Android_TCP5262:
resource "nsxt_policy_service" "Android_TCP5262" {
  description  = "service provisioned by Terraform"
  display_name = "Android_TCP5262"

  l4_port_set_entry {
    display_name      = "Android_TCP5262"
    description       = "TCP port 5262 entry"
    protocol          = "TCP"
    destination_ports = ["5262"]
  }
}

// creating Services SSL_cert_TCP7443:
resource "nsxt_policy_service" "SSL_cert_TCP7443" {
  description  = "service provisioned by Terraform"
  display_name = "SSL_cert_TCP7443"

  l4_port_set_entry {
    display_name      = "SSL_cert_TCP7443"
    description       = "TCP port 7443 entry"
    protocol          = "TCP"
    destination_ports = ["7443"]
  }
}

###################### creating all Groups ######################

// creating Group for UAG_external:
resource "nsxt_policy_group" "UAG_external" {
  display_name = "UAG_external"
  description  = "Created from Terraform UAG_external"
  domain       = "cgw"
}

// creating Group for UAG_internal:
resource "nsxt_policy_group" "UAG_internal" {
  display_name = "UAG_internal"
  description  = "Created from Terraform UAG_internal"
  domain       = "cgw"
}

// creating Group for ConnectionServer:
resource "nsxt_policy_group" "ConnectionServer" {
  display_name = "ConnectionServer"
  description  = "Created from Terraform ConnectionServer"
  domain       = "cgw"
}

// creating Group for VDI-Environment:
resource "nsxt_policy_group" "VDI_Clients" {
  display_name = "VDI_Clients"
  description  = "Created from Terraform VDI_Clients"
  domain       = "cgw"
}

// creating Group for RADIUS:
resource "nsxt_policy_group" "RADIUS" {
  display_name = "RADIUS"
  description  = "Created from Terraform RADIUS"
  domain       = "cgw"
}

// creating Group for AppVolumes Manager:
resource "nsxt_policy_group" "AppVol_MGMT" {
  display_name = "AppVol_MGMT"
  description  = "Created from Terraform AppVol_MGMT"
  domain       = "cgw"
}

// creating Group for Event_Database:
resource "nsxt_policy_group" "Event_Database" {
  display_name = "Event_Database"
  description  = "Created from Terraform Event_Database"
  domain       = "cgw"
}

// creating Group for Admin_VMs:
resource "nsxt_policy_group" "Admin_VMs" {
  display_name = "Admin_VMs"
  description  = "Created from Terraform Admin_VMs"
  domain       = "cgw"
}

// creating Group for vROPS:
resource "nsxt_policy_group" "vROPS" {
  display_name = "vROPS"
  description  = "Created from Terraform vROPS"
  domain       = "cgw"
}
// creating Group for Workspace1_Connector:
resource "nsxt_policy_group" "Workspace1_Connector" {
  display_name = "Workspace1_Connector"
  description  = "Created from Terraform Workspace1_Connector"
  domain       = "cgw"
}

// creating Group for Workspace1_Access:
resource "nsxt_policy_group" "Workspace1_Access" {
  display_name = "Workspace1_Access"
  description  = "Created from Terraform Workspace1_Access"
  domain       = "cgw"
}

// creating Group for Horizon Cloud_Connector:
resource "nsxt_policy_group" "Horizon_Cloud_Connector" {
  display_name = "Horizon_Cloud_Connector"
  description  = "Created from Terraform Horizon_Cloud_Connector"
  domain       = "cgw"
}

// creating Group for Enrollment_Server:
resource "nsxt_policy_group" "Enrollment_Server" {
  display_name = "Enrollment_Server"
  description  = "Created from Terraform Enrollment_Server"
  domain       = "cgw"
}

// creating Group for JMP_Server:
resource "nsxt_policy_group" "JMP_Server" {
  display_name = "JMP_Server"
  description  = "Created from Terraform JMP_Server"
  domain       = "cgw"
}

// creating Group for RFC_1918:
resource "nsxt_policy_group" "RFC_1918" {
  display_name = "RFC_1918"
  description  = "Created from Terraform RFC_1918"
  domain       = "cgw"

    criteria {
    ipaddress_expression {
      ip_addresses = ["192.168.0.0/16", "172.16.0.0/16", "10.0.0.0/8"]
    }
  }
}

// creating Group for DNS_Server:
resource "nsxt_policy_group" "DNS_Server" {
  display_name = "DNS_Server"
  description  = "Created from Terraform DNS_Server"
  domain       = "cgw"
}

// creating Group for Domain_Controller:
resource "nsxt_policy_group" "Domain_Controller" {
  display_name = "Domain_Controller"
  description  = "Created from Terraform Domain_Controller"
  domain       = "cgw"
}
// creating Group for RSA_SecureID_Server:
resource "nsxt_policy_group" "RSA_SecureID_Server" {
  display_name = "RSA_SecureID_Server"
  description  = "Created from Terraform RSA_SecureID_Server"
  domain       = "cgw"
}

// creating Group for AD_cert:
resource "nsxt_policy_group" "AD_cert" {
  display_name = "AD_cert"
  description  = "Created from Terraform AD_cert"
  domain       = "cgw"
}

// creating Group for AppVol_SQLt:
resource "nsxt_policy_group" "AppVol_SQL" {
  display_name = "AppVol_SQL"
  description  = "Created from Terraform AppVol_SQL"
  domain       = "cgw"
}


###################### creating DFW Security Rules ######################
###################### creating Ruleset Infrastructure ######################
###################### creating Ruleset for Unified Access Gateway internal ######################
resource "nsxt_policy_security_policy" "DNS" {
  domain       = "cgw"
  display_name = "DNS"
  description  = "Terraform DNS Ruleset"
  category     = "Infrastructure"

  rule {
    display_name       = "DNS Service"
    source_groups      = ["${nsxt_policy_group.RFC_1918.path}"]
    destination_groups = ["${nsxt_policy_group.DNS_Server.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/DNS"]
    logged             = true
  }
    rule {
    display_name       = "DNS Service"
    source_groups      = ["${nsxt_policy_group.DNS_Server.path}"]
    destination_groups = ["${nsxt_policy_group.RFC_1918.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/DNS"]
    logged             = true
  }
}

###################### creating Ruleset Environment ######################
###################### creating Ruleset for Unified Access Gateway external ######################

resource "nsxt_policy_security_policy" "UAG_external" {
  domain       = "cgw"
  display_name = "UAG_external"
  description  = "Terraform UAG_external Ruleset"
  category     = "Environment"

  rule {
    display_name       = "UAG_external_Clients_Inbound"
    source_groups      = [nsxt_policy_group.RFC_1918.path]
    sources_excluded   = true
    destination_groups = [nsxt_policy_group.UAG_external.path]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS", nsxt_policy_service.Blast_TCP8443.path, nsxt_policy_service.Blast_UDP443.path, nsxt_policy_service.PCoIP_TCP4172.path, nsxt_policy_service.PCoIP_UDP4172.path]
    logged             = true
    }

   rule {
      display_name       = "UAG_external_VDI_Clients_Outbound"
      source_groups      = [nsxt_policy_group.UAG_external.path]
      destination_groups = [nsxt_policy_group.VDI_Clients.path]
      action             = "ALLOW"
      services           = [nsxt_policy_service.Blast_TCP22443.path, "/infra/services/RDP", nsxt_policy_service.CDR_MMR_TCP9427.path, nsxt_policy_service.USB_TCP32111.path, nsxt_policy_service.PCoIP_TCP4172.path, nsxt_policy_service.PCoIP_UDP4172.path]
      logged             = true
    }
    rule {
       display_name       = "UAG_external_ConnectionServer_Outbound"
       source_groups      = [nsxt_policy_group.UAG_external.path]
       destination_groups = [nsxt_policy_group.ConnectionServer.path]
       action             = "ALLOW"
       services           = ["/infra/services/HTTPS"]
       logged             = true
     }
    rule {
       display_name       = "UAG_external_RADIUS_Outbound"
       source_groups      = [nsxt_policy_group.UAG_external.path]
       destination_groups = [nsxt_policy_group.RADIUS.path]
       action             = "ALLOW"
       services           = [nsxt_policy_service.RSA_SecureID_UDP5500.path]
       logged             = true
     }
}


###################### creating Ruleset for Unified Access Gateway internal ######################

resource "nsxt_policy_security_policy" "UAG_internal" {
  domain       = "cgw"
  display_name = "UAG_internal"
  description  = "Terraform UAG_internal Ruleset"
  category     = "Environment"

  rule {
    display_name       = "UAG_internal_Clients_Inbound"
    source_groups      = ["${nsxt_policy_group.RFC_1918.path}"]
    destination_groups = ["${nsxt_policy_group.UAG_internal.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS", "${nsxt_policy_service.Blast_TCP8443.path}", "${nsxt_policy_service.Blast_UDP443.path}", "${nsxt_policy_service.PCoIP_TCP4172.path}", "${nsxt_policy_service.PCoIP_UDP4172.path}"]
    logged             = true
  }

  rule {
    display_name       = "UAG_internal_VDI_Clients_Outbound"
    source_groups      = ["${nsxt_policy_group.UAG_internal.path}"]
    destination_groups = ["${nsxt_policy_group.VDI_Clients.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.Blast_TCP22443.path}", "/infra/services/RDP", "${nsxt_policy_service.CDR_MMR_TCP9427.path}", "${nsxt_policy_service.USB_TCP32111.path}", "${nsxt_policy_service.PCoIP_TCP4172.path}", "${nsxt_policy_service.PCoIP_UDP4172.path}"]
    logged             = true
  }

  rule {
     display_name       = "UAG_internal_ConnectionServer_Outbound"
     source_groups      = ["${nsxt_policy_group.UAG_internal.path}"]
     destination_groups = ["${nsxt_policy_group.ConnectionServer.path}"]
     action             = "ALLOW"
     services           = ["/infra/services/HTTPS"]
     logged             = true
  }
   rule {
       display_name       = "UAG_internal_RADIUS_Outbound"
       source_groups      = [nsxt_policy_group.UAG_internal.path]
       destination_groups = [nsxt_policy_group.RADIUS.path]
       action             = "ALLOW"
       services           = [nsxt_policy_service.RSA_SecureID_UDP5500.path]
       logged             = true
  }
}

###################### creating Ruleset for Internal Connections without internal UAGs ######################

resource "nsxt_policy_security_policy" "Internal_Client_Connection" {
  domain       = "cgw"
  display_name = "Internal_Client_Connection"
  description  = "Terraform Internal_Client_Connection Ruleset"
  category     = "Environment"

  rule {
    display_name       = "Internal_Client_Connection_VDI_Clients_Outbound"
    source_groups      = ["${nsxt_policy_group.RFC_1918.path}"]
    destination_groups = ["${nsxt_policy_group.VDI_Clients.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/RDP", "${nsxt_policy_service.CDR_MMR_TCP9427.path}", "${nsxt_policy_service.USB_TCP32111.path}", "${nsxt_policy_service.PCoIP_TCP4172.path}", "${nsxt_policy_service.PCoIP_UDP4172.path}", "/infra/services/HTTPS"]
    logged             = true
  }
  rule {
    display_name       = "Internal_Client_Connection_Connection_Server_Outbound"
    source_groups       = ["${nsxt_policy_group.RFC_1918.path}"]
    destination_groups = ["${nsxt_policy_group.ConnectionServer.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS", "${nsxt_policy_service.Blast_TCP8443.path}"]
    logged             = true
  }
  rule {
    display_name       = "Internal_Client_Workspace_1_Access_Outbound"
    source_groups       = ["${nsxt_policy_group.RFC_1918.path}"]
    destination_groups = ["${nsxt_policy_group.Workspace1_Access.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS", "${nsxt_policy_service.Blast_TCP8443.path}", "${nsxt_policy_service.iOS_TCP88.path}", "${nsxt_policy_service.iOS_UDP88.path}", "${nsxt_policy_service.Android_TCP5262.path}", "${nsxt_policy_service.SSL_cert_TCP7443.path}"]
    logged             = true
  }
  rule {
    display_name       = "Internal_Client_Workspace_1_Connector_Outbound"
    source_groups       = ["${nsxt_policy_group.RFC_1918.path}"]
    destination_groups = ["${nsxt_policy_group.Workspace1_Connector.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
}

###################### creating Ruleset for Horizon Connection Server ######################

resource "nsxt_policy_security_policy" "Horizon_Connection_Server" {
  domain       = "cgw"
  display_name = "Horizon_Connection_Server"
  description  = "Terraform Horizon_Connection_Server Ruleset"
  category     = "Environment"

  rule {
    display_name       = "Horizon_Connection_Server_Connection_Server_In-/Outbound"
    source_groups      = ["${nsxt_policy_group.ConnectionServer.path}"]
    destination_groups = ["${nsxt_policy_group.ConnectionServer.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/LDAP", "${nsxt_policy_service.USB_TCP32111.path}", "${nsxt_policy_service.replica_TCP135.path}", "${nsxt_policy_service.JMS_TCP4100.path}", "${nsxt_policy_service.JMS_SSL_TCP4101.path}", "${nsxt_policy_service.ADLDS_TCP22389.path}", "${nsxt_policy_service.ADLDS_TCP22636.path}", "${nsxt_policy_service.VIPA_TCP8472.path}"]
    logged             = true
  }
  rule {
    display_name       = "Horizon_Connection_Server_Event_DB_Outbound"
    source_groups      = ["${nsxt_policy_group.ConnectionServer.path}"]
    destination_groups = ["${nsxt_policy_group.Event_Database.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.EventDB_TCP1433.path}"]
    logged             = true
  }
  rule {
    display_name       = "Horizon_Connection_Server_vCenter_Outbound"
    source_groups      = ["${nsxt_policy_group.ConnectionServer.path}"]
    destination_groups = ["/infra/domains/mgw/groups/VCENTER"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
  rule {
    display_name       = "Horizon_Connection_Server_VDI_Clients"
    source_groups      = ["${nsxt_policy_group.ConnectionServer.path}"]
    destination_groups = ["${nsxt_policy_group.VDI_Clients.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.Blast_TCP22443.path}", "/infra/services/RDP", "${nsxt_policy_service.CDR_MMR_TCP9427.path}", "${nsxt_policy_service.USB_TCP32111.path}", "${nsxt_policy_service.PCoIP_TCP4172.path}", "${nsxt_policy_service.PCoIP_UDP4172.path}"]
    logged             = true
  }
  rule {
    display_name       = "Horizon_Connection_Server_Enrollment_Server_Outbound"
    source_groups      = ["${nsxt_policy_group.ConnectionServer.path}"]
    destination_groups = ["${nsxt_policy_group.Enrollment_Server.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.USB_TCP32111.path}"]
    logged             = true
  }

  rule {
    display_name       = "Horizon_Connection_Server_RSA_SecurID"
    source_groups      = ["${nsxt_policy_group.ConnectionServer.path}"]
    destination_groups = ["${nsxt_policy_group.RSA_SecureID_Server.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.RSA_SecureID_UDP5500.path}"]
    logged             = true
  }
}

###################### creating Ruleset for Admin Access ######################


resource "nsxt_policy_security_policy" "Admin_Access" {
  domain       = "cgw"
  display_name = "Admin_Access"
  description  = "Terraform Admin_Access Ruleset"
  category     = "Environment"

  rule {
    display_name       = "ADMIN_UAG_External_Outbound"
    source_groups      = ["${nsxt_policy_group.Admin_VMs.path}"]
    destination_groups = ["${nsxt_policy_group.UAG_external.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.Blast_TCP9443.path}"]
    logged             = true
  }
  rule {
    display_name       = "ADMIN_UAG_Internal_Outbound"
    source_groups      = ["${nsxt_policy_group.Admin_VMs.path}"]
    destination_groups = ["${nsxt_policy_group.UAG_internal.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.Blast_TCP9443.path}"]
    logged             = true
  }
  rule {
    display_name       = "ADMIN_Workspace1_Access_Outbound"
    source_groups      = ["${nsxt_policy_group.Admin_VMs.path}"]
    destination_groups = ["${nsxt_policy_group.Workspace1_Access.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.Blast_TCP8443.path}", "/infra/services/HTTPS", "${nsxt_policy_service.SSL_TCP22.path}"]
    logged             = true
  }
  rule {
    display_name       = "ADMIN_Workspace1_Access_Outbound"
    source_groups      = ["${nsxt_policy_group.Admin_VMs.path}"]
    destination_groups = ["${nsxt_policy_group.Workspace1_Connector.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.Blast_TCP8443.path}", "${nsxt_policy_service.SSL_TCP22.path}"]
    logged             = true
  }
  rule {
    display_name       = "Admin_Horizon_Connection_Server_Outbound"
    source_groups      = ["${nsxt_policy_group.Admin_VMs.path}"]
    destination_groups = ["${nsxt_policy_group.ConnectionServer.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
  rule {
    display_name       = "Admin_Horizon_Connection_Server_Outbound"
    source_groups      = ["${nsxt_policy_group.Admin_VMs.path}"]
    destination_groups = ["/infra/domains/mgw/groups/VCENTER"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
  rule {
    display_name       = "Admin_Microsoft_Remote_Controle"
    source_groups      = ["${nsxt_policy_group.Admin_VMs.path}"]
    destination_groups = ["${nsxt_policy_group.VDI_Clients.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/RDP"]
    logged             = true
  }
  rule {
    display_name       = "Admin_Horizon_AppVol_Outbound"
    source_groups      = ["${nsxt_policy_group.Admin_VMs.path}"]
    destination_groups = ["${nsxt_policy_group.AppVol_MGMT.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
  rule {
    display_name       = "Admin_Horizon_vROPS_Outbound"
    source_groups      = ["${nsxt_policy_group.Admin_VMs.path}"]
    destination_groups = ["${nsxt_policy_group.vROPS.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
  rule {
    display_name       = "Admin_Horizon_Horizon_Cloud_Connector_Outbound"
    source_groups      = ["${nsxt_policy_group.Admin_VMs.path}"]
    destination_groups = ["${nsxt_policy_group.Horizon_Cloud_Connector.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
}

###################### creating Ruleset for Horizon VDI Clients ######################

resource "nsxt_policy_security_policy" "Horizon_VDI_Clients" {
  domain       = "cgw"
  display_name = "Horizon_VDI_Clients"
  description  = "Terraform Horizon_VDI_Clients Ruleset"
  category     = "Environment"

  rule {
    display_name       = "VDI_Clients_Horizon_Connection_Server_Outbound"
    source_groups      = ["${nsxt_policy_group.VDI_Clients.path}"]
    destination_groups = ["${nsxt_policy_group.ConnectionServer.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/LDAP","/infra/services/LDAP-over-SSL", "${nsxt_policy_service.JMS_SSL_TCP4002.path}"]
    logged             = true
  }
  rule {
    display_name       = "VDI_Clients_Horizon_AppVol_Outbound"
    source_groups      = ["${nsxt_policy_group.VDI_Clients.path}"]
    destination_groups = ["${nsxt_policy_group.AppVol_MGMT.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
  rule {
    display_name       = "VDI_Clients_Horizon_vROPS_Outbound"
    source_groups      = ["${nsxt_policy_group.VDI_Clients.path}"]
    destination_groups = ["${nsxt_policy_group.vROPS.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.vROPS_TCP3091.path}", "${nsxt_policy_service.vROPS_TCP3099.path}"]
    logged             = true
  }
  rule {
    display_name       = "VDI_Clients_Horizon_Cloud_Connector_Inbound"
    source_groups      = ["${nsxt_policy_group.VDI_Clients.path}"]
    destination_groups = ["${nsxt_policy_group.Horizon_Cloud_Connector.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.TCP11002.path}"]
    logged             = true
  }
}
/*
  ###################### creating Ruleset for Workspace1_Connector ######################

  resource "nsxt_policy_security_policy" "Workspace1_Connector" {
    domain       = "cgw"
    display_name = "Workspace1_Connector"
    description  = "Terraform Workspace1_Connector Ruleset"
    category     = "Environment"

    rule {
      display_name       = "Workspace_One_Connector_Horizon_Connection_Server_Outbound"
      source_groups      = ["${nsxt_policy_group.Workspace1_Connector.path}"]
      destination_groups = ["${nsxt_policy_group.ConnectionServer.path}"]
      action             = "ALLOW"
      services           = ["/infra/services/HTTPS", "/infra/services/LDAP", "/infra/services/LDAP-over-SSL"]
      logged             = true
    }
    rule {
      display_name       = "Workspace_One_Connector_Workspace_One_Access_Outbound"
      source_groups      = ["${nsxt_policy_group.Workspace1_Connector.path}"]
      destination_groups = ["${nsxt_policy_group.Workspace1_Access.path}"]
      action             = "ALLOW"
      services           = ["/infra/services/HTTPS"]
      logged             = true
    }
}

###################### creating Ruleset for Workspace1_Access ######################

resource "nsxt_policy_security_policy" "Workspace1_Access" {
  domain       = "cgw"
  display_name = "Workspace1_Access"
  description  = "Terraform Workspace1_Access Ruleset"
  category     = "Environment"

  rule {
    display_name       = "Workspace1_Access_Inbound"
    source_groups      = []
    destination_groups = ["${nsxt_policy_group.Workspace1_Access.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
}

*/
###################### creating Ruleset for JMP_Server ######################

resource "nsxt_policy_security_policy" "JMP_Server" {
  domain       = "cgw"
  display_name = "JMP_Server"
  description  = "Terraform JMP_Server Ruleset"
  category     = "Environment"

  rule {
    display_name       = "JMP_Server_AppVol_Outbound"
    source_groups      = ["${nsxt_policy_group.JMP_Server.path}"]
    destination_groups = ["${nsxt_policy_group.AppVol_MGMT.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
  rule {
    display_name       = "JMP_Server_ConnectionServer_Outbound"
    source_groups      = ["${nsxt_policy_group.JMP_Server.path}"]
    destination_groups = ["${nsxt_policy_group.ConnectionServer.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
}

###################### creating Ruleset for AppVolumes ######################

resource "nsxt_policy_security_policy" "AppVolumes" {
  domain       = "cgw"
  display_name = "AppVolumes"
  description  = "Terraform AppVolumes Ruleset"
  category     = "Environment"

  rule {
    display_name       = "AppVol_vCenter_Outbound"
    source_groups      = ["${nsxt_policy_group.AppVol_MGMT.path}"]
    destination_groups = ["/infra/domains/mgw/groups/VCENTER"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
  rule {
    display_name       = "AppVol_ESXi_Outbound"
    source_groups      = ["${nsxt_policy_group.AppVol_MGMT.path}"]
    destination_groups = ["/infra/domains/mgw/groups/ESXI"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
    rule {
    display_name       = "AppVol_Domain_Controller_Outbound"
    source_groups      = ["${nsxt_policy_group.AppVol_MGMT.path}"]
    destination_groups = ["${nsxt_policy_group.Domain_Controller.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/LDAP", "/infra/services/LDAP-over-SSL"]
    logged             = true
  }
    rule {
    display_name       = "AppVol_ESXi_Outbound"
    source_groups      = ["${nsxt_policy_group.AppVol_MGMT.path}"]
    destination_groups = ["${nsxt_policy_group.AppVol_SQL.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/MS-SQL-S"]
    logged             = true
  }
}

###################### creating Ruleset for Horizon_Cloud_Connector ######################

resource "nsxt_policy_security_policy" "Horizon_Cloud_Connector" {
  domain       = "cgw"
  display_name = "Horizon_Cloud_Connector"
  description  = "Terraform Horizon_Cloud_Connector Ruleset"
  category     = "Environment"
  rule {
    display_name       = "Cloud_Connector_ConnectionServer_Outbound"
    source_groups      = ["${nsxt_policy_group.Horizon_Cloud_Connector.path}"]
    destination_groups = ["${nsxt_policy_group.ConnectionServer.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS", "${nsxt_policy_service.JMS_SSL_TCP4002.path}"]
    logged             = true
  }
  rule {
    display_name       = "Cloudconnector_internet"
    source_groups      = ["${nsxt_policy_group.Horizon_Cloud_Connector.path}"]
    destination_groups = []
    action             = "ALLOW"
    services           = ["/infra/services/HTTPS"]
    logged             = true
  }
  rule {
    display_name       = "Cloudconnector_Clients_Inbound"
    source_groups      = ["${nsxt_policy_group.Horizon_Cloud_Connector.path}"]
    destination_groups = ["${nsxt_policy_group.Horizon_Cloud_Connector.path}"]
    destinations_excluded = true
    action             = "ALLOW"
    services           = ["/infra/services/SSH"]
    logged             = true
  }

}

###################### creating Ruleset for Enrollment_Server ######################

resource "nsxt_policy_security_policy" "Enrollment_Server" {
  domain       = "cgw"
  display_name = "Enrollment_Server"
  description  = "Terraform Enrollment_Server Ruleset"
  category     = "Environment"

  rule {
    display_name       = "Enrollment_Server_AD_Cert_Outbound"
    source_groups      = ["${nsxt_policy_group.Enrollment_Server.path}"]
    destination_groups = ["${nsxt_policy_group.AD_cert.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.replica_TCP135.path}"]
    logged             = true
  }
  rule {
    display_name       = "Enrollment_Server_Domain_Controller_Outbound"
    source_groups      = ["${nsxt_policy_group.Enrollment_Server.path}"]
    destination_groups = ["${nsxt_policy_group.Domain_Controller.path}"]
    action             = "ALLOW"
    services           = []
    logged             = true
  }
}