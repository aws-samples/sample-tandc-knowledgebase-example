# Beginner Checklist: 3-Session Bedrock Demo

## Pre-Demo Setup (Instructor)

### AWS Account Preparation
- [ ] Bedrock model access enabled (Claude 3 Haiku, Titan)
- [ ] us-east-1 region selected
- [ ] IAM permissions for S3, Bedrock, OpenSearch
- [ ] Course materials ready (PDFs, lab instructions)

### Materials Needed
- [ ] Previous session handouts
- [ ] Lab instruction documents  
- [ ] Course slides (PDF format)
- [ ] Student exercise files

---

## Session 1: Document Storage (30 mins)

### Learning Goals
Students understand:
- [ ] Why AI needs document storage
- [ ] S3 basics for AI applications
- [ ] File organization for knowledge bases

### Demo Steps
- [ ] **5 mins**: Explain what we're building
- [ ] **10 mins**: Create S3 bucket (show naming with INT)
- [ ] **15 mins**: Upload course materials (let students follow)

### Student Actions (Optional Follow-Along)
- [ ] Create their own S3 bucket
- [ ] Upload 2-3 course documents
- [ ] Understand bucket naming conventions

### Key Teaching Points
- [ ] S3 stores documents for AI to read
- [ ] Proper file organization matters
- [ ] Security: private buckets by default

---

## Session 2: Knowledge Base Creation (30 mins)

### Learning Goals
Students understand:
- [ ] Vector databases store AI "memory"
- [ ] Knowledge bases connect documents to AI
- [ ] Sync process teaches AI about documents

### Demo Steps
- [ ] **15 mins**: Create OpenSearch collection (explain vector search)
- [ ] **10 mins**: Create knowledge base (connect S3 to AI)
- [ ] **5 mins**: Sync documents (AI learning process)

### Student Actions (Optional Follow-Along)
- [ ] Create OpenSearch collection
- [ ] Set up knowledge base with their documents
- [ ] Start sync process

### Key Teaching Points
- [ ] Vector databases enable semantic search
- [ ] Embeddings convert text to numbers
- [ ] Sync time depends on document size

---

## Session 3: AI Testing & Parameters (30 mins)

### Learning Goals
Students understand:
- [ ] How to query knowledge bases
- [ ] Parameter effects on AI responses
- [ ] Cost implications of different settings

### Demo Steps
- [ ] **10 mins**: Test basic queries about course content
- [ ] **10 mins**: Show parameter effects (temperature, tokens)
- [ ] **10 mins**: Compare knowledge base vs standard AI

### Student Actions (Optional Follow-Along)
- [ ] Ask questions about their course materials
- [ ] Experiment with temperature settings
- [ ] Compare response quality

### Key Teaching Points
- [ ] Temperature: 0.1 = focused, 0.9 = creative
- [ ] Max tokens control response length and cost
- [ ] Knowledge bases improve accuracy

---

## Success Metrics

### Session 1 Success
- [ ] Students can create S3 buckets
- [ ] Students understand document storage concept
- [ ] Files uploaded successfully

### Session 2 Success  
- [ ] Knowledge base created and synced
- [ ] Students understand vector search concept
- [ ] Sync completes without errors

### Session 3 Success
- [ ] Students can query their knowledge base
- [ ] Students see parameter effects
- [ ] Students understand cost implications

---

## Common Beginner Issues

### Session 1 Issues
- **Bucket naming errors**: Show naming rules clearly
- **Upload failures**: Check file sizes and formats
- **Permission issues**: Verify IAM roles

### Session 2 Issues
- **OpenSearch timeout**: Explain 5-8 minute wait time
- **Sync failures**: Check S3 permissions
- **Empty responses**: Verify document upload

### Session 3 Issues
- **No model access**: Enable in Bedrock console
- **Slow responses**: Explain processing time
- **High costs**: Show token counting

---

## Instructor Tips

### Keep It Simple
- Use familiar course content for examples
- Explain concepts before showing console
- Let students follow at their own pace

### Engagement Strategies
- Ask "What questions would you ask about our course?"
- Show before/after parameter comparisons
- Relate to real business use cases

### Time Management
- 5 mins setup, 20 mins demo, 5 mins Q&A per session
- Have backup slides if demos fail
- Prepare common questions in advance

### Follow-Up Resources
- Provide console guide for reference
- Share cost calculator links
- Offer office hours for individual help