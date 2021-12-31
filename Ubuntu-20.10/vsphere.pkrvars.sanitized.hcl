#Rename this to vsphere.pkvars.hcl and fill out secure info.

##################################################################################
# VARIABLES
##################################################################################

# Credentials

vcenter_username                = ""
vcenter_password                = ""
ssh_username                    = "ubuntu"
ssh_password                    = "ubuntu"

# vSphere Objects

vcenter_insecure_connection     = true
vcenter_server                  = ""
vcenter_datacenter              = ""
vcenter_host                    = ""
vcenter_datastore               = ""
vcenter_network                 = ""
vcenter_folder                  = ""

# ISO Objects
iso_path                        = ""