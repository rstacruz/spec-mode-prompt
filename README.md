# Spec mode prompt

Vibe code without the chaos. Inspired by [Kiro code's spec mode](https://kiro.dev/docs/specs/).

### Rationale

The term "vibe coding" feels like it implies a reckless surrender to AI's whimsy. How is an AI supposed to figure out how to do features like "just implement a download button"?

Spec mode is one way to do this. It will ask the agent to do research to plan and design the feature before actually implementing it. Check out these examples:

- [Example spec: double-click to add tasks](examples/tasks_md_double_click.md)

## Usage

### Generic instructions

This should work for most LLM coding agents that support custom prompts:

1. Copy [`spec_mode_guidelines.md`](spec_mode_guidelines.md) and [`task_mode_guidelines.md`](task_mode_guidelines.md) into your project's _notes/_ folder.
2. Spec mode: Use your preferred LLM coding agent (Gemini, Claude, Copilot, etc.) to use this prompt:

   ```markdown
   Read the guidelines in @notes/spec_mode_guidelines.md.
   Plan for this feature:

   <describe your feature here>
   ```

3. Work with the agent to refine the specs:

   ```sh
   # Address requirements:
   "Remove requirement 1.2."
   "Add a requirement to support dark mode."
   # Address technical design:
   "Use Tailwind instead of CSS modules for styling here."
   "Don't create a separate Message component, just use a div."
   ```

4. Task mode: when you're happy with the spec, start a new chat and use this prompt:

   ```markdown
   Read the guidelines in @notes/task_mode_guidelines.md.
   Do all the tasks in @notes/specs/my-feature.spec.md.
   ```

### OpenCode

[sst/opencode](https://github.com/sst/opencode) instructions:

1. Save [`spec_mode_guidelines.md`](spec_mode_guidelines.md) into `~/.config/opencode/spec-mode.md`.
2. Save [`task_mode_guidelines.md`](task_mode_guidelines.md) into `~/.config/opencode/task-mode.md`.
3. Update `~/.config/opencode/config.json` with the config below.
4. In OpenCode, press <kdb>Tab</kdb> a few times to switch to Task mode.

```json
{
  "$schema": "https://opencode.ai/config.json",
  "mode": {
    "spec": { "prompt": "{file:./spec-mode.md}" },
    "task": { "prompt": "{file:./task-mode.md}" }
  }
}
```

### Claude Code

[Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview) instructions:

1. Save [`spec_mode_guidelines.md`](spec_mode_guidelines.md) into `~/.claude/commands/spec-mode.md`.
2. Save [`task_mode_guidelines.md`](task_mode_guidelines.md) into `~/.claude/commands/task-mode.md`.
3. Use `/spec-mode plan this feature: <describe your plan here>` in Claude Code.

### Zed

1. Save [`spec_mode_guidelines.md`](spec_mode_guidelines.md) into Zed's [Rules Library](https://zed.dev/docs/ai/rules#rules-library).
2. Save [`task_mode_guidelines.md`](taskc_mode_guidelines.md) into Zed's [Rules Library](https://zed.dev/docs/ai/rules#rules-library).
3. Include it in your prompt with `@rule`.

### Visual Studio Code

1. Open the command palette (<kbd>Ctrl-Shift-P</kbd> or <kbd>Cmd-Shift-P</kbd>) and `Chat: New Mode File…`
2. Choose `User Data Folder`
3. Give it a name like `"Spec"`
4. Paste the contents of [`spec_mode_guidelines.md`](spec_mode_guidelines.md) into the new file and save it
5. Click `Configure Tools…` and select all tools
6. After saving, it can now be activated by changing modes (eg, Ask, Edit, Agent, Spec)
7. Do the same for [`task_mode_guidelines.md`](task_mode_guidelines.md)

## Prior art

Also see:

- [ashi12481/kiro-claude-code](https://github.com/ashi12381/kiro-claude-code)
- [Pimzino/claude-code-spec-workflow](https://github.com/Pimzino/claude-code-spec-workflow)

## Hints

- Use [codebase-analysis](https://github.com/rstacruz/codebase-analysis-prompt) to improve planning. Generate architecture docs then use `See @notes/architecture/` in spec mode.
