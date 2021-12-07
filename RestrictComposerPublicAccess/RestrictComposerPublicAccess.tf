module "prisma_policy_RestrictComposerPublicAccess" {
    source = "./modules/prisma_policy"

    policy_name = "RestrictComposerPublicAccess"
    policy_desc = "This policy is to ensure that GKE endpoint is Not Publicly accessible for Cloud Composer"
    policy_label = "Resource Misuse"
    policy_section_name = "ComputeSection 711"
    policy_section_desc = "Example to check if GKE endpoint is Publicly accessible for Cloud Composer"
    policy_search_type = "Config"
    rql_search = "config from cloud.resource where api.name = 'gcloud-composer-environment' AND json.rule = config.privateEnvironmentConfig.privateClusterConfig.enablePrivateEndpoint is false"

    module_depends_on = [prismacloud_compliance_standard_requirement.examplegcpcompute]
    csr_id = prismacloud_compliance_standard_requirement.examplegcpcompute.csr_id
    branchname = var.branchname
    hex_id = random_id.id.hex
}


output "Search_ID_RestrictComposerPublicAccess" {
  value = module.prisma_policy_RestrictComposerPublicAccess.search_id 
}
output "Policy_ID_RestrictComposerPublicAccess" {
  value = module.prisma_policy_RestrictComposerPublicAccess.policy_id
}