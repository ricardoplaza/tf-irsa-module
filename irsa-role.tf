
## Stylesage S3 Policy
resource "aws_iam_policy" "stylesage_s3" {
  name        = "stylesage_s3_policy"
  path        = "/"
  description = "StyleSage S3 policy"

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
        "arn:aws:s3:::stylesage",
        "arn:aws:s3:::stylesage/*"
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

resource "aws_iam_role" "stylesage_s3_role" {
  name                  = "stylesage-s3-role"
  force_detach_policies = true

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::000000000:oidc-provider/oidc.eks.eu-west-1.amazonaws.com/id/0000000000000000000"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "oidc.eks.eu-west-1.amazonaws.com/id/000000000000000000000000:sub": "system:serviceaccount:stylesage:microservice"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "stylesage_S3RolePolicy" {
  policy_arn = aws_iam_policy.stylesage_s3.arn
  role       = aws_iam_role.stylesage-s3-role.name
}