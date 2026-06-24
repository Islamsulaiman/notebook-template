# REF — Frontmatter Schema Registry

Complete property definitions for every note type. **R** = Required. **O** = Optional.

---

## `ticket` — Jira Ticket

```yaml
type: ticket                              # R — always literal "ticket"
ticket_id: IAI-1240                       # R — extract from URL or title, never leave blank
Ticket link: https://...atlassian.net/... # R — full Jira URL
company: "[[acme]]"                       # R — wikilink to company note (lowercase filename)
status: In Progress                       # R — Todo | In Progress | Done
priority: Medium                          # R — High | Medium | Low
date_created: 2026-06-02                  # R — YYYY-MM-DD
date_completed:                           # O — YYYY-MM-DD, leave blank if not done
tags:
  - task/jira                             # R — always this tag; not auto-routed (manual filing)
```

**Note on `ticket_id`**: If blank in existing note, extract from `Ticket link:` URL (last path segment) or from the note's H1 title. Always populate before completing the note.

---

## `meeting` — Single Meeting Instance

```yaml
type: meeting                             # R
company: "[[acme]]"                       # R — wikilink to company note (lowercase)
series:                                   # O — [[Meeting Series Hub note]] if recurring; blank if ad-hoc
date: 2026-06-10                          # R — YYYY-MM-DD
attendees:                                # O — list of wikilinks
  - "[[Person Name]]"
tags:                                     # R — pick the matching company subtag
  - meeting/acme                          # use meeting/<yourcompany>
```

---

## `meeting-hub` — Recurring Meeting Series

```yaml
type: meeting-hub                         # R
frequency: Weekly                         # R — Weekly | Daily | Bi-Weekly | Monthly
company: "[[acme]]"                       # R — wikilink to company note (lowercase)
tags:
  - meeting/hub                           # R — not auto-routed, manual filing
```

---

## `daily-todo` — Daily Task List

```yaml
type: daily-todo                          # R
date: 2026-06-10                          # R — YYYY-MM-DD
tags:
  - task/daily                            # R → auto-routes to 20_Personal/03_To-Do/
```

---

## `journal` — Daily Journal Entry

```yaml
type: journal                             # R
date: 2026-06-10                          # R — YYYY-MM-DD
tags:
  - journal                               # R → auto-routes to 20_Personal/02_Journal/
```

---

## `concept` — Atomic Knowledge Note

```yaml
type: concept                             # R
topic:                                    # O — broad subject area (e.g. "Database", "Ruby on Rails")
date_created: 2026-06-10                  # R — YYYY-MM-DD
tags:
  - knowledge/concept                     # R → auto-routes to 20_Personal/04_Learning/Concepts/
  - permanent_note                        # R — always include this second tag
medium: Book                              # O — Book | Course | Article | Experience
```

---

## `how-to` — Procedural Knowledge Note

```yaml
type: how-to                              # R
company: "[[acme]]"                       # O — wikilink to company note; blank for personal how-tos
project:                                  # O — freeform string describing context
date_created: 2026-06-10                  # R — YYYY-MM-DD
tags:
  - knowledge/how-to                      # R → auto-routes to 20_Personal/04_Learning/How-Tos/
```

---

## `tool` — Tool Learning & Reference Note

```yaml
type: tool                                # R — always literal "tool"
# source options: External | Internal
source: External                          # R — External (third-party tools) or Internal (in-house tooling)
tool_url:                                 # O — homepage or docs URL
# status options: Learning | Active Use | Archived
status: Learning                          # R — Learning | Active Use | Archived
date_added: 2026-06-10                    # R — YYYY-MM-DD
tags:
  - knowledge/tool                        # R → auto-routes to 20_Personal/04_Learning/Tools/
```

**Notes:**
- `source: Internal` for any in-house or proprietary tooling built by your company
- `source: External` for third-party tools (Datadog, Honeycomb, Linear, etc.)
- Status never becomes "Finished" — tools are ongoing; use `Archived` when a tool leaves your stack

---

## `resource` — Saved External Link

```yaml
type: resource                            # R
url:                                      # R — full URL
project:                                  # O — freeform string
date_saved: 2026-06-10                    # R — YYYY-MM-DD
tags:
  - resource/external                     # R — not auto-routed, manual filing
```

---

## `person` — Contact / People Note

```yaml
type: person                              # R
company: "[[acme]]"                       # O — wikilink to company note (lowercase)
role:                                     # O — job title or description
relationship:                             # O — Teammate | Manager | Mentor | Friend | Family | External
email:                                    # O
Phone no.:                                # O
tags:
  - people                                # R → auto-routes to 20_Personal/01_People/
```

---

## `project` — Project Hub

```yaml
type: project                             # R
status: Active                            # R — Active | Inactive
people:                                   # O — list of wikilinks to Person notes
tags:
  - project/active                        # R → auto-routes to 20_Personal/00_Project/
```

---

## `task` — Project Task

```yaml
type: task                                # R
project:                                  # O — freeform or wikilink to Project Hub
status: Todo                              # R — Todo | In Progress | Done
start_date: 2026-06-10                    # R — YYYY-MM-DD
end_date:                                 # O — YYYY-MM-DD
tags:
  - task/todo                             # R → auto-routes to 20_Personal/02_Journal/
```

---

## `book` — Book Note

```yaml
type: book                                # R
author:                                   # R — author name(s)
status: To Read                           # R — To Read | Reading | Finished
date_finished:                            # O — YYYY-MM-DD
rating:                                   # O — e.g. 4/5
tags:
  - resource/book                         # R → auto-routes to 20_Personal/04_Learning/Books/
```

---

## `company` — Company Note

```yaml
type: company                             # R
status: Active                            # R — Active | Past | Prospect
website:                                  # O — full URL
tags:
  - crm/company                           # R — not auto-routed, manual filing
```
