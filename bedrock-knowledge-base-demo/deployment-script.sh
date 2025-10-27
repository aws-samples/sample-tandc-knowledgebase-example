#!/bin/bash

# AWS AI Practitioner Demo - Bedrock Knowledge Base Deployment Script
# This script automates the deployment of the demo environment

set -e

echo "🚀 Starting Bedrock Knowledge Base Demo Deployment"

# Check if AWS CLI is configured
if ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "❌ AWS CLI not configured. Please run 'aws configure' first."
    exit 1
fi

# Get current IP address
echo "🔍 Getting your current IP address..."
CURRENT_IP=$(curl -s https://checkip.amazonaws.com)
if [ -z "$CURRENT_IP" ]; then
    echo "❌ Could not determine your IP address. Please enter it manually:"
    read -p "Enter your IP address (format: x.x.x.x): " CURRENT_IP
fi
echo "✅ Using IP address: $CURRENT_IP/32"

# Get AWS Account ID
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
echo "✅ AWS Account ID: $ACCOUNT_ID"

# Set variables
STACK_NAME="bedrock-demo-stack"
REGION="us-east-1"
BUCKET_NAME="bedrock-kb-docs-${ACCOUNT_ID}-INT"

echo "📋 Deployment Configuration:"
echo "   Stack Name: $STACK_NAME"
echo "   Region: $REGION"
echo "   S3 Bucket: $BUCKET_NAME"
echo "   IP Address: $CURRENT_IP/32"

# Confirm deployment
read -p "🤔 Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Deployment cancelled."
    exit 1
fi

# Deploy CloudFormation stack
echo "☁️ Deploying CloudFormation stack..."
aws cloudformation deploy \
    --template-file cloudformation/bedrock-kb-demo.yaml \
    --stack-name $STACK_NAME \
    --parameter-overrides MyIPAddress=$CURRENT_IP/32 \
    --capabilities CAPABILITY_NAMED_IAM \
    --region $REGION

if [ $? -eq 0 ]; then
    echo "✅ CloudFormation stack deployed successfully!"
else
    echo "❌ CloudFormation deployment failed!"
    exit 1
fi

# Upload sample documents to S3
echo "📄 Uploading sample documents to S3..."
aws s3 cp sample-documents/ s3://$BUCKET_NAME/ --recursive --region $REGION

if [ $? -eq 0 ]; then
    echo "✅ Sample documents uploaded successfully!"
else
    echo "❌ Failed to upload sample documents!"
    exit 1
fi

# Get stack outputs
echo "📊 Getting deployment information..."
WEB_URL=$(aws cloudformation describe-stacks \
    --stack-name $STACK_NAME \
    --region $REGION \
    --query 'Stacks[0].Outputs[?OutputKey==`WebsiteURL`].OutputValue' \
    --output text)

echo ""
echo "🎉 Deployment Complete!"
echo "=================================="
echo "Web Application URL: $WEB_URL"
echo "S3 Bucket: $BUCKET_NAME"
echo ""
echo "📝 Next Steps:"
echo "1. Wait 2-3 minutes for EC2 instance to fully initialize"
echo "2. Open the Web Application URL in your browser"
echo "3. Follow the console guide to create the Knowledge Base"
echo "4. Test the application with different AI parameters"
echo ""
echo "🔧 Troubleshooting:"
echo "- If web app doesn't load, check Security Group allows your IP"
echo "- Check CloudFormation Events tab for any deployment issues"
echo "- Verify Bedrock model access in your AWS account"
echo ""
echo "🔧 Update Knowledge Base ID:"
echo "After creating your Knowledge Base in the console:"
echo "aws lambda update-function-configuration --function-name bedrock-kb-function --environment Variables='{KNOWLEDGE_BASE_ID=YOUR_KB_ID}' --region $REGION"
echo ""
echo "🧹 Cleanup:"
echo "To delete all resources: aws cloudformation delete-stack --stack-name $STACK_NAME --region $REGION"