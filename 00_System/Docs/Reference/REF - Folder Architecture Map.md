# REF — Folder Architecture Map

Complete directory tree. Every folder listed with its purpose and what note types live there.

---

```
notebook/                               ← Vault root
│
├── CLAUDE.md                           ← Agent orientation (read first)
├── 🧭 To-Do Hub.md                     ← Dataview dashboard: open daily to-dos
├── 🧭 Questions Backlog.md             ← Dataview dashboard: open ❓ questions across all notes
│
├── 00_System/                          ← Infrastructure — excluded from auto-routing entirely
│   ├── Attachments/                    ← Obsidian attachment folder (images, PDFs)
│   ├── Drawings/                       ← ALL Excalidraw files (.excalidraw.md), work and personal
│   ├── Templates/                      ← All TPL - *.md template files
│   └── Docs/                           ← YOU ARE HERE — AI agent documentation
│       ├── 00_INDEX.md
│       ├── Reference/
│       └── How-To/
│
├── 10_Work/                            ← Professional context, organized by company
│   ├── 00_CompanyA/                    ← Example: past or secondary employer
│   │   ├── companya.md                 ← Company note (type: company) — lowercase filename
│   │   └── Meetings/                   ← Meeting notes (tag: #meeting/companya)
│   │
│   └── 01_CompanyB/                    ← Example: current employer
│       ├── companyb.md                 ← Company note (type: company) — lowercase filename
│       ├── Meetings/                   ← Meeting notes (tag: #meeting/companyb)
│       └── Tickets/                    ← Jira ticket notes (tag: #task/jira, manual filing)
│           └── [Epic Name]/
│               └── Tickets implemented/
│                   └── [ticket].md
│
└── 20_Personal/                        ← Personal context
    ├── 00_Project/                     ← Personal project hubs (tag: #project/active)
    ├── 01_People/                      ← All contacts (tag: #people)
    ├── 02_Journal/                     ← Daily journal entries (tag: #journal)
    ├── 03_To-Do/                       ← Daily task lists (tag: #task/daily)
    └── 04_Learning/                    ← Knowledge base
        ├── Books/                      ← Book notes (tag: #resource/book)
        ├── Concepts/                   ← Atomic concept notes (tag: #knowledge/concept)
        ├── How-Tos/                    ← Procedural guides (tag: #knowledge/how-to)
        └── Tools/                      ← Tool learning & reference notes (tag: #knowledge/tool)
```

---

## Key Rules for Agents

**Ticket filing is always manual.** There is no auto-routing for `#task/jira`. The correct path is:
```
10_Work/[company folder]/Tickets/[Epic Folder]/Tickets implemented/[filename].md
```
If no epic folder exists yet, create one matching the epic name from Jira. Never create the company folder itself — see HOW-TO - Migrate a Jira Ticket for company resolution rules.

**Company filenames must be lowercase.** All `company:` fields that reference them must use the lowercase wikilink (e.g. `"[[acme]]"` not `"[[Acme]]"`). This is required for Obsidian to resolve the link correctly.

**`00_System/` is fully excluded from auto-routing.** The auto-mover will never touch anything inside it.

**All Excalidraw files go to `00_System/Drawings/`** regardless of whether they are work or personal. Navigation is via wikilinks from the relevant note, not by folder browsing. The plugin is configured to save all new drawings here automatically.
