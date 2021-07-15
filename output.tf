# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: Purpose: The following file defines the output for oke_cluster brick

output "cluster" {
  description = "OKE Cluster details"
  value = {
    id                 = oci_containerengine_cluster.oke_cluster.id
    kubernetes_version = oci_containerengine_cluster.oke_cluster.kubernetes_version
    name               = oci_containerengine_cluster.oke_cluster.name
  }
}

output "oke_instance" {
  description = "OKE Cluster Object for integration purposes"
  value       = oci_containerengine_cluster.oke_cluster
}