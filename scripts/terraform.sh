#!/bin/bash
set -e

minor_version=$1

# Install InfraCost to get cost views
curl -s -L https://github.com/infracost/infracost/releases/latest/download/infracost-linux-amd64.tar.gz | \
    tar xz -C /tmp && \
    mv /tmp/infracost-linux-amd64 /bin/infracost

# Install Latest Minor Version of Terraform
latest_patch_version=$(curl -s "https://api.github.com/repos/hashicorp/terraform/releases?per_page=200" | jq -r '.[].tag_name' | grep "v$minor_version" | sort -V | tail -1 | tr -d \"\,\v )
echo "Downloading version: $latest_patch_version"
wget "https://releases.hashicorp.com/terraform/${latest_patch_version}/terraform_${latest_patch_version}_linux_amd64.zip"
unzip "terraform_${latest_patch_version}_linux_amd64.zip"
mv terraform /bin/terraform

# Clear Local Downloads
rm -rf ./*
