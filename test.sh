#!/usr/bin/bash
set -euo pipefail

PROMPT="
Consult @test.md.
Evaluate the prompts in @spec_mode_guidelines.md and @task_mode_guidelines.md.
"

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  echo "Usage: $0 [MODE]"
  echo ""
  echo "Available modes:"
  echo "  gemini:flash (g-flash)             - Use Gemini 2.5 Flash model (default)"
  echo "  gemini:pro (g-pro)                 - Use Gemini 2.5 Pro model"
  echo "  opencode:copilot-gpt-4.1 (oc-gpt4) - Use GitHub Copilot GPT-4.1 model"
  echo "  aider:flash                        - Use Gemini 2.5 Flash model with Aider"
  exit 0
fi

MODE="${1:-gemini:flash}"

case "$MODE" in
"gemini:flash" | "g-flash")
  gemini --model "gemini-2.5-flash" -p "$PROMPT"
  ;;
"gemini:pro" | "g-pro")
  gemini --model "gemini-2.5-pro" -p "$PROMPT"
  ;;
"opencode:copilot-gpt-4.1" | "oc-gpt4")
  opencode run --model "github-copilot/gpt-4.1" "$PROMPT"
  ;;
"aider:flash" | "aider")
  # Define the model "flash" in ~/.aider.conf.yaml
  aider --model "flash" --yes-always --message "$PROMPT"
  ;;
*)
  echo "Unknown mode: $MODE"
  exit 1
  ;;
esac
