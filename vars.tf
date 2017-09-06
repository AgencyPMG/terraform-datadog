variable "policy_name" {
    default = "DatadogAWSIntegrationPolicy"
    description = "The name for the IAM policy created to give Datadog permissions"
}

variable "role_name" {
    default = "DatadogAWSIntegrationRole"
    description = "The name for the cross-account role Datadog will use to access your account"
}

variable "datadog_aws_account" {
    default = "464622532012"
    description = "The ID of Datadog's AWS account"
}

variable "datadog_external_id" {
    type = "string"
    description = "The external ID datadog gives you for the cross-account role"
}
