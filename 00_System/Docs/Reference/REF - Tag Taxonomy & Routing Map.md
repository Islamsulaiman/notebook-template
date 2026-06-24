# REF — Tag Taxonomy & Routing Map

Every valid tag in the vault, its routing destination, and whether it is handled by Auto Note Mover (automatic) or requires manual filing.

---

## Auto-Routed Tags

These tags trigger Auto Note Mover. The note is moved to the listed folder automatically when the tag is present.

| Tag | Destination folder | Note type |
|---|---|---|
| `#meeting/<company>` | `10_Work/<company>/Meetings/` | `meeting` — add one rule per company |
| `#task/daily` | `20_Personal/03_To-Do/` | `daily-todo` |
| `#journal` | `20_Personal/02_Journal/` | `journal` |
| `#task/todo` | `20_Personal/02_Journal/` | `task` |
| `#people` | `20_Personal/01_People/` | `person` |
| `#project/active` | `20_Personal/00_Project/` | `project` |
| `#knowledge/concept` | `20_Personal/04_Learning/Concepts/` | `concept` |
| `#knowledge/how-to` | `20_Personal/04_Learning/How-Tos/` | `how-to` |
| `#knowledge/tool` | `20_Personal/04_Learning/Tools/` | `tool` |
| `#resource/book` | `20_Personal/04_Learning/Books/` | `book` |

---

## Manually Filed Tags

These tags exist in templates but have **no auto-routing rule**. Notes must be placed in the correct folder by the agent manually.

| Tag | Intended destination | Note type |
|---|---|---|
| `#task/jira` | `10_Work/[company]/Tickets/[epic]/` | `ticket` |
| `#meeting/hub` | `10_Work/[company]/Meetings/` | `meeting-hub` |
| `#resource/external` | Wherever contextually relevant | `resource` |
| `#crm/company` | `10_Work/[company]/` (root) | `company` |

---

## Tag Hierarchy

```
meeting/
  <company>      ← One subtag per company (e.g. meeting/acme, meeting/corp)
  hub            ← Recurring meeting series hubs (manual)

task/
  jira           ← Jira tickets (manual)
  daily          ← Daily to-do lists
  todo           ← Project tasks

knowledge/
  concept        ← Zettelkasten atomic notes
  how-to         ← Procedural guides
  tool           ← Tool learning & reference notes (External and Internal)

resource/
  book           ← Book notes
  external       ← Saved links (manual)

project/
  active         ← Active project hubs

people           ← All contacts
journal          ← Daily journal entries
crm/company      ← Company profiles (manual)
permanent_note   ← Secondary tag on concept notes (never used for routing)
```

---

## Rules

- **Never invent a tag** that isn't in this list. If a new tag is needed, flag it to the user.
- **A note gets exactly one primary routing tag** — the first match in Auto Note Mover wins.
- **`#permanent_note`** is always a secondary tag on `concept` notes alongside `#knowledge/concept`. Never use it alone.
- **`#meeting`** (without a subtag) is retired. Always use a company subtag like `#meeting/acme`.
