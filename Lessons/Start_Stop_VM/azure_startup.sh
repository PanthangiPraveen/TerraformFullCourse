#!/bin/bash
RESOURCE_GROUP="dev-dns-rg"
ZONE_NAME="${ZONE_NAME}"
RECORD_NAME="azure-dev"

# Login to Azure CLI using VM's System Managed Identity
az login --identity

# Fetch Public IP from Azure Instance Metadata Service (IMDS)
PUBLIC_IP=$(curl -s -H Metadata:true "http://169.254.169" | jq -r '.publicIpAddress')

# Update the Record Set
az network dns record-set a add-record \
  --resource-group $RESOURCE_GROUP \
  --zone-name $ZONE_NAME \
  --record-set-name $RECORD_NAME \
  --ipv4-address $PUBLIC_IP \
  --ttl 60
