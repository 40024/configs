---
name: resume-jd-bullet-selector
description: Match job descriptions to the user's resume and swappable bullet bank, rank the strongest bullets, and provide fact-faithful tailored rewrites.
---

# Resume JD Bullet Selector

When the user provides a job description (JD), use the latest resume and `_SWAPPABLE BULLETPOINTS STORIES.md` as the two authoritative sources. Read the swappable-stories document first and resolve factual discrepancies in its favor. Use the latest resume to identify which bullets are currently included. Treat `references/bullet-bank.md` as a curated reference/index, not as an independent source of truth. If the latest resume is not provided or its location is unknown, ask the user for it. If either authoritative source is unavailable, ask for access or its contents rather than relying on the reference alone.

## Workflow

1. Request `_SWAPPABLE BULLETPOINTS STORIES.md` first (can't read as access here is limited intentionally), then request the latest resume, then read `references/bullet-bank.md` as a secondary, curated reference. Confirm that the reference was successfully read before relying on it. If access is denied or the file is unavailable, tell the user you could not see it and ask them to provide its contents; do not imply that you reviewed it.
2. Extract the JD's core responsibilities, required qualifications, preferred qualifications, and recurring keywords. Distinguish must-haves from nice-to-haves.
3. Rank bullets by direct evidence of the JD's needs, strength of demonstrated impact, and how much distinct value each bullet adds. Prefer specific outcomes and metrics, but never invent or inflate them.
4. Select a focused set. Use a user-specified count; otherwise recommend 4–6 bullets, or fewer if only a smaller number are strongly relevant. Avoid selecting multiple bullets that repeat the same initiative unless they demonstrate clearly different, valuable skills.
5. For each selection, show:
   - **Source:** the existing bullet or fact from the bank.
   - **Tailored:** a concise rewrite aligned to the JD's language without changing the underlying claim.
   - **Why it matches:** the specific responsibility or qualification it supports.
6. Order the selected bullets by relevance to the target role, not by their order in the bank.
7. Briefly identify important JD requirements with no strong supporting bullet, rather than trying to make unrelated experience fit.

## Accuracy and style rules

- Preserve the user's actual scope, ownership, technologies, outcomes, and metrics. Do not invent adoption, scale, savings, reliability improvements, or causal impact.
- Tailor phrasing, not facts. Do not add JD keywords unless the bullet's evidence supports them.
- Treat items marked **Draft / verify** as provisional: either omit them or clearly flag the claim that needs confirmation before recommending it for the resume.
- Treat items marked **Skipped / excluded** as unavailable unless the user explicitly reopens them.
- Do not use planned work as completed work. In particular, do not claim the planned Mac rack capacity increase was implemented.
- Do not claim NGINX load balancing; the user does not recall configuring it. HTTPS is HTTP over TLS, so describe the verified change as HTTP-to-HTTPS or HTTPS/TLS.
- Avoid duplicate bullets from the same initiative. Related details may be folded into one bullet when the bank identifies them as the same project.
- Keep the user's concise, action-led resume style. Use past tense for completed work.
- If a key ambiguity changes whether a bullet is accurate or relevant, ask one focused question. Otherwise, proceed and note the limitation.
- Do not edit the authoritative source document or the derived bullet bank while tailoring a JD. Update/sync either file only when the user explicitly asks; when syncing the reference, derive it from the authoritative source and preserve any user-authored material in the source.

## Default response format

Start with a short recommendation, followed by a ranked list of source and tailored bullets with one-line match rationales. End with any material JD gaps or verification questions. Do not rewrite the entire resume unless requested.
