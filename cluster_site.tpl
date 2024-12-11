${jsonencode(
{
   
    "lab": {
        "logscale_digest_node_count": 1
        "logscale_digest_instance_type": "i3.large",
        "logscale_digest_root_disk_type": "gp2",
        "logscale_digest_root_disk_size": 20,
        "logscale_digest_data_disk_type": "gp2",
        "logscale_digest_data_disk_size": "100Gi",
        "logscale_digest_min_node_count": 1,
        "logscale_digest_max_node_count": 1,
        "logscale_digest_desired_node_count": 1
        "logscale_digest_resources": {"limits": {"cpu": 1, "memory": "7Gi"}, "requests": {"cpu": 1, "memory": "7Gi"}},

        "logscale_ingress_node_count": 1,
        "logscale_ingress_instance_type": "i3.large",
        "logscale_ingress_root_disk_size": 20,
        "logscale_ingress_root_disk_type": "gp2",
        "logscale_ingress_data_disk_type": "gp2",
        "logscale_ingress_data_disk_size": "100Gi",
        "logscale_ingress_min_node_count": 1,
        "logscale_ingress_max_node_count": 1,
        "logscale_ingress_desired_node_count": 1,
        "logscale_ingress_resources": {"limits": {"cpu": 1, "memory": "7Gi"}, "requests": {"cpu": 1, "memory": "7Gi"}},

        "logscale_ingest_node_count": 1,
        "logscale_ingest_instance_type": "i3.large",
        "logscale_ingest_root_disk_type": "gp2",
        "logscale_ingest_root_disk_size": 20,
        "logscale_ingest_data_disk_type": "gp2",
        "logscale_ingest_data_disk_size": "100Gi",
        "logscale_ingest_min_node_count": 1,
        "logscale_ingest_max_node_count": 1,
        "logscale_ingest_desired_node_count": 1,
        "logscale_ingest_resources": {"limits": {"cpu": 1, "memory": "7Gi"}, "requests": {"cpu": 1, "memory": "7Gi"}},

        "logscale_ui_node_count": 1,
        "logscale_ui_instance_type": "i3.large",
        "logscale_ui_instance_type": "i3.large",
        "logscale_ui_root_disk_type": "gp2",
        "logscale_ui_root_disk_size": 20,
        "logscale_ui_data_disk_type": "gp2",
        "logscale_ui_data_disk_size": "100Gi",
        "logscale_ui_min_node_count": 1,
        "logscale_ui_max_node_count": 1,
        "logscale_ui_desired_node_count": 1,
        "logscale_ui_resources": {"limits": {"cpu": 1, "memory": "7Gi"}, "requests": {"cpu": 1, "memory": "7Gi"}},

        "kafka_broker_node_count": 3,
        "kafka_broker_node_count": 3,
        "kafka_broker_instance_type": "kafka.m5.large",
        "kafka_broker_min_node_count": 1,
        "kafka_broker_max_node_count": 3,
        "kafka_broker_data_disk_type": "gp2",
        "kafka_broker_data_disk_size": 152,
    },
    "xsmall": {
        "logscale_digest_node_count": 3,
        "logscale_digest_instance_type": "i4i.2xlarge",
        "logscale_digest_root_disk_type": "gp2",
        "logscale_digest_root_disk_size": 20,
        "logscale_digest_data_disk_type": "gp2",
        "logscale_digest_data_disk_size": "3000Gi",
        "logscale_digest_min_node_count": 1,
        "logscale_digest_max_node_count": 3,
        "logscale_digest_desired_node_count": 3
        "logscale_digest_resources": {"limits": {"cpu": 7, "memory": "30Gi"}, "requests": {"cpu": 7, "memory": "30Gi"}},

        "logscale_ingress_node_count": 3,
        "logscale_ingress_instance_type": "c5.xlarge",
        "logscale_ingress_root_disk_size": 20,
        "logscale_ingress_root_disk_type": "gp2",
        "logscale_ingress_data_disk_type": "gp2",
        "logscale_ingress_data_disk_size": "128Gi",
        "logscale_ingress_min_node_count": 1,
        "logscale_ingress_max_node_count": 3,
        "logscale_ingress_desired_node_count": 3,
        "logscale_ingress_resources": {"limits": {"cpu": 3, "memory": "6Gi"}, "requests": {"cpu": 3, "memory": "6Gi"}},

        "logscale_ingest_node_count": 3,
        "logscale_ingest_instance_type": "c5.xlarge",
        "logscale_ingest_root_disk_type": "gp2",
        "logscale_ingest_root_disk_size": 20,
        "logscale_ingest_data_disk_type": "gp2",
        "logscale_ingest_data_disk_size": "128Gi",
        "logscale_ingest_min_node_count": 1,
        "logscale_ingest_max_node_count": 3,
        "logscale_ingest_desired_node_count": 3,
        "logscale_ingest_resources": {"limits": {"cpu": 3, "memory": "6Gi"}, "requests": {"cpu": 3, "memory": "6Gi"}},

        "logscale_ui_node_count": 3,
        "logscale_ui_instance_type": "c5.xlarge",
        "logscale_ui_root_disk_type": "gp2",
        "logscale_ui_root_disk_size": 20,
        "logscale_ui_data_disk_type": "gp2",
        "logscale_ui_data_disk_size": "128Gi",
        "logscale_ui_min_node_count": 1,
        "logscale_ui_max_node_count": 3,
        "logscale_ui_desired_node_count": 3,
        "logscale_ui_resources": {"limits": {"cpu": 3, "memory": "6Gi"}, "requests": {"cpu": 3, "memory": "6Gi"}},

        "kafka_broker_node_count": 3,
        "kafka_broker_instance_type": "kafka.m5.large",
        "kafka_broker_min_node_count": 1,
        "kafka_broker_max_node_count": 3,
        "kafka_broker_data_disk_type": "gp2",
        "kafka_broker_data_disk_size": 152,
    },
}
)}