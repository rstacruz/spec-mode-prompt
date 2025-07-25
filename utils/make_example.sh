#!/usr/bin/env bash

PROMPT="
Write an example plan as described by spec_mode_guidelines.
Make it up for a React TypeScript project.
Use quickplan mode.
Take note of parallelism guidelines.
Print the plan only, no other explanations.
"

cat spec_mode_guidelines.md | opencode run --model "github-copilot/gpt-4.1" "$PROMPT"
