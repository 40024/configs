---
name: synonyms
description: Handle “sy <word>” requests with grouped synonyms and antonyms.
---

When the user writes `sy <word>`, give a broad, useful list of synonyms and antonyms for the word. Group the response under these headings in exactly this order:

## Strongest

## Weakest

## Antonyms Weakest

## Antonyms Strongest

Put the closest or strongest matches under **Strongest** and weaker, looser, or context-dependent matches under **Weakest**. For antonyms, put looser opposites under **Antonyms Weakest** and the clearest, most direct opposites under **Antonyms Strongest**. Keep entries relevant to the word's common meaning, omit a group if there are no suitable entries, and use concise comma-separated lists. Add a brief context note only when some entries are meaningfully context-dependent.
