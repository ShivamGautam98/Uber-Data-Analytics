module "prisma_policy_EnsureComposerImageVersion" {
    source = "./modules/prisma_policy"

    policy_name = "EnsureComposerImageVersion"
    policy_desc = "This policy is to ensure that only approved hardened image version is used for Cloud Composer environment"
    policy_label = "Resource Misuse"
    policy_section_name = "ComputeSection 712"
    policy_section_desc = "Example to check if non-approved hardened image version is used for Cloud Composer environment"
    policy_search_type = "Config"
    rql_search = "config from cloud.resource where api.name = 'gcloud-composer-environment' AND json.rule = config.softwareConfig.imageVersion is not member of ('composer-1.17.5-airflow-1.10.15')"

    module_depends_on = [prismacloud_compliance_standard_requirement.examplegcpcompute]
    csr_id = prismacloud_compliance_standard_requirement.examplegcpcompute.csr_id
    branchname = var.branchname
    hex_id = random_id.id.hex
}


output "Search_ID_EnsureComposerImageVersion" {
  value = module.prisma_policy_EnsureComposerImageVersion.search_id 
}
output "Policy_ID_EnsureComposerImageVersion" {
  value = module.prisma_policy_EnsureComposerImageVersion.policy_id
}