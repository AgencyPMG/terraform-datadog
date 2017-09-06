# https://docs.datadoghq.com/integrations/aws/#installation
data "aws_iam_policy_document" "datadog_policy" {
    statement {
        sid = "DatadogReadOnly",
        effect = "Allow"
        resources = ["*"]
        actions = [
            "autoscaling:Describe*",
            "budgets:ViewBudget",
            "cloudtrail:DescribeTrails",
            "cloudtrail:GetTrailStatus",
            "cloudwatch:Describe*",
            "cloudwatch:Get*",
            "cloudwatch:List*",
            "codedeploy:List*",
            "codedeploy:BatchGet*",
            "dynamodb:list*",
            "dynamodb:describe*",
            "ec2:Describe*",
            "ec2:Get*",
            "ecs:Describe*",
            "ecs:List*",
            "elasticache:Describe*",
            "elasticache:List*",
            "elasticfilesystem:DescribeFileSystems",
            "elasticfilesystem:DescribeTags",
            "elasticloadbalancing:Describe*",
            "elasticmapreduce:List*",
            "elasticmapreduce:Describe*",
            "es:ListTags",
            "es:ListDomainNames",
            "es:DescribeElasticsearchDomains",
            "kinesis:List*",
            "kinesis:Describe*",
            "lambda:List*",
            "logs:Get*",
            "logs:Describe*",
            "logs:FilterLogEvents",
            "logs:TestMetricFilter",
            "rds:Describe*",
            "rds:List*",
            "route53:List*",
            "s3:GetBucketTagging",
            "s3:ListAllMyBuckets",
            "ses:Get*",
            "sns:List*",
            "sns:Publish",
            "sqs:ListQueues",
            "support:*",
            "tag:getResources",
            "tag:getTagKeys",
            "tag:getTagValues"
        ]
    }
}

resource "aws_iam_policy" "datadog" {
    name = "${var.policy_name}"
    policy = "${data.aws_iam_policy_document.datadog_policy.json}"
}

data "aws_iam_policy_document" "datadog_role" {
    statement {
        sid = "AllowDatadogAssumeRole"
        effect = "Allow"
        actions = ["sts:AssumeRole"]
        principals {
            type = "AWS"
            identifiers = ["arn:aws:iam::${var.datadog_aws_account}:root"]
        }
        condition {
            test = "StringEquals"
            variable = "sts:ExternalId"
            values = ["${var.datadog_external_id}"]
        }
    }
}

resource "aws_iam_role" "datadog" {
    name = "${var.role_name}"
    assume_role_policy = "${data.aws_iam_policy_document.datadog_role.json}"
}

resource "aws_iam_role_policy_attachment" "datadog" {
    role = "${aws_iam_role.datadog.name}"
    policy_arn = "${aws_iam_policy.datadog.arn}"
}
