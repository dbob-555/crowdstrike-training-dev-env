locals {
  eks_managed_node_groups = lookup({
    "internal-ingest" = {
      logscale_node_group_az_1 = local.logscale_node_group_az_1
      logscale_node_group_az_2 = local.logscale_node_group_az_2
      logscale_node_group_az_3 = local.logscale_node_group_az_3
      logscale_ingest_node_group_az_1 = local.logscale_ingest_node_group_az_1
      logscale_ingest_node_group_az_2 = local.logscale_ingest_node_group_az_2
      logscale_ingest_node_group_az_3 = local.logscale_ingest_node_group_az_3
      logscale_ui_node_group_az_1     = local.logscale_ui_node_group_az_1
      logscale_ui_node_group_az_2     = local.logscale_ui_node_group_az_2
      logscale_ui_node_group_az_3     = local.logscale_ui_node_group_az_3
    }
  }, var.logscale_cluster_type, {})
  # Commons
  common_labels = {
    managed_by = "terraform"
    "logscale.io/name" = "humio"
  }
  common_properties = {
    use_name_prefix = true
    ami_type        = var.ami_type
    vpc_security_group_ids = [
      module.eks.node_security_group_id,
      var.msk_sg_id
    ]
    block_device_mappings = {
      xvda = {
        device_name = "/dev/xvda"
        ebs = {
          volume_size           = var.logscale_node_root_volume_size
          volume_type           = var.logscale_node_root_volume_type
          delete_on_termination = true
        }
      }
    }
    iam_role_additional_policies = {
      "ssm_managed_core" = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    }
    timeouts = {
      delete = "1h"
    }
  }
  # Basic cluster node group
  logscale_node_group_az_1 = merge(local.common_properties, {
    name = "logscale-digest-1"
    min_size     = var.logscale_node_min_capacity
    max_size     = var.logscale_node_max_capacity
    desired_size = var.logscale_node_desired_capacity
    subnet_ids   = [var.private_subnets[0]]
    instance_types = [var.logscale_instance_type]
    pre_bootstrap_user_data = templatefile("${path.module}/${var.user_data_script}", {
      humio_data_dir            = var.humio_data_dir,
      humio_data_dir_owner_uuid = var.humio_data_dir_owner_uuid
    })
    labels = merge(local.common_labels, {
      k8s-app      = "logscale"
      storageclass = "nvme"
    })
  })
  logscale_node_group_az_2 = merge(local.common_properties, {
    name = "logscale-digest-2"
    min_size     = var.logscale_node_min_capacity
    max_size     = var.logscale_node_max_capacity
    desired_size = var.logscale_node_desired_capacity
    subnet_ids   = [var.private_subnets[1]]
    instance_types = [var.logscale_instance_type]
    pre_bootstrap_user_data = templatefile("${path.module}/${var.user_data_script}", {
      humio_data_dir            = var.humio_data_dir,
      humio_data_dir_owner_uuid = var.humio_data_dir_owner_uuid
    })
    labels = merge(local.common_labels, {
      k8s-app      = "logscale"
      storageclass = "nvme"
    })
  })  
  logscale_node_group_az_3 = merge(local.common_properties, {
    name = "logscale-digest-3"
    min_size     = var.logscale_node_min_capacity
    max_size     = var.logscale_node_max_capacity
    desired_size = var.logscale_node_desired_capacity
    subnet_ids   = [var.private_subnets[2]]
    instance_types = [var.logscale_instance_type]
    pre_bootstrap_user_data = templatefile("${path.module}/${var.user_data_script}", {
      humio_data_dir            = var.humio_data_dir,
      humio_data_dir_owner_uuid = var.humio_data_dir_owner_uuid
    })
    labels = merge(local.common_labels, {
      k8s-app      = "logscale"
      storageclass = "nvme"
    })
  })  
  logscale_ingest_node_group_az_1 = merge(local.common_properties, {
    name = "logscale-ingest-1"
    subnet_ids   = [var.private_subnets[0]]
    min_size     = var.ingest_node_min_capacity
    max_size     = var.ingest_node_max_capacity
    desired_size = var.ingest_node_desired_capacity
    instance_types = [var.ingest_instance_type]
    block_device_mappings = {
      xvda = {
        device_name = "/dev/xvda"
        ebs = {
          volume_size           = var.logscale_ingest_root_disk_size
          volume_type           = var.logscale_ingest_root_disk_type
          delete_on_termination = true
        }
      }
      xvdb = {
        device_name = "/dev/xvdb"
        ebs = {
          volume_size           = trimsuffix(var.logscale_ingest_data_disk_size, "Gi")
          volume_type           = var.logscale_ingest_data_disk_type
          delete_on_termination = true
        }
      }
    }
    labels = merge(local.common_labels, {
      k8s-app = "logscale-ingest"
    })
  })
  logscale_ingest_node_group_az_2 = merge(local.common_properties, {
    name = "logscale-ingest-2"
    subnet_ids   = [var.private_subnets[1]]
    min_size     = var.ingest_node_min_capacity
    max_size     = var.ingest_node_max_capacity
    desired_size = var.ingest_node_desired_capacity
    instance_types = [var.ingest_instance_type]
    block_device_mappings = {
      xvda = {
        device_name = "/dev/xvda"
        ebs = {
          volume_size           = var.logscale_ingest_root_disk_size
          volume_type           = var.logscale_ingest_root_disk_type
          delete_on_termination = true
        }
      }
      xvdb = {
        device_name = "/dev/xvdb"
        ebs = {
          volume_size           = trimsuffix(var.logscale_ingest_data_disk_size, "Gi")
          volume_type           = var.logscale_ingest_data_disk_type
          delete_on_termination = true
        }
      }
    }
    labels = merge(local.common_labels, {
      k8s-app = "logscale-ingest"
    })
  })
  logscale_ingest_node_group_az_3 = merge(local.common_properties, {
    name = "logscale-ingest-3"
    subnet_ids   = [var.private_subnets[2]]
    min_size     = var.ingest_node_min_capacity
    max_size     = var.ingest_node_max_capacity
    desired_size = var.ingest_node_desired_capacity
    instance_types = [var.ingest_instance_type]
    block_device_mappings = {
      xvda = {
        device_name = "/dev/xvda"
        ebs = {
          volume_size           = var.logscale_ingest_root_disk_size
          volume_type           = var.logscale_ingest_root_disk_type
          delete_on_termination = true
        }
      }
      xvdb = {
        device_name = "/dev/xvdb"
        ebs = {
          volume_size           = trimsuffix(var.logscale_ingest_data_disk_size, "Gi")
          volume_type           = var.logscale_ingest_data_disk_type
          delete_on_termination = true
        }
      }
    }
    labels = merge(local.common_labels, {
      k8s-app = "logscale-ingest"
    })
  })
  logscale_ui_node_group_az_1 = merge(local.common_properties, {
    name = "logscale-ui-1"
    subnet_ids   = [var.private_subnets[0]]
    min_size     = var.ui_node_min_capacity
    max_size     = var.ui_node_max_capacity
    desired_size = var.ui_node_desired_capacity
    instance_types = [var.ui_instance_type]
    block_device_mappings = {
      xvda = {
        device_name = "/dev/xvda"
        ebs = {
          volume_size           = var.logscale_ui_root_disk_size
          volume_type           = var.logscale_ui_root_disk_type
          delete_on_termination = true
        }
      }
      xvdb = {
        device_name = "/dev/xvdb"
        ebs = {
          volume_size           = trimsuffix(var.logscale_ui_data_disk_size, "Gi")
          volume_type           = var.logscale_ui_data_disk_type
          delete_on_termination = true
        }
      }
    }
    labels = merge(local.common_labels, {
      k8s-app = "logscale-ui"
    })
  })
logscale_ui_node_group_az_2 = merge(local.common_properties, {
    name = "logscale-ui-2"
    subnet_ids   = [var.private_subnets[1]]
    min_size     = var.ui_node_min_capacity
    max_size     = var.ui_node_max_capacity
    desired_size = var.ui_node_desired_capacity
    instance_types = [var.ui_instance_type]
    block_device_mappings = {
      xvda = {
        device_name = "/dev/xvda"
        ebs = {
          volume_size           = var.logscale_ui_root_disk_size
          volume_type           = var.logscale_ui_root_disk_type
          delete_on_termination = true
        }
      }
      xvdb = {
        device_name = "/dev/xvdb"
        ebs = {
          volume_size           = trimsuffix(var.logscale_ui_data_disk_size, "Gi")
          volume_type           = var.logscale_ui_data_disk_type
          delete_on_termination = true
        }
      }
    }
    labels = merge(local.common_labels, {
      k8s-app = "logscale-ui"
    })
  })
logscale_ui_node_group_az_3 = merge(local.common_properties, {
    name = "logscale-ui-3"
    subnet_ids   = [var.private_subnets[2]]
    min_size     = var.ui_node_min_capacity
    max_size     = var.ui_node_max_capacity
    desired_size = var.ui_node_desired_capacity
    instance_types = [var.ui_instance_type]
    block_device_mappings = {
      xvda = {
        device_name = "/dev/xvda"
        ebs = {
          volume_size           = var.logscale_ui_root_disk_size
          volume_type           = var.logscale_ui_root_disk_type
          delete_on_termination = true
        }
      }
      xvdb = {
        device_name = "/dev/xvdb"
        ebs = {
          volume_size           = trimsuffix(var.logscale_ui_data_disk_size, "Gi")
          volume_type           = var.logscale_ui_data_disk_type
          delete_on_termination = true
        }
      }
    }
    labels = merge(local.common_labels, {
      k8s-app = "logscale-ui"
    })
  })
}
