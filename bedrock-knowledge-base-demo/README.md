# AWS AI Practitioner Demo: Bedrock Knowledge Base

This demo teaches students how to build a Bedrock application with knowledge base capabilities, demonstrating key AI concepts like temperature, top-p, and RAG (Retrieval Augmented Generation).

## 🎯 Learning Objectives

Students will learn:
- How to create and configure Bedrock knowledge bases
- The impact of AI parameters (temperature, top-p, max tokens)
- Difference between RAG and standard AI responses
- AWS AI service integration patterns (EC2 → Lambda → Bedrock)
- Cost optimization strategies for AI workloads
- Serverless architecture with Lambda functions

## 📁 Project Structure

```
bedrock-knowledge-base-demo/
├── README.md                          # This file
├── console-guide.md                   # Step-by-step console instructions
├── deployment-script.sh               # Automated deployment

├── cloudformation/
│   └── bedrock-kb-demo.yaml          # Infrastructure template
└── sample-documents/
    ├── aws-lambda-basics.txt          # Sample knowledge base content
    ├── aws-s3-security.txt           # Sample knowledge base content
    └── aws-bedrock-overview.txt       # Sample knowledge base content
```

## 🚀 Quick Start

### For Instructors
```bash
cd bedrock-knowledge-base-demo
./deployment-script.sh
```

### After Deployment
1. Create Knowledge Base in AWS Console (follow console-guide.md)
2. Update Lambda with Knowledge Base ID:
   ```bash
   aws lambda update-function-configuration --function-name bedrock-kb-function --environment Variables='{KNOWLEDGE_BASE_ID=YOUR_KB_ID}' --region us-east-1
   ```
3. Test both Knowledge Base and standard responses

### For Students (Follow-Along)
1. Use console-guide.md for step-by-step instructions
2. Upload your own course materials to S3
3. Create knowledge base with familiar content
4. Test with questions about your course

## 📚 Demo Flow (3 Sessions × 30 mins)

### Session 1: Foundation (30 mins)
1. **S3 Setup**: Create bucket with INT suffix
2. **Upload Materials**: Course PDFs, lab instructions
3. **Explain**: Why AI needs document storage
4. **Preview**: What we'll build next

### Session 2: Knowledge Base (30 mins)
1. **Vector Database**: Create OpenSearch collection
2. **Knowledge Base**: Connect to course materials
3. **Sync**: Let AI learn from documents
4. **Explain**: How AI searches documents

### Session 3: AI Testing (30 mins)
1. **Basic Queries**: Ask about course content
2. **Parameters**: Show temperature, tokens effects
3. **Compare**: Knowledge base vs standard AI
4. **Costs**: Understand pricing implications

## 🎛️ Key Parameters to Demonstrate

### Temperature (0.0 - 1.0)
- **0.1**: Focused, consistent responses
- **0.5**: Balanced creativity and accuracy
- **0.9**: Creative but potentially inconsistent

### Top-p (0.0 - 1.0)
- **0.1**: Conservative word selection
- **0.5**: Moderate diversity
- **0.9**: High diversity in responses

### Max Tokens
- **100**: Short, concise answers
- **500**: Detailed explanations
- **1000**: Comprehensive responses

## 💡 Teaching Tips

### Effective Demonstrations
1. **Start Simple**: Begin with basic queries
2. **Show Contrast**: Compare parameters side-by-side
3. **Use Real Data**: Relevant business documents
4. **Explain Costs**: Connect parameters to pricing

### Common Student Questions
- **"Why use knowledge bases?"** → Show accuracy improvement
- **"How much does this cost?"** → Demonstrate pricing calculator
- **"What about hallucinations?"** → Compare RAG vs standard responses
- **"Can I use my own data?"** → Show S3 integration

## 🔧 Troubleshooting

### Common Issues
| Issue | Solution |
|-------|----------|
| Web app not loading | Check security group allows your IP |
| Knowledge base sync fails | Verify S3 bucket permissions |
| No Bedrock responses | Enable model access in console |
| High costs | Monitor token usage and optimize prompts |

### Debug Commands
```bash
# Check stack status
aws cloudformation describe-stacks --stack-name bedrock-demo-stack

# View EC2 logs
aws ssm start-session --target INSTANCE-ID
sudo tail -f /var/log/cloud-init-output.log

# Test S3 access
aws s3 ls s3://bedrock-kb-docs-ACCOUNT-ID-INT/
```

## 💰 Cost Estimation

### Typical Demo Costs (3 sessions)
- **OpenSearch Serverless**: ~$0.72 (3 hours)
- **Bedrock queries (50 requests)**: ~$0.05
- **S3 storage (100MB)**: ~$0.01
- **Total**: ~$0.78

### Cost Optimization Tips
1. Use smaller EC2 instances for demos
2. Delete OpenSearch collection after demo
3. Limit max tokens in responses
4. Use efficient prompting techniques

## 🧹 Cleanup

### Automated Cleanup
```bash
aws cloudformation delete-stack --stack-name bedrock-demo-stack
```

### Manual Cleanup
1. Delete CloudFormation stack
2. Empty and delete S3 bucket
3. Delete OpenSearch collection
4. Remove knowledge base

## 📖 Additional Resources

- [AWS Bedrock Documentation](https://docs.aws.amazon.com/bedrock/)
- [Knowledge Bases User Guide](https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base.html)
- [AI Practitioner Certification](https://aws.amazon.com/certification/certified-ai-practitioner/)
- [Bedrock Pricing](https://aws.amazon.com/bedrock/pricing/)

## 🤝 Contributing

To improve this demo:
1. Test with different document types
2. Add more parameter examples
3. Include industry-specific use cases
4. Enhance the web interface

## 📄 License

This demo is provided under the MIT License for educational purposes.