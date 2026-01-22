---
description: Commit Message Generator
---

Based on the staged changes, generate a Conventional Commit message.

Use the last three commit messages as a style reference.

Output requirements:

- Output the entire commit message (header + body) in a single block, ready to copy.

- Include a Conventional Commit header.

- Include a commit body with bullet points (maximum 4 bullets).

Strict content rules:

- Each bullet point must describe a concrete functional change or capability introduced by this commit.

- Do NOT add summary, conclusion, motivation, or impact statements (e.g. “apply this commit to…”, “this change enables…”, “overall improvement…”).

- Do NOT include generic or promotional language.

- Do NOT restate the commit header in the body.

- Do NOT reference file paths, file locations, IDE links, or source code URLs.

- If there are fewer than 4 meaningful changes, output fewer bullets rather than inventing new ones.