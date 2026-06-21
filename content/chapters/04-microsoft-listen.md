---
title: "Microsoft, Listen"
weight: 5
slug: "microsoft-listen"
kicker: "Chapter Four"
subtitle: "Move the clock to the only place it does any good."
epigraph: "The control was never the cooldown. It was the detection."
---

Everything so far has been about where *not* to put the clock. This chapter is about who can move it, and it is a very short list. In fact it is one name.

Microsoft, listen.

You own the registry. You own the advisory database. You own the developer platform that most of the world's software passes through on its way to being run. No one else on earth can do what I am about to describe in a single decision, because no one else holds all three at once. That is not a burden. It is a once-in-an-ecosystem amount of leverage, and right now you are spending it on a timer.

You can be the company that turned npm from the largest malware distribution channel in the history of open source into the **first registry that stops malware at the door** — before it is ever installable, using detection you already run. The detection exists. You operate it. Today it watches the registry from the outside and files takedowns after the fact, which is to say it works exactly one beat too late, every time, by design. The malicious version goes live, the install window opens, the attacker gets his head start, and only then does the clock you handed your users begin to count.

> Or you can keep shipping timers that begin counting after the attacker has already had his week.

Think about what the cooldown is actually conceding. It is an admission that publishing and protecting have been allowed to drift apart — that a package becomes installable *first* and gets looked at *second*, and the only lever left to the rest of us is to stall in the gap and hope someone else gets bitten before our window closes. The seven days are not a safety margin. They are the size of the hole.

Close the hole. Run the detection at publish.

A package arrives. Before it is resolvable, before a single `install` can pull it, before the version number exists to the rest of the world, it passes through the detection you already own. Known-bad: refused, permanently, never installable. Clean: published in the seconds it takes to scan, no week-long tax on anybody's fix. Suspicious: held and surfaced to a human while it is still nobody's dependency. The clock still exists — but now it runs in front of the attacker instead of behind him, and it runs for him, not for the developer reaching for a patch.

This is the whole demand, and it is not subtle:

**Registries must scan before they publish.** Detection belongs at the moment of publication, at the source, in the one position where it can refuse an attacker instead of merely delaying a defender. Publishing without scanning is not a neutral default. It is a choice to distribute first and inspect later, and on npm — where publishing and distributing are the same act, with nothing in between — that choice means the malware is installable the instant it is uploaded.

You do not need new technology to do this. You need to move detection you already operate from *after* the door to *at* it. The control was never the cooldown. It was the detection. Ship the detection, at publish, where it belongs — and move the clock to the only place it does any good: in front of the attacker, rather than behind him.
