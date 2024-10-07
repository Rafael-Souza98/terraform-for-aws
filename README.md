# terraform-for-aws
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) |  >= 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.15.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.32.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster_eks"></a> [cluster\_eks](#module\_cluster\_eks) | ./modules/cluster-eks | n/a |
| <a name="module_eks-lb-controller"></a> [eks-lb-controller](#module\_eks-lb-controller) | ./modules/aws-load-balancer-controller | n/a |
| <a name="module_manage_node_group"></a> [manage\_node\_group](#module\_manage\_node\_group) | ./modules/node-group | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_vpc"></a> [cidr\_vpc](#input\_cidr\_vpc) | CIDR da VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | Instance types EC2 of EKS | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do projeto | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_certificate_authority"></a> [cluster\_certificate\_authority](#output\_cluster\_certificate\_authority) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_eks_sg_id"></a> [eks\_sg\_id](#output\_eks\_sg\_id) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | n/a |
<!-- END_TF_DOCS -->