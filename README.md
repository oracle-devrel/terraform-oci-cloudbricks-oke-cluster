# OCI Cloud Bricks: Oracle Container (Kubernetes) Engine (OKE) - Cluster

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-cloudbricks-oke-cluster)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-cloudbricks-oke-cluster)

## Introduction
The following cloud brick enables you to create a decoupled Oracle Kubernetes Engine Cluster associated to a particular compartment and subnets

## Reference Architecture
The following is the reference architecture associated to this brick

![Reference Architecture](./images/Bricks_Architectures-oke_cluster_ref_arch.png)

In this case, you can take advantage of the decoupled nature of the network compartment and the artifact compartment for cost tracking purposes. 


### Prerequisites
- Pre existent Compartment structure
- Pre existent VCN and Subnets

## Notes/Issues
MISSING

## Sample tfvar file
```shell
########## SAMPLE TFVAR FILE ##########
########## PROVIDER SPECIFIC VARIABLES ##########
region           = "foo-region-1"
tenancy_ocid     = "ocid1.tenancy.oc1..abcdefg"
user_ocid        = "ocid1.user.oc1..aaaaaaabcdefg"
fingerprint      = "fo:oo:ba:ar:ba:ar"
private_key_path = "/absolute/path/to/api/key/your_api_key.pem"
########## PROVIDER SPECIFIC VARIABLES ##########

########## ARTIFACT SPECIFIC VARIABLES ##########
oke_instance_compartment_name     = "MY_ARTIFACT_COMPARTMENT"
oke_network_compartment_name      = "MY_NETWORK_COMPARTMENT"
oke_vcn_display_name              = "MY_VCN"
oke_lbaas_network_subnet_name     = "My_Public_Subnet"
oke_endpoint_subnet_name          = "My_Public_Subnet"
oke_endpoint_is_public_ip_enabled = true
oke_availability_domain_map       = { "ad1" : "aBCD:foo-REGION-1-AD-1", "ad2" : "aBCD:foo-REGION-1-AD-2" , "ad2" : "aBCD:foo-REGION-1-AD-3" }
cluster_name                      = "my_k8_cluster"
k8s_version                       = "vX.Y.Z"
k8s_dashboard_enabled             = true
k8s_tiller_enabled                = true
########## ARTIFACT SPECIFIC VARIABLES ##########

########## SAMPLE TFVAR FILE ##########
```

### Variable specific considerations
- Different compartments for both Network and Artifact can be used. These can be the same as well. Provide it's corresponding Display Name in the corresponding variables `oke_instance_compartment_name` and `oke_network_compartment_name` 
- The OKE Cluster Control Plane, can be either public or private. In order to make it public, ise the variable `oke_endpoint_is_public_ip_enabled` to `true` and use a public subnet under variable `oke_endpoint_subnet_name`
- Is possible to use as many AD as are available on the region currently in use. These can be passed on separated by commas and enclosed by double quotes as above example
- The cluster version can be determined by the [following link](https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengaboutk8sversions.htm)
- If Dashboard is required upon creation set the variable `k8s_dashboard_enabled` to `true`
- If Tiller is required upon creation set the variable `k8s_tiller_enabled` to `true`

## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2021 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE) for more details.
