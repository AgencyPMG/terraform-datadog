# Datadog Terraform Module

A [terraform](https://www.terraform.io/) module that sets up a role that
[Datadog](https://www.datadoghq.com/) can use to use to access your account's
details.

See the [Datadog docs](https://docs.datadoghq.com/integrations/aws/) for some
more info.

## Usage

```hcl

module "datadog" {
    source = "github.com/AgencyPMG/terraform-datadog"
    # required. Datadog gives you this value on the AWS integration settings page.
    datadog_external_id = "CHANGME"

    # optional, but probably not going to need to be changed
    datadog_aws_acount = "464622532012"

    # optional, should you want to change the name of the IAM role for Datadog
    role_name = "datadog@yourapp"

    # optional, should you want to change the name of the IAM policy for datadog
    policy_name = "datadog"
}
```

The module will output IAM role and policy ARNs and names.
