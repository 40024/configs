# Global filesystem safety

- Treat the active workspace as the only allowed search scope. Never use glob or grep outside it.
- Keep glob and grep searches at the workspace root or one directory level below it; do not search deeper or use them to expose deeper paths or contents.
- Do not use shell commands to list, search, read, copy, dump, or otherwise expose filesystem paths or file contents.
- If a filesystem-related command seems necessary, ask the user first and explain what paths or contents its output could reveal.
- Follow OpenCode permission prompts and denials; these instructions do not override them.
