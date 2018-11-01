//--------------------------------------------------------------------
// Resources

resource "aws_iam_role" "vault" {
  name               = "${var.environment_name}-vault-role"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role.json}"
}

resource "aws_iam_role_policy" "vault" {
  name   = "${var.environment_name}-vault-role-policy"
  role   = "${aws_iam_role.vault.id}"
  policy = "${data.aws_iam_policy_document.vault.json}"
}

resource "aws_iam_instance_profile" "vault" {
  name = "${var.environment_name}-vault-instance-profile"
  role = "${aws_iam_role.vault.name}"
}

//--------------------------------------------------------------------
// Data Sources

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "vault" {
  statement {
    sid    = "ConsulAutoJoin"
    effect = "Allow"

    actions = ["ec2:DescribeInstances"]

    resources = ["*"]
  }

  statement {
    sid    = "VaultAWSAuthMethod"
    effect = "Allow"
    actions = [
      "ec2:DescribeInstances",
      "iam:GetInstanceProfile",
      "iam:GetUser",
      "iam:GetRole"
    ],
    resources = ["*"]
  }
}
