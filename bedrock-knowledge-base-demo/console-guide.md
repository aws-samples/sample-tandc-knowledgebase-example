# AWS AI Practitioner Demo: Bedrock Knowledge Base Console Guide

## Demo Overview
This guide walks through building a Bedrock Knowledge Base application across 3 beginner-friendly sessions.

**Duration**: 3 sessions × 30 minutes
**Target**: Beginner AWS AI Practitioner students
**Format**: Follow-along optional

---

## Session 1: Foundation Setup (30 minutes)
**Goal**: Create S3 bucket and upload training materials

### Step 1: Create S3 Bucket (10 mins)
1. Navigate to **S3 Console**
2. Click **Create bucket**
3. Bucket name: `bedrock-kb-docs-[ACCOUNT-ID]-INT`
4. Region: `us-east-1`
5. Keep defaults, click **Create bucket**

### Step 2: Upload Training Materials (15 mins)
1. Upload your session materials:
   - Previous session PDFs
   - Training scripts
   - Course handouts
2. **Demo tip**: Use actual course materials students recognize
3. Show file organization in S3

### Step 3: Explain What We Built (5 mins)
- **S3**: Document storage for AI
- **Next session**: Vector database setup
- **Final session**: AI question answering

---

## Session 2: Knowledge Base Creation (30 minutes)
**Goal**: Set up vector database and create knowledge base


### Step 2: Create Knowledge Base (15 mins)
1. Navigate to **Bedrock Console**
2. Click **Knowledge bases** → **Create**
3. Basic settings:
   - Name: `course-knowledge-base`
   - IAM role: Create new
4. Data source:
   - S3 URI: `s3://bedrock-kb-docs-[ACCOUNT-ID]-INT/`
   - Chunking: Default
5. Vector database:
   - Collection: Elastichae serverless
6. Click **Create**

---

## Session 3: AI Testing & Parameters (30 minutes)
**Goal**: Test knowledge base and understand AI parameters

### Step 1: Sync Knowledge Base (10 mins)
1. Click **Data sources** → **Sync**
2. Wait for completion (3-5 minutes)
3. Explain: AI is learning from your documents

### Step 2: Test Basic Queries (10 mins)
1. Click **Test knowledge base**
2. Select model: **Claude 3 Haiku**
3. Ask about your course content:
   - "What did we cover in session 1?"
   - "Explain [specific topic from your materials]"

### Step 3: Parameter Effects (10 mins)
Show live parameter changes:
- **Temperature 0.1**: Consistent, factual
- **Temperature 0.9**: Creative, varied
- **Max tokens**: 100 (short) vs 500 (detailed)

**Key Teaching Point**: Parameters control AI behavior and cost

### Optional: Web Interface Demo
*For instructors who want to show the web interface*

1. Deploy CloudFormation template
2. Show interactive parameter sliders
3. Compare knowledge base vs standard responses
4. Demonstrate real-time parameter effects

**Note**: Students can follow console steps without web deployment

---

## Key Teaching Points

### Temperature Effects
- **0.1**: Consistent, factual responses
- **0.5**: Balanced creativity and accuracy
- **0.9**: Creative but potentially inconsistent

### Knowledge Base Benefits
- **Accuracy**: Grounded in your documents
- **Relevance**: Context-aware responses
- **Citations**: Source attribution
- **Control**: Your data, your rules

### Cost Considerations
- **Embeddings**: One-time cost per document
- **Vector storage**: OpenSearch Serverless pricing
- **Inference**: Per-token pricing
- **Retrieval**: Per-query costs

---

## Session Scripts

### Session 1 Script
"Today we start building an AI that knows about our course. First, we need to store our materials where AI can access them."

### Session 2 Script
"Now we'll create the AI's memory system - a knowledge base that can search through our course materials."

### Session 3 Script
"Time to test our AI! We'll ask questions about our course and see how different settings change the answers."

### Key Takeaways
- Session 1: S3 stores documents for AI
- Session 2: Knowledge bases make AI smarter
- Session 3: Parameters control AI behavior and cost

---

## Troubleshooting

### Common Issues
1. **OpenSearch collection not ready**: Wait 5-8 minutes
2. **Knowledge base sync fails**: Check S3 permissions
3. **Web app not loading**: Verify security group rules
4. **No responses**: Check Bedrock model access

### Quick Fixes
- Restart EC2 instance if web server fails
- Re-sync knowledge base if responses seem stale
- Check CloudWatch logs for detailed errors