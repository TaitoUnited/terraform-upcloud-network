# UpCloud network

Example usage:

```
provider "upcloud" {
}

module "network" {
  source       = "TaitoUnited/network/upcloud"
  version      = "0.0.1"

  network      = yamldecode(file("${path.root}/../infra.yaml"))["network"]
}
```

Example YAML:

```
# See: https://registry.terraform.io/modules/TaitoUnited/network/upcloud

network:
  name: my-network
  zone: fi-hel2
  natEnabled: true
  ipCidrRange: 172.16.2.0/24
```

Combine with the following modules to get a complete infrastructure defined by YAML:

- [Admin](https://registry.terraform.io/modules/TaitoUnited/admin/upcloud)
- [DNS](https://registry.terraform.io/modules/TaitoUnited/dns/upcloud)
- [Network](https://registry.terraform.io/modules/TaitoUnited/network/upcloud)
- [Compute](https://registry.terraform.io/modules/TaitoUnited/compute/upcloud)
- [Kubernetes](https://registry.terraform.io/modules/TaitoUnited/kubernetes/upcloud)
- [Databases](https://registry.terraform.io/modules/TaitoUnited/databases/upcloud)
- [Storage](https://registry.terraform.io/modules/TaitoUnited/storage/upcloud)
- [Monitoring](https://registry.terraform.io/modules/TaitoUnited/monitoring/upcloud)
- [Integrations](https://registry.terraform.io/modules/TaitoUnited/integrations/upcloud)
- [PostgreSQL privileges](https://registry.terraform.io/modules/TaitoUnited/privileges/postgresql)
- [MySQL privileges](https://registry.terraform.io/modules/TaitoUnited/privileges/mysql)

TIP: Similar modules are also available for AWS, Azure, and DigitalOcean. All modules are used by [infrastructure templates](https://taitounited.github.io/taito-cli/templates#infrastructure-templates) of [Taito CLI](https://taitounited.github.io/taito-cli/). See also [UpCloud Cloud project resources](https://registry.terraform.io/modules/TaitoUnited/project-resources/upcloud), [Full Stack Helm Chart](https://github.com/TaitoUnited/taito-charts/blob/master/full-stack), and [full-stack-template](https://github.com/TaitoUnited/full-stack-template).

Contributions are welcome!
