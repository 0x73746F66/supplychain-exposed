---
title: "A Tax, Not a Control"
weight: 2
slug: "a-tax-not-a-control"
kicker: "Chapter One"
subtitle: "The cooldown manufactures no protection of its own."
---

The JavaScript ecosystem has talked itself into a comforting idea. Refusing to install any package version younger than a few days, the story goes, protects you from supply-chain attacks. pnpm defaults it on. npm, Yarn, and Bun shipped it. There is a serious proposal to make a seven-day cooldown the npm default. The pitch never changes: free, one line of config, the best protection per unit of effort going.

It is also wrong, and you already have the tool to prove it. Ask of every claim made for cooldowns whether it would still be true if cooldowns had never been invented.

Run it on the headline. *Malicious releases get caught and pulled within hours.* True, and entirely independent of any timer. Researchers and registry teams remove bad versions on a schedule your config cannot influence. The cooldown does not detect the package, does not report it, and does not accelerate its removal by a single minute. Its output depends completely on a detection event it neither causes nor speeds up, and it is zero in every case where detection fails. If a low-profile malicious package is never caught, your seven-day cooldown installs it on day seven, still malicious. The timer only ever works in the exact case where detection was already fast enough to make it redundant.

> A cooldown is not a control. It is a control's reflection, and it vanishes the moment the control looks away.

Here is the same point in a language an executive cannot misread.

A retailer learns that organized crews are hitting its stores a full week before the police are even told the pattern exists. The retailer announces its response. It will not review its own security footage for the first seven days after it hears about a theft ring, because the police might identify the crews and send over their photos. The absurdity lands instantly. The police may help. The police may not. Either way the retailer is choosing not to use the cameras it already owns during the exact window when the criminals are most active. That is a cooldown. The cameras are detection. The registry already has the footage.

---

The danger is not that the timer sits there doing nothing. It is that people believe it does something. A team that switches on cooldowns thinks it bought protection. It only rescheduled its installs to land behind someone else's detection. That false confidence then displaces the control that actually works. The worst thing about a placebo is that you stop taking the medicine.

Once you attribute the imaginary protection back to detection, only the cost is left. A time gate cannot tell a malicious fast-follow from a security fix. It knows age, not intent, so it blocks both. In 2024 that was survivable, because exploitation still lagged disclosure by weeks. Not anymore. Sysdig's Zero Day Clock tracks median time-to-exploit falling from 771 days in 2018 to four hours by 2024. Mandiant's M-Trends 2026 reports a mean time-to-exploit of roughly negative seven days. CrowdStrike finds that 42 percent of exploited vulnerabilities are hit before they are public. Against that curve, a multi-week cooldown makes exactly one promise. When the fix for an actively exploited dependency ships, it will refuse to install that fix for weeks.

Zero upside. Guaranteed downside. That is not a weak control. It is a negative one, a tax you pay in delayed fixes for a protection you never received.

And the plan is to collect it by default, from everyone, without asking. That is what a default is: the trade imposed on every developer who never opted in and was never shown the terms. They were told the registry keeps malicious packages out. They were not told the same switch would hold their security fix out too, for a week or two, across the exact window the exploit is loose. Nobody consented to that, because nobody was offered it. The malware-blocking was the pitch. The patch-blocking is the product.

And on the day a withheld fix is the reason an attacker is inside, the registry that set the default will not be standing next to you. It will note that the patch existed, that the timer could have been overridden, that the breach is therefore yours. The harm arrives wholesale, by default. The blame comes back retail, addressed to you. A registry that will not own the faults it already ships, and defends them with dogma and a tidy strawman, is not going to own this one.
