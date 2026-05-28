# 🥗 Smart Diet AI Agent (n8n + Qwen 3.5 + WhatsApp Integration)

[![Watch the video for demonstration]]

An intelligent, privacy-first dietary tracking and conversational agent built with **n8n**, **LangChain**, and a **Local LLM (Qwen 3.5 9B via Ollama)**. This automated workflow acts as a WhatsApp-based nutritionist. It features a multi-agent architecture with conversational memory, capable of distinguishing between casual queries and meal logging, transforming natural language into structured nutritional data without sending sensitive data to external cloud providers.

## 🌟 What's New

* **📱 Upgraded to Qwen 3.5 (9B):** Replaced the previous Qwen 2.5 (7B) model. The new model leverages the Structured Output Parser for significantly more stable and accurate JSON generation.
* **🌍 Graceful Error Handling:** Implemented a robust error handler. If an issue occurs, the system now returns a user-friendly error message and continues running without halting the entire workflow.

## 🌟 Key Features

* **📱 WhatsApp API & Session Management:** Seamlessly connects with users via a custom WhatsApp API gateway. It utilizes LangChain's `Window Buffer Memory` mapped to the user's WhatsApp ID (`remoteJid`), allowing the AI to remember previous contexts and maintain continuous conversations.
* **🤖 Multi-Agent Architecture:** Employs a dual-agent system for high reliability:
  * **Agent 1 (Nutritionist & Extractor):** Handles user intent recognition (chatting vs. logging), generates friendly localized responses, and extracts meal data into a strict JSON format.
  * **Agent 2 (Data Validator & Translator):** Acts as a background data processing assistant to validate the JSON output, specifically ensuring the `food_name_en` field is present and accurately translated for database consistency.
* **🧠 Advanced Intent Recognition:** The system intelligently differentiates between "Querying" (e.g., "What did I eat for breakfast?") and "Logging" (e.g., "I just ate an apple"). It only triggers the complex JSON data extraction pipeline when a new meal is logged.
* **🔒 Privacy-First Local LLM:** Powered by a locally hosted `qwen3.5:9b` model, ensuring 100% data privacy and compliance with enterprise/government data protection standards.
* **🛡️ Robust JSON Auto-Repair:** Features custom JavaScript nodes designed to intercept, sanitize (e.g., removing markdown blocks, fixing full-width punctuation), and automatically repair malformed JSON outputs from the LLM.
* **🌍 Strict Language Control:** Explicitly supports English and Chinese (including Cantonese). It dynamically detects the language to format the final WhatsApp summary, while gracefully rejecting unsupported languages to prevent hallucination.

## 🏗️ Architecture & Workflow

The workflow consists of the following automated steps:

1. **Webhook Trigger (WhatsApp):** Receives incoming natural language messages from the WhatsApp API gateway.
2. **Memory Initialization:** Loads the user's chat history using LangChain's Memory node based on their unique WhatsApp number.
3. **Primary AI Agent (Qwen 3.5):** Analyzes the input. If it's a query, it replies conversationally. If it's a meal log, it generates a localized reply alongside a structured markdown JSON block.
4. **Custom Code - JSON Extraction:** Sanitizes the raw output, extracts the JSON block from the markdown, and handles fallback parsing.
5. **Secondary AI Agent (Data Validator):** Inspects the parsed JSON and automatically translates Chinese food names into English (`food_name_en`) to ensure strict database schema compliance.
6. **Custom Code - Parse to CSV & Math:** Flattens the nested JSON array, calculates the total daily intake (Calories, Fats, Protein, Carbohydrates, Fiber), and formats the data based on the detected language.
7. **Convert to File:** Prepares the structured data as a binary file for potential export or database logging.
8. **HTTP Request (WhatsApp Output):** Sends a POST request back to the custom WhatsApp API gateway to deliver the formatted response to the user.

## 📋 Prerequisites

To run this workflow, you will need:
* **n8n** instance (Self-hosted)
* **Ollama** installed locally or on a private server
* The **Qwen 3.5** model pulled via Ollama (`qwen3.5:9b`)
* A custom **WhatsApp API Gateway** (e.g., via ngrok) to handle incoming/outgoing messages.

## 💡 Enterprise / Government Use Case

This workflow demonstrates **Enterprise-grade Conversational AI, Multi-Agent Orchestration, and Secure Data Extraction**. By leveraging a local LLM with session memory, organizations can deploy intelligent assistants for frontline staff or citizens (e.g., fault reporting, health tracking) via familiar platforms like WhatsApp. The dual-agent validation ensures that data entering the backend database is strictly formatted and translated, eliminating the risk of unstructured data corruption while maintaining strict data privacy.