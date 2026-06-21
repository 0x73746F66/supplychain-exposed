---
title: "The Myths, Answered"
weight: 3
slug: "the-myths-answered"
kicker: "Chapter Two"
subtitle: "Every defense of the cooldown fails twice."
---

Defend the cooldown for long enough and the replies settle into a handful of recurring claims. Here they are, answered in order. Each one fails twice. It aims at the wrong question, and the answer it assumes is wrong on its own terms.

"It is free, and it is the best protection per unit of effort." Free measures input, not output. A control is worth what it catches that nothing else would, and a cooldown catches nothing detection was not already going to catch. You are pricing the wrapper, not the contents. The real cost is not the line of config. It is every security fix you delay, which is the opposite of free.

"It is defense in depth, and more layers are good." Depth means layers that fail independently. A cooldown has no failure mode of its own. It fails when detection fails and succeeds when detection succeeds. A layer that only works when another layer already worked is not depth. It is a duplicate, and this duplicate has a failure the original lacks: it blocks good releases. It does not add to depth. It subtracts.

"Almost nobody needs a package the instant it is published." True for features, irrelevant for fixes. The release you are delaying is disproportionately a patch, because a patch is what gets published in response to a disclosure. The rule "wait a week on everything" therefore blocks the one release you most need, on the one timeline where waiting hurts.

"Even if detection usually wins, the cooldown covers the cases it misses." This inverts the data. Detection misses slow, low-profile malware that nobody is watching, and a seven-day cooldown does not outlast slow detection either. The timer filters fast-detected malware, where it is redundant, and waves through slow-detected malware, where you needed the help. Its coverage is the complement of your need.

"Attackers time fast-follow attacks to the publish window, so a cooldown defeats the timing." The timing attack targets auto-upgraders, and the cure for that is to stop auto-upgrading. Pin, use a lockfile, run `npm ci`. A cooldown still auto-pulls, only later. It moves the start line without removing the race. And because the window is a fixed, published number, a patient attacker simply ages the malicious version past it before triggering the payload. A cooldown does not deter that attacker. It schedules him.

"It would have protected the Arch users." The AUR has no cooldown, and the Atomic campaign shipped through old, trusted, orphaned packages whose age was the camouflage. The malware arrived as a freshly published npm dependency the build script pulled in, which a package-age gate never inspects. A cooldown trusts exactly what that campaign abused, an established package that had sat quietly for years. The thing the timer rewards is the thing the attacker bought.

---

Every defense of the cooldown turns out to be a description of detection with the credit reassigned, or a description of a control that does not exist. The honest version of each claim points somewhere else: to threat feeds, to disabled install scripts, to provenance, to pinned lockfiles, to detection run at publish. Those answer the supporter's real concern. The timer only answers the feeling.

Keep it to minutes, behind real detection. Everything past that is a myth with a clock on it.
