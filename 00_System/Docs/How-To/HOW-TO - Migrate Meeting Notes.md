# HOW-TO — Migrate Meeting Notes

Use this when converting raw meeting context (from a conversation, Slack recap, Notion export, or pasted notes) into a vault meeting note.

---

## Before You Start

Read: [REF - Frontmatter Schema Registry](../Reference/REF%20-%20Frontmatter%20Schema%20Registry.md) — `meeting` type section.

---

## Step 1: Determine the meeting type

| Signal in source | Note type to create |
|---|---|
| A single meeting instance | `meeting` via `TPL - Meeting` |
| A recurring series definition | `meeting-hub` via `TPL - Meeting Series Hub` |

This guide covers `meeting`. For `meeting-hub`, the process is simpler — just populate purpose, standing agenda, and the Dataview query.

---

## Step 2: Extract the metadata

| Field | Where to find it | Rules |
|---|---|---|
| `company` | Who the meeting is with | `"[[acme]]"` — wikilink, always lowercase |
| `series` | Is this a recurring sync? | Link to hub note if yes, blank if ad-hoc |
| `date` | When the meeting happened | `YYYY-MM-DD` |
| `attendees` | Who attended | List of `"[[Person Name]]"` wikilinks |
| Tag | Which company | `meeting/<yourcompany>` |

**Attendees rule:** Create a wikilink for each person even if their Person note doesn't exist yet. The link will resolve when the note is created.

---

## Step 3: Build the frontmatter

```yaml
---
type: meeting
company: "[[acme]]"
# leave blank if ad-hoc; link to a Meeting Series Hub note if recurring
series:
date: 2026-06-10
attendees:
  - "[[Person Name]]"
tags:
  - meeting/acme
---
```

---

## Step 4: Set the H1 title

```markdown
# Meeting: 2026-06-10 Weekly Sync
```

Convention: `# Meeting: [date] [short description]` — or use the meeting's actual name if it has one.

---

## Step 5: Populate the sections

The template has three sections. **The `## 📌 Agenda` section is retired** — do not add it.

### `## 💬 Discussion Notes`
- Bullet-point format, one idea per bullet.
- Group related points under `### ` subheadings if the meeting covered multiple topics.
- Use `> [!question]-` callout blocks for detailed Q&A exchanges.
- Preserve any `**bold labels**` from the user's notes (e.g., `**DECISION:**`, `**Takeaway:**`).

### `## ⚡ Action Items`
- Format: `- [ ] [action]` for open items, `- [x] [action]` for completed ones.
- Never auto-complete an action item unless the source explicitly marks it done.

### `## ❓ Open Questions`
- Same rules as ticket notes: `- [ ] ❓` for open, `- [x] ❓` with answer below for resolved.
- Preserve the user's question text verbatim.

---

## Step 6: File the note

Auto Note Mover handles this based on the tag. You need one routing rule per company in the plugin config — e.g.:
- `#meeting/acme` → `10_Work/00_Acme/Meetings/`

The note will auto-move when opened in Obsidian. If filing manually, use the matching company path.

**Filename convention:** `YYYY-MM-DD [Description].md`
- Examples: `2026-06-10 Weekly Sync.md`, `2026-06-03 Product Review.md`

---

## What NOT to do

- Do not use the bare `#meeting` tag — always use a company subtag like `#meeting/acme`.
- Do not use path-qualified wikilinks like `[[10_Work/00_Acme/Acme|Acme]]`. Use `[[acme]]`.
- Do not add an `## 📌 Agenda` section — it was removed from the template.
- Do not auto-resolve open questions or action items.
