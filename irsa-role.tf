
## ricardoplaza S3 Policy
resource "aws_iam_policy" "ricardoplaza_s3" {
  name        = "ricardoplaza_s3_policy"
  path        = "/"
  description = "ricardoplaza S3 policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::ricardoplaza",
        "arn:aws:s3:::ricardoplaza/*"
      ]
    },
    {
      "Action": "s3:HeadBucket",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "ricardoplaza_s3_role" {
  name                  = "${var.s3_role_name[terraform.workspace]}"
  force_detach_policies = true

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam:::oidc-provider/oidc.eks.${var.aws_region[terraform.workspace]}.amazonaws.com/id/${var.aws_account[terraform.workspace]}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "oidc.eks.${var.aws_region[terraform.workspace]}.amazonaws.com/id/${var.aws_account[terraform.workspace]}:sub": "system:serviceaccount:${var.oidc_serviceAccount[terraform.workspace]}"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "ricardoplaza_S3RolePolicy" {
  policy_arn = aws_iam_policy.ricardoplaza_s3.arn
  role       = aws_iam_role.ricardoplaza-s3-role.name
}