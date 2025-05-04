# 💬 AI Chatbot using Azure OpenAI (GPT-3.5 Turbo)

This project is a lightweight AI-powered chatbot built using **Azure AI Foundry**, the **Azure OpenAI Service**, and the GPT-3.5-turbo model. It demonstrates how to securely configure and deploy an AI assistant with custom prompts and ethical guardrails.

---

## ✨ Features

- ✅ Uses GPT-3.5-turbo via Azure OpenAI Service
- 📁 Reads training data from `.jsonl` files (JSON Lines format)
- 🔐 Uses `.env` and `dotenv` for environment variable management
- 💬 Custom prompts for contextual, helpful responses
- ☁️ Deployed in a cloud environment with secure API access
- ⚖️ Follows ethical AI practices to avoid sensitive recommendations

---

## 🔧 Technologies Used

### Programming & Frameworks
- Custom data formatting in JSON / JSONL
- Environment configuration with `.env` + `dotenv`
- Azure OpenAI integration using `@azure/openai` and `AzureKeyCredential`
- Bash scripting for deployment automation

### AI & Machine Learning
- Prompt engineering for meaningful interactions
- Conversational AI training using `.jsonl`
- Awareness of AI ethics and compliance (e.g. filtered topics like travel, hotels)

---

## 🚀 Deployment

1. Clone the repo
2. Add your `.env` file with your Azure credentials
3. Install dependencies and run the app

```bash
npm install
npm run start
