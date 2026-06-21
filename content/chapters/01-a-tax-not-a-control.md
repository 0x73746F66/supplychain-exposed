---
title: "A Tax, Not a Control"
weight: 2
slug: "a-tax-not-a-control"
kicker: "Chapter One"
subtitle: "The cooldown manufactures no protection of its own."
---

The JavaScript ecosystem has talked itself into a comforting idea: that refusing to install any package version younger than a few days protects you from supply-chain attacks. pnpm defaults it on. npm, Yarn, and Bun shipped it. There is a serious proposal to make a seven-day cooldown the npm default. The pitch is always the same — free, one line of config, the best protection per unit of effort going.

It is also wrong, and you already have the tool to prove it. Ask of every claim made for cooldowns: would it still be true if cooldowns had never been invented?

Run it on the headline. *Malicious releases get caught and pulled within hours.* True, and entirely independent of any timer. Researchers and registry teams remove bad versions on a schedule your config cannot influence. The cooldown does not detect the package, does not report it, does not accelerate its removal by a single minute. Its output is fully contingent on a detection event it neither causes nor speeds up — and zero in every case where detection fails. If a low-profile malicious package is never caught, your seven-day cooldown installs it on day seven, still malicious. The timer only ever "works" in the exact case where detection was already fast enough to make it redundant.

> A cooldown is not a control. It is a control's reflection, and it disappears the moment the control looks away.

Here is the same thing in a language an executive cannot misread.

A retailer learns that organized crews are hitting its stores a full week before the police are even told the pattern exists. The retailer announces its response: *we will not review our own security footage for the first seven days after we hear about a theft ring, because the police might identify the crews and send us their photos.* The absurdity lands instantly. The police may help. The police may not. But the retailer is deliberately choosing not to use the cameras it already owns during precisely the window when the criminals are most active. That is a cooldown. The cameras are detection. The registry already has the footage.

---

The danger is not that the timer is inert. It is that people believe it is not. A team that switches on cooldowns thinks it bought protection; it only rescheduled its installs to land behind someone else's detection. That false confidence displaces the control that actually works. The worst thing about a placebo is that you stop taking the medicine.

And once you have attributed the imaginary protection back to detection, only the cost is left. A time gate cannot tell a malicious fast-follow from a security fix. It knows age, not intent, so it blocks both. In 2024 that was survivable, because exploitation still lagged disclosure by weeks. Not anymore. Sysdig's Zero Day Clock tracks median time-to-exploit falling from 771 days in 2018 to four hours by 2024. Mandiant's M-Trends 2026 reports a mean time-to-exploit of roughly *negative* seven days. CrowdStrike finds 42 percent of exploited vulnerabilities are hit before they are public. Against that curve, a multi-week cooldown makes one promise: when the fix for an actively exploited dependency ships, I will refuse to install it for weeks.

Zero upside. Guaranteed downside. That is not a weak control. It is a negative one — a tax you pay in delayed fixes for a protection you never received.
