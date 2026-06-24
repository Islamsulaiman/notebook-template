# HOW-TO — Route a Note to the Correct Folder

Use this when you're unsure where a note belongs. Follow the decision tree top to bottom and stop at the first match.

---

## Decision Tree

```
What is the note's type:?
│
├── ticket
│   └── Manual filing required. Tag: #task/jira
│       Path: 10_Work/[company folder]/Tickets/[Epic Name]/Tickets implemented/
│
│       COMPANY RESOLUTION — try in order, stop at first confident match:
│         1. Ticket link URL domain  → match subdomain to your company folder
│         2. company: field already set in frontmatter
│         3. Ticket ID prefix known from context
│         4. User stated it explicitly in conversation
│
│       IF UNCERTAIN → ask the user. Never guess. Never create a new
│       company folder. If the company folder doesn't exist, stop and ask.
│
├── meeting
│   └── company = [[yourcompany]] → tag #meeting/<yourcompany> → auto-routes to 10_Work/<yourcompany>/Meetings/
│
├── meeting-hub
│   └── Manual filing.
│       Path: 10_Work/[company]/Meetings/
│       Tag:  #meeting/hub
│
├── daily-todo
│   └── tag #task/daily → auto-routes to 20_Personal/03_To-Do/
│
├── journal
│   └── tag #journal → auto-routes to 20_Personal/02_Journal/
│
├── concept
│   └── tag #knowledge/concept → auto-routes to 20_Personal/04_Learning/Concepts/
│
├── how-to
│   └── tag #knowledge/how-to → auto-routes to 20_Personal/04_Learning/How-Tos/
│
├── resource
│   └── Manual filing. Tag #resource/external.
│       Place contextually: near the project or topic it relates to.
│
├── person
│   └── tag #people → auto-routes to 20_Personal/01_People/
│
├── project
│   └── tag #project/active → auto-routes to 20_Personal/00_Project/
│
├── task
│   └── tag #task/todo → auto-routes to 20_Personal/02_Journal/
│
├── book
│   └── tag #resource/book → auto-routes to 20_Personal/04_Learning/Books/
│
└── company
    └── Manual filing.
        Path: 10_Work/[company]/ (root of that company's folder)
        Tag:  #crm/company
        Example: 10_Work/00_Acme/acme.md
```

---

## Auto-Mover vs Manual Filing

**Auto-routed:** The note will be moved to the correct folder automatically by Auto Note Mover when opened in Obsidian. You still need the correct tag — the mover fires on the tag, not the type.

**Manual filing:** You must place the file in the correct path yourself. The tag exists for querying purposes but does not trigger the mover.

| Type | Auto or Manual |
|---|---|
| `ticket` | Manual |
| `meeting` | Auto (via company-specific tag) |
| `meeting-hub` | Manual |
| `daily-todo` | Auto |
| `journal` | Auto |
| `concept` | Auto |
| `how-to` | Auto |
| `resource` | Manual |
| `person` | Auto |
| `project` | Auto |
| `task` | Auto |
| `book` | Auto |
| `company` | Manual |

---

## Special Case: Excalidraw Files

All Excalidraw files (`.excalidraw.md`) go to `00_System/Drawings/` — always, regardless of whether the drawing is work or personal. The plugin is configured to save new files there automatically.

**The zero-friction workflow:** type `[[Drawing Name.excalidraw]]` as a wikilink inside any note. Click it — the plugin creates the canvas file in `00_System/Drawings/` and opens it. The link in your source note is already live; nothing to backfill.

**Mermaid diagrams** stay as plain text in whatever note they belong to (ticket scratchpad, meeting note, how-to). For interactive zoom/pan, use Cmd+P → "Insert Mermaid" inside an Excalidraw canvas to convert them.

---

## When the Note Spans Two Types

If a note genuinely could be two things (e.g., a how-to that's also tied to a ticket), pick the primary purpose:
- If it's reference documentation for a codebase pattern → `how-to`
- If it's working notes on an active ticket → `ticket`
- If it's a diagram of the system → use an Excalidraw file in `00_System/Drawings/`

Link between the notes using `[[wikilinks]]` in the `## 🔗 Connected To` or `## 🔗 Linked Database` sections.
