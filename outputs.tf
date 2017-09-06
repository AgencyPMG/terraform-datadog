output "role_arn" {
    value = "${aws_iam_role.datadog.arn}"
}

output "role_name" {
    value = "${aws_iam_role.datadog.name}"
}

output "policy_arn" {
    value = "${aws_iam_policy.datadog.arn}"
}

output "policy_name" {
    value = "${aws_iam_policy.datadog.name}"
}
