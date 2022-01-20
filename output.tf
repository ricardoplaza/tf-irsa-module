output "stylesage_s3_role" {
  description = "Stylesage S3 role arn"
  value       = aws_iam_role.stylesage_s3_role.arn
}