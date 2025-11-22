# Ollama Setup Instructions

## 1. Overview
[Ollama](https://ollama.com/blog/ollama-is-now-available-as-an-official-docker-image) can be used to Chat & build with open models

## 2. Prerequisites
- Default port: `11434`
- Run Ollama Model to run the model of you choice, models can be found in [ollama/library](https://ollama.com/library)

    ``bash
    docker exec -it ollama-1b ollama run llama3.2:1b
    ```