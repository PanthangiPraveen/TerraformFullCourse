resource "aws_route53_zone" "dev_zone" {
  name = var.domain_name
}

resource "aws_iam_role" "ec2_dns_role" {
  name = "ec2-dns-updater-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "://amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy" "dns_policy" {
  role = aws_iam_role.ec2_dns_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["route53:ChangeResourceRecordSets"]
      Resource = "arn:aws:route53:::hostedzone/${aws_route53_zone.dev_zone.zone_id}"
    }]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-dns-profile"
  role = aws_iam_role.ec2_dns_role.name
}

resource "aws_instance" "dev_vm" {
  ami                  = "ami-0c7217cdde317cfec" # Amazon Linux 2023
  instance_type        = "t3.medium"
  
  # FIX: Changed 'instance_profile' to 'iam_instance_profile'
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  # MIME Multi-part template to force User Data execution on EVERY stop/start cycle
  user_data = <<EOF
Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="aws_startup.sh"

${templatefile("${path.module}/aws_startup.sh", { ZONE_ID = aws_route53_zone.dev_zone.zone_id, DOMAIN_NAME = var.domain_name })}
--//--
EOF

  tags = {
    Environment = "Dev"
    Schedule    = "true"
  }

  depends_on = [
    aws_iam_instance_profile.ec2_profile,
    aws_iam_role_policy.dns_policy
  ]
}
