# HOW-TO — Migrate a Jira Ticket

Use this when you have context about a Jira ticket (from the user's scratchpad, a conversation, Jira text) and need to produce a complete, correctly formatted vault note.

---

## Before You Start

Read: [REF - Frontmatter Schema Registry](../Reference/REF%20-%20Frontmatter%20Schema%20Registry.md) — `ticket` type section.

---

## Step 1: Extract the core identifiers

From the source context, extract:

| Field | Where to find it | Example |
|---|---|---|
| `ticket_id` | URL last segment, or note H1 title | `IAI-1240` |
| `Ticket link` | Full Jira URL | `https://yourcompany.atlassian.net/browse/PROJ-123` |
| `company` | Which company's Jira this is | `[[acme]]` |
| `status` | Current ticket state | `In Progress` |
| `priority` | Jira priority field | `Medium` |
| `date_created` | Ticket creation date | `2026-06-02` |
| `date_completed` | Resolution date if done | `2026-06-10` or blank |

**If `ticket_id` is not explicitly stated**, parse it from the URL: take the string after `/browse/`.

---

## Step 2: Build the frontmatter

```yaml
---
type: ticket
ticket_id: PROJ-123
Ticket link: https://yourcompany.atlassian.net/browse/PROJ-123
company: "[[acme]]"
status: In Progress
priority: Medium
date_created: 2026-06-02
date_completed:
tags:
  - task/jira
---
```

**Do not add any extra properties.** Stick to the schema exactly.

---

## Step 3: Set the H1 title

Format: `# [TICKET-ID Title of ticket](Ticket link URL)`

```markdown
# [PROJ-123 Title of the ticket](https://yourcompany.atlassian.net/browse/PROJ-123)
```

This makes the title a clickable Jira link in Obsidian's preview mode.

---

## Step 4: Populate the sections

The template has three sections. Rules for each:

### `## 🚧 Implementation Plan`
- Populate from any design notes, RFD decisions, or scratchpad content the user provided.
- Use a numbered list for sequential steps.
- Use sub-bullets for details under each step.
- **Never overwrite content the user already wrote here.** Only fill blank sections.

### `## ❓ Open Questions`
- Preserve every `- [ ] ❓` item the user wrote exactly as-is.
- If extracting questions from a conversation, format each as: `- [ ] ❓ [question text]`
- If a question has been answered, format as: `- [x] ❓ [question text]` with an indented `* **Answer:** [answer]` below it.
- Never auto-check an open question.

### `## 🪵 Scratchpad & Snippets`
- Paste code, error logs, terminal output, and investigation notes here.
- Wrap all code in fenced code blocks with the appropriate language hint.
- Use `### ` subheadings to organize long scratchpads.

---

## Step 5: Determine the target company folder

`#task/jira` is **not auto-routed**. You must determine the correct company folder before filing.

### Step 5a: Infer the company

Try each signal in order, stop at the first confident match:

| Signal | How to read it | Example |
|---|---|---|
| `Ticket link:` URL domain | Check the subdomain before `.atlassian.net` | `acme.atlassian.net` → Acme |
| `company:` field already populated | Trust it | `"[[acme]]"` → `10_Work/00_Acme/` |
| Ticket ID prefix | Some prefixes are company-specific | recognize prefixes from context |
| User context in the conversation | Explicit mention | "this is an Acme ticket" → `10_Work/00_Acme/` |

Map each Atlassian subdomain to the folder you set up under `10_Work/`. Update this list as you add companies.

### Step 5b: If you cannot confidently infer the company — STOP and ask

> "I can't determine which company this ticket belongs to from the context provided. Which company folder should I file it under?"

**Never guess and file.** Never create a new company folder on your own — if the inferred company doesn't have an existing folder under `10_Work/`, stop and ask the user before creating anything.

### Step 5c: File the note

Once the company folder is confirmed:

```
10_Work/[company folder]/Tickets/[Epic Name]/Tickets implemented/[TICKET-ID filename].md
```

**Filename convention:** `PROJ-123 Title of the ticket.md`
- Start with the ticket ID
- Follow with the ticket title (shortened if very long)
- No brackets in the filename

If the epic subfolder doesn't exist, create it using the epic name from Jira context. Do not create the parent company folder — that must already exist.

---

## What NOT to do

- Do not leave `ticket_id:` blank.
- Do not use `created:` or `Done at:` — those are retired. Use `date_created:` and `date_completed:`.
- Do not rewrite the user's existing implementation notes or scratchpad content.
- Do not put the ticket in a personal or journal folder — always under `10_Work/`.
