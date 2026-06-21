---
title: "Set the Data Free"
weight: 7
slug: "set-the-data-free"
kicker: "Chapter Six"
subtitle: "Intelligence that cannot move at machine speed is a museum piece."
---

If the catalog is a lagging indicator, the answer is not a better catalog. It is to stop treating vulnerability intelligence as a publication and start treating it as a feed, something that moves, in the open, fast enough to matter to a machine.

Here is the standard the data has to meet, and most of what we have fails at least one part of it. Vulnerability data must be free, because a defense only the well-funded can afford is not a defense of the ecosystem, it is a moat. It must be accessible, pullable over an open API rather than scraped out of an HTML table or begged for in a sales call. It must be well-formed, a stable schema a program can rely on instead of prose a human has to interpret. It must be enriched, carrying severity, exploit status, affected functions, fixed versions, and references that resolve, because a bare identifier with an empty body is a homework assignment, not intelligence. And it must be good: precise, corrected when wrong, free of the lazy version ranges that mark a whole package vulnerable forever.

The reason this matters now, and did not a few years ago, is that the consumer changed. The thing reaching for this data is increasingly an AI coding agent, writing the dependency line, choosing the version, opening the pull request. An agent cannot phone a vendor or read between the lines of a vague advisory. It needs structured, enriched, trustworthy facts at the moment of the edit, or it will confidently install the wrong thing. Feed it a 1999 ledger and it reasons like it is 1999. Feed it good data and it becomes the fastest defender in the building.

---

There is a second consumer, just as starved: the community sharing indicators of compromise. When a malicious package is moving, the useful unit is not a press release weeks later. It is the IOC, now, shared widely and faster than any numbering system will ever publish. And it has to be shareable in a way that preserves the privacy of the people reporting it, so an organization can contribute a sighting without disclosing that it was hit. Intelligence that arrives after the numbering committee has met has arrived after the incident. The whole value is in the lead time, and the lead time only exists if the data is allowed to move before the paperwork does.

None of this requires a single authoritative source. It requires the opposite. The cure for a catalog that omits things is to stop depending on any one catalog. Aggregate. Pull from GCVE, from OSV, from GHSA, and from every vendor's own advisory and patch feed, and reconcile them, so a gap in one is covered by another and the focus lands where it belongs, on the fix rather than on the false negatives of a single low-quality CVE feed read in isolation. Do it yourself, or use something that already does. An aggregator like Vulnetix exists precisely because no one feed is complete and the union of them is.

Free, accessible, well-formed, enriched, good. That is not a wish list. It is the minimum specification for data that can keep up with an exploit that now lands before its own advisory, and it is the raw material every other demand in this book quietly depends on.
