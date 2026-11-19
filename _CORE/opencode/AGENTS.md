# Global filesystem safety

- Treat the active workspace as the only allowed search scope. Never use glob or grep outside it.
- Keep glob and grep searches at the workspace root or one directory level below it; do not search deeper or use them to expose deeper paths or contents.
- Do not use shell commands to list, search, read, copy, dump, or otherwise expose filesystem paths or file contents.
- If a filesystem-related command seems necessary, ask the user first and explain what paths or contents its output could reveal.
- Follow OpenCode permission prompts and denials; these instructions do not override them.

---

## Explanations: first-principles style

When I ask for a rundown, explanation, or overview of a topic, structure the answer from first principles:

- Start with the foundations: define the core quantities and mechanisms the topic rests on, precisely (what they actually are, not a casual gloss), and state the governing laws. Do this before discussing any products, categories, applications, or comparisons.
- Never skip this step, even if the topic seems simple or a casual description is already on the table. If a description, including one from me or from the user, is a simplification, test it against the definitions and correct it where it breaks down.
- Explain why things work, not only what they are. Derive numbers where useful (units, conversions, simple cost or efficiency math).
- Cover tradeoffs, failure modes, and safety considerations where they matter.
- Organize with clear headers and tables for comparisons; keep prose tight.
- End with a short summary that restates the core principle in one or two sentences.

---

## Formatting

- Do not use LaTeX or `$$...$$` delimiters. The chat renderer shows them as raw markup.
- Write formulas in plain text or Unicode, either inline or in a code block, for example:
  E (kWh) = P (kW) × t (h)
