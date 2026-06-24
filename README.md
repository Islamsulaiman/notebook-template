# Obsidian Vault Template

A structured personal knowledge base built on Obsidian, designed for engineers managing work notes, learning, and personal context in one place.

## What's included

- **Folder architecture** — PARA-hybrid structure with numeric prefixes for stable ordering
- **14 note types** — templates for tickets, meetings, people, tools, books, concepts, how-tos, journals, and more
- **Auto-routing** — notes file themselves automatically based on tags (via Auto Note Mover plugin)
- **Agent-ready** — `CLAUDE.md` and `AGENTS.md` orient AI assistants to vault conventions
- **CSS snippets** — Notion-style inline code highlighting, Mermaid diagram scaling
- **Full docs** — Diátaxis-based reference and how-to guides in `00_System/Docs/`

## Getting started

1. Open this folder as a vault in Obsidian
2. Install community plugins: **Templater**, **Auto Note Mover**, **Dataview**, **Obsidian Git**, **Excalidraw**
3. Read `00_System/Docs/00_INDEX.md` for the full reference
4. Update `CLAUDE.md` and `AGENTS.md` — replace the `10_Work/` company placeholders with your own companies
5. Configure the Auto Note Mover rules (`.obsidian/plugins/auto-note-mover/data.json`) to match your company meeting tags

## Structure

```
00_System/    Templates, CSS, docs, Excalidraw drawings
10_Work/      One subfolder per company — Meetings/ and Tickets/ inside each
20_Personal/  Projects, people, journal, to-dos, and learning (books, concepts, tools, how-tos)
```
