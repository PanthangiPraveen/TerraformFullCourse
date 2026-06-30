#!/bin/bash
ZONE_ID="${ZONE_ID}"
RECORD_NAME="aws-dev.${DOMAIN_NAME}"

# Fetch IMDSv2 Token and Public IP
TOKEN=$(curl -s -X PUT "http://169.254.169" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
PUBLIC_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169)

# Generate JSON payload for Route 53
cat <<EOF > /tmp/route53_update.json
{
  "Comment": "Auto-updated on Monday boot",
  "Changes": [{
    "Action": "UPSERT",
    "ResourceRecordSet": {
      "Name": "$RECORD_NAME",
      "Type": "A",
      "TTL": 60,
      "ResourceRecords": [{"Value": "$PUBLIC_IP"}]
    }
  }]
}
EOF

# Update Route 53 Zone
aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID --change-batch file:///tmp/route53_update.json
