# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# oke.tf
#
# Purpose: The following script defines the creation of an Oracle Kubernetes Engine Cluster
# Registry entry can be found on the following link: https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/containerengine_cluster


resource "oci_containerengine_cluster" "oke_cluster" {
  #Required
  compartment_id     = local.compartment_id
  kubernetes_version = var.k8s_version
  name               = var.cluster_name
  vcn_id             = local.vcn_id

  endpoint_config {
    is_public_ip_enabled = var.oke_endpoint_is_public_ip_enabled
    subnet_id            = local.nodepool_subnet_ocid
  }

  options {

    #Optional
    add_ons {
      #Optional
      is_kubernetes_dashboard_enabled = var.k8s_dashboard_enabled
      is_tiller_enabled               = var.k8s_tiller_enabled
    }

    service_lb_subnet_ids = ["${local.lbaas_subnet_ocid}"]
  }
}