#!/bin/bash

# Script to install Terraform on Ubuntu 24.04

echo "Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing required dependencies..."
sudo apt install -y gnupg software-properties-common wget

echo "Adding the HashiCorp GPG key..."
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "Adding the HashiCorp APT repository..."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

echo "Updating package list..."
sudo apt update

echo "Installing Terraform..."
sudo apt install -y terraform

echo "Verifying Terraform installation..."
terraform -v

if [ $? -eq 0 ]; then
    echo "Terraform installation was successful!"
else
    echo "Terraform installation failed. Please check for errors."
fi
