# Vault Agent Manual — Index

This is the entry point for any AI agent operating in this vault. Read this first, then navigate to the relevant doc.

## 5 Rules You Must Never Break

1. **`type:` is sacred** — every note needs one; wrong value silently breaks all queries.
2. **Always `[[wikilink]]`** for `company:`, `attendees:`, `people:`, `series:` — no plain strings, no path-qualified links.
3. **Date format is always `YYYY-MM-DD`** — no exceptions.
4. **YAML comment lines are hints, not values** — lines starting with `#` are for you to read, never write them as field values.
5. **Never overwrite content the user wrote** — append to blank sections only, unless explicitly told otherwise.

---

## Reference Docs

| Doc                                                                                             | What it answers                                    |
| ----------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| [REF - Frontmatter Schema Registry](Reference/REF%20-%20Frontmatter%20Schema%20Registry.md)     | "What are all the properties for this note type?"  |
| [REF - Tag Taxonomy & Routing Map](Reference/REF%20-%20Tag%20Taxonomy%20%26%20Routing%20Map.md) | "Which tag routes where?"                          |
| [REF - Folder Architecture Map](Reference/REF%20-%20Folder%20Architecture%20Map.md)             | "Where does this note live in the vault?"          |
| [REF - Property Format Rules](Reference/REF%20-%20Property%20Format%20Rules.md)                 | "How do I format this specific field value?"       |
| [REF - CSS & Rendering Contract](Reference/REF%20-%20CSS%20%26%20Rendering%20Contract.md)       | "How does inline code render? What syntax to use?" |

## How-To Guides

| Doc | What it enables |
|---|---|
| [HOW-TO - Migrate a Jira Ticket](How-To/HOW-TO%20-%20Migrate%20a%20Jira%20Ticket.md) | Convert ticket context + scratchpad notes into a complete vault note |
| [HOW-TO - Migrate Meeting Notes](How-To/HOW-TO%20-%20Migrate%20Meeting%20Notes.md) | Convert raw meeting context into a formatted meeting note |
| [HOW-TO - Populate Frontmatter Without Errors](How-To/HOW-TO%20-%20Populate%20Frontmatter%20Without%20Errors.md) | Avoid the most common frontmatter mistakes |
| [HOW-TO - Route a Note to the Correct Folder](How-To/HOW-TO%20-%20Route%20a%20Note%20to%20the%20Correct%20Folder.md) | Decide where a note belongs when it isn't obvious |

---

## Quick Type → Template Map

| `type:` value  | Template file            |
| -------------- | ------------------------ |
| `ticket`       | TPL - Jira Ticket        |
| `meeting`      | TPL - Meeting            |
| `meeting-hub`  | TPL - Meeting Series Hub |
| `daily-todo`   | TPL - Daily To-Do        |
| `journal`      | TPL - Journal Fragment   |
| `concept`      | TPL - Concept            |
| `how-to`       | TPL - How-To Doc         |
| `tool`         | TPL - Tool               |
| `resource`     | TPL - Resource           |
| `person`       | TPL - Person             |
| `project`      | TPL - Project Hub        |
| `task`         | TPL - Project Task       |
| `book`         | TPL - Book               |
| `company`      | TPL - Company            |
