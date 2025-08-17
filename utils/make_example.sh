#!/usr/bin/env bash

PROMPT="
Write an example plan as described by spec-mode.md.
Make it up for a React TypeScript project.
Use quickplan mode.
Print the plan only, no other explanations.
"

cat ../agents/spec-mode.md | opencode run --model "github-copilot/gpt-4.1" "$PROMPT"
