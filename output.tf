output "ricardoplaza_s3_role" {
  description = "ricardoplaza S3 role arn"
  value       = aws_iam_role.ricardoplaza_s3_role.arn
}