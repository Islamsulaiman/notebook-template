# REF — Property Format Rules

Specific formatting rules for field values. Each rule states what to do and why.

---

## Rule 1: Always wikilink relational fields

**Fields:** `company:`, `attendees:`, `people:`, `series:`

Always use `[[wikilink]]` syntax, even if the target note doesn't exist yet.

```yaml
# CORRECT
company: "[[acme]]"
attendees:
  - "[[Person A]]"
  - "[[Person B]]"

# WRONG
company: Acme
company: "Acme"
company: "[[10_Work/00_Acme/acme|Acme]]"   ← no path-qualified links
```

**Company wikilinks must be lowercase** and match the exact filename. If your company file is `acme.md`, use `"[[acme]]"`.

---

## Rule 2: Date format is always `YYYY-MM-DD`

```yaml
# CORRECT
date_created: 2026-06-10
date: 2026-06-10

# WRONG
date_created: "2026-06-10"   ← no quotes needed
date_created: 10/06/2026
date_created: 12/10/2025     ← ambiguous MM/DD or DD/MM
```

---

## Rule 3: Enum fields take a single scalar value

YAML comment lines above a field show the valid options. Write only one value on the field line itself.

```yaml
# CORRECT
# status options: Todo | In Progress | Done
status: In Progress

# WRONG
status: "[Todo, In Progress, Done]"    ← this is a string, not a value
status:
  - In Progress                        ← this is a list, not a scalar
```

---

## Rule 4: YAML comment lines are hints, never values

Lines beginning with `#` inside frontmatter are read-only hints for agents and humans. Never write a `#` comment line as the value of any property.

```yaml
# CORRECT — comment is a hint, value is on the next line
# relationship options: Teammate | Manager | Mentor | Friend | Family | External
relationship: Teammate

# WRONG
relationship: "# Teammate | Manager | Mentor | Friend | Family | External"
```

---

## Rule 5: `ticket_id:` must always be populated on ticket notes

If blank, extract from:
1. `Ticket link:` URL — the last path segment (e.g. `https://...atlassian.net/browse/IAI-1240` → `IAI-1240`)
2. The note's H1 title (e.g. `# [IAI-1240 Attachments not clearing...]` → `IAI-1240`)

```yaml
# CORRECT
ticket_id: IAI-1240

# WRONG
ticket_id:           ← blank on a completed or in-progress ticket
```

---

## Rule 6: `date_completed:` stays blank until the ticket is done

```yaml
# In Progress ticket
status: In Progress
date_completed:      ← blank, correct

# Done ticket
status: Done
date_completed: 2026-06-10    ← populated, correct
```

---

## Rule 7: `attendees:` is always a YAML list

Even for a single attendee.

```yaml
# CORRECT
attendees:
  - "[[Person Name]]"

# WRONG
attendees: "[[Person Name]]"
attendees: Person Name
```

---

## Rule 8: `series:` is blank for ad-hoc meetings

Only populate it when the meeting is an instance of a recurring series that has its own `meeting-hub` note.

```yaml
# Recurring meeting
series: "[[Backend Engineering Sync Hub]]"

# One-off meeting
series:              ← blank, correct
```

---

## Rule 9: `Phone no.:` has a period in the key name

This is the property as defined in the template. Do not simplify it.

```yaml
# CORRECT
Phone no.:

# WRONG
phone:
phone_no:
```

---

## Rule 10: `status:` in `company` notes is a scalar, not a list

```yaml
# CORRECT
status: Active

# WRONG
status:
  - Active
```
