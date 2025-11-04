// Fixed JavaScript code for the web application
// Replace the queryLambda function in the HTML with this version

async function queryLambda(useKB) {
    const query = document.getElementById('userQuery').value;
    const temperature = parseFloat(document.getElementById('temperature').value);
    const maxTokens = parseInt(document.getElementById('maxTokens').value);
    const topP = parseFloat(document.getElementById('topP').value);
    
    showResponse(`⏳ ${useKB ? 'Querying with Knowledge Base' : 'Querying without Knowledge Base'}...`);
    
    try {
        const response = await fetch('/invoke-lambda', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                query: query,
                use_knowledge_base: useKB,
                temperature: temperature,
                max_tokens: maxTokens,
                top_p: topP
            })
        });
        
        const data = await response.json();
        
        if (response.ok && !data.error) {
            const kbStatus = useKB ? '🧠 Knowledge Base Enhanced' : '💭 Standard Model';
            // Safe access to parameters object
            const params = data.parameters || { temperature, max_tokens: maxTokens, top_p: topP };
            showResponse(
                `<h4>✅ ${kbStatus} Response</h4>` +
                `<p><strong>Query:</strong> ${data.query}</p>` +
                `<p><strong>Response:</strong> ${data.response}</p>` +
                `<p><strong>Parameters:</strong> Temp: ${params.temperature}, Tokens: ${params.max_tokens}, Top-P: ${params.top_p}</p>` +
                `<small>🔄 Flow: Browser → EC2 → Lambda → Bedrock ${useKB ? '+ Knowledge Base' : ''}</small>`
            );
        } else {
            showResponse(`<h4>❌ Error:</h4><p>${data.error || 'Unknown error'}</p>`);
        }
    } catch (error) {
        showResponse(`<h4>❌ Network Error:</h4><p>${error.message}</p>`);
    }
}
