# 🥗 Smart Diet AI Agent (n8n + Local LLM)

An intelligent, privacy-first dietary tracking agent built with **n8n** and **Local LLM (Ollama + Llama 3)**. This workflow transforms unstructured, natural language food descriptions into structured nutritional data, calculates daily intake, and provides localized feedback without sending sensitive data to external cloud providers.

## 🌟 Key Features

* **🔒 Privacy-First AI (Local LLM):** Utilizes a locally hosted Llama 3 model (`cwchang/llama3-taide-lx-8b-chat-alpha1`) via Ollama, ensuring 100% data privacy and compliance with enterprise/government security standards.
* **🧠 Advanced Prompt Engineering:** Forces the LLM to act as a nutritionist and strictly output complex, nested JSON objects detailing meal times, ingredients, cooking methods, and macronutrients.
* **🛡️ Robust JSON Auto-Repair:** Features a custom JavaScript node designed to intercept and automatically repair malformed JSON outputs from the LLM (e.g., missing quotes, stray newlines, markdown wrappers), ensuring pipeline stability.
* **🌍 Auto-Language Detection:** Dynamically detects the user's input language (English, Traditional Chinese, Japanese) and formats the final summary and UI labels accordingly.
* **📊 Automated Nutritional Calculation:** Automatically extracts numeric values from the AI's output and calculates the total daily intake for Calories, Fats, Protein, Carbohydrates, and Fiber.

## 🏗️ Architecture & Workflow

The workflow consists of the following automated steps:

1. **Chat Trigger:** Receives natural language input from the user (e.g., "I had a Big Mac and a Coke for lunch").
2. **Set Variables:** Initializes strict system prompts, temperature (0 for deterministic output), and token limits.
3. **AI Agent (LangChain):** Processes the input using the local Llama 3 model to extract structured nutritional data.
4. **Custom Code - JSON Repair:** Sanitizes and parses the LLM's raw text output into a valid JSON object, preventing pipeline crashes.
5. **Custom Code - Parse to CSV:** Flattens the nested JSON array into standardized records and appends timestamps.
6. **Convert to File:** Prepares the structured data for export or database logging.
7. **Custom Code - Language & Math:** Detects the input language, sums up the macronutrients, and generates a localized summary report.
8. **Chat Output:** Returns the formatted, calculated nutritional summary back to the user.

## 📋 Prerequisites

To run this workflow, you will need:
* **n8n** instance (Self-hosted)
* **Ollama** installed locally or on a private server
* A compatible local LLM pulled via Ollama (e.g., `llama3` or `cwchang/llama3-taide-lx-8b-chat-alpha1`)

## 💡 Enterprise / Government Use Case

This workflow demonstrates **Secure Data Extraction & Processing**. By leveraging a local LLM, organizations can process sensitive user data (health records, internal documents, personal identifiable information) without the risk of data leakage associated with public cloud AI APIs. Furthermore, the robust error-handling mechanisms showcase enterprise-grade reliability, ensuring the system remains stable even when AI outputs are unpredictable.