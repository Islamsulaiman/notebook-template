# HOW-TO — Populate Frontmatter Without Errors

A checklist of the most common frontmatter mistakes and how to avoid them. Run through this before finalizing any note.

---

## Checklist

### ✅ `type:` is set and matches the schema

Look up the correct value in [REF - Frontmatter Schema Registry](../Reference/REF%20-%20Frontmatter%20Schema%20Registry.md).

```yaml
type: ticket     ← correct
type: Ticket     ← wrong (case-sensitive)
type: jira       ← wrong (not a valid type)
```

---

### ✅ All enum fields have a single scalar value

Fields with `# options: A | B | C` hints must have exactly one of those values. Never write the hint string itself as the value.

```yaml
# status options: Todo | In Progress | Done
status: In Progress     ← correct

status: "[Todo, In Progress, Done]"    ← wrong
status:
  - In Progress                        ← wrong
```

---

### ✅ All relational fields use `[[wikilink]]` syntax

```yaml
company: "[[acme]]"          ← correct
attendees:
  - "[[Person Name]]"        ← correct

company: Acme                ← wrong
company: acme                ← wrong (no wikilink)
company: "[[10_Work/00_Acme/acme|acme]]"   ← wrong (path-qualified)
```

---

### ✅ Company filename casing must match the wikilink

Company note files must be lowercase (e.g. `acme.md`). `[[Acme]]` will not resolve correctly in Dataview string comparisons.

```yaml
company: "[[acme]]"    ← correct
company: "[[Acme]]"    ← wrong
```

---

### ✅ All dates are in `YYYY-MM-DD` format without quotes

```yaml
date: 2026-06-10           ← correct
date: "2026-06-10"         ← unnecessary quotes (but not breaking)
date: 10/06/2026           ← wrong
date: 10-06-2026           ← wrong
```

---

### ✅ `ticket_id:` is populated on ticket notes

```yaml
ticket_id: IAI-1240    ← correct
ticket_id:             ← wrong if the ticket is in progress or done
```

To find it: look at `Ticket link:` and copy the last URL path segment.

---

### ✅ Optional blank fields are left truly blank

An optional field with no value should be an empty line, not a placeholder string.

```yaml
date_completed:            ← correct (blank)
date_completed: N/A        ← wrong
date_completed: TBD        ← wrong
series:                    ← correct (blank for ad-hoc meeting)
series: none               ← wrong
```

---

### ✅ `attendees:` is a YAML list even for one person

```yaml
attendees:
  - "[[Person Name]]"     ← correct

attendees: "[[Person Name]]"    ← wrong (scalar, not list)
attendees: []            ← acceptable for unknown attendees, but add names if known
```

---

### ✅ YAML comment lines (`#`) are not echoed as values

Comment lines starting with `#` inside frontmatter are hints. They stay in the file as-is; the value goes on the line below.

```yaml
# relationship options: Teammate | Manager | Mentor | Friend | Family | External
relationship: Teammate     ← correct: comment stays, value on next line

relationship: "Teammate | Manager | Mentor | Friend | Family | External"   ← wrong
```

---

## Quick Diagnosis: Dataview Shows No Results

If a Dataview query returns nothing for a note you just created, check in this order:

1. **Is `type:` correct?** — queries often filter by type
2. **Is the tag correct?** — check [REF - Tag Taxonomy](../Reference/REF%20-%20Tag%20Taxonomy%20%26%20Routing%20Map.md)
3. **Is `status:` a scalar string?** — list syntax breaks status filters
4. **Is `date:` / `date_created:` in `YYYY-MM-DD`?** — Dataview date parsing fails on other formats
5. **Is `company:` a wikilink?** — bare strings don't match wikilink-based queries
