# Notebook — Agent Orientation

This is a personal Obsidian vault. Read this before creating or modifying any notes.

> **Mirrors `CLAUDE.md`.** Both files must be kept in sync. When updating rules, edit both.
> Full reference docs and how-to guides: `00_System/Docs/`

## Vault Structure

```
00_System/          Infrastructure — templates, attachments, CSS, agent docs. EXCLUDED from auto-routing.
  Drawings/         ALL Excalidraw files (.excalidraw.md) live here, regardless of topic.
10_Work/            Professional context, organized by company.
  00_CompanyA/        Replace with your company names (numeric prefix keeps them ordered).
    Meetings/
    Tickets/
20_Personal/        Personal context.
  00_Project/
  01_People/
  02_Journal/       Daily journal entries (type: journal).
  03_To-Do/         Daily task lists (type: daily-todo).
  04_Learning/
    Books/
    Concepts/
    How-Tos/
    Tools/
```

## Critical Rules

### 1. `type:` is the master discriminator
Every note must have a `type:` frontmatter property matching its template exactly.
Valid values: `ticket` `meeting` `meeting-hub` `daily-todo` `journal` `concept` `how-to` `tool` `resource` `person` `project` `task` `book` `company`

### 2. Always use `[[wikilink]]` for relational fields
`company:`, `attendees:`, `people:`, `series:` — always `[[wikilink]]` syntax, even if the target note doesn't exist yet.

### 3. Never write YAML comment hints as values
Fields with `# options: A | B | C` above them are hints. Write only a single chosen value on the actual field line.

### 4. Date format is always `YYYY-MM-DD`
No exceptions. Ticket date fields are `date_created:` and `date_completed:`.

### 5. `ticket_id:` must always be populated
Extract it from `Ticket link:` or the note title. Do not leave blank on a completed ticket.

### 6. Inline code = backtick syntax only
The vault has a custom CSS snippet styling inline `code` as Notion-style coral text. Never use HTML `<code>` tags.

### 7. Do not override content the user wrote
When completing/summarizing a note, append or fill blank sections. Never rewrite sections that already have content unless explicitly instructed.

## Auto-Routing (Auto Note Mover)

Notes are auto-filed by their first matching tag:

| Tag | Destination |
|---|---|
| `#meeting/<company>` | `10_Work/<company>/Meetings/` — add a rule per company |
| `#task/daily` | `20_Personal/03_To-Do/` |
| `#journal` | `20_Personal/02_Journal/` |
| `#task/todo` | `20_Personal/02_Journal/` |
| `#people` | `20_Personal/01_People/` |
| `#project/active` | `20_Personal/00_Project/` |
| `#knowledge/concept` | `20_Personal/04_Learning/Concepts/` |
| `#knowledge/how-to` | `20_Personal/04_Learning/How-Tos/` |
| `#knowledge/tool` | `20_Personal/04_Learning/Tools/` |
| `#resource/book` | `20_Personal/04_Learning/Books/` |
| `#task/jira` | **Manual filing** — place under the correct company's `Tickets/` hierarchy |

## Templates

All in `00_System/Templates/`. Use format `TPL - [Type].md` as your naming reference.

## Agent Documentation

Full migration how-tos and reference schemas: `00_System/Docs/`
