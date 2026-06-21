---
title: "The Objections I Cut"
weight: 4
slug: "the-objections-i-cut"
kicker: "Chapter Three"
subtitle: "Followed honestly, every objection lands in the same place."
---

The case against cooldowns runs long, so the objections are usually the first thing cut for space. That is backwards. The objections are where the argument gets *stronger*, because each one, followed honestly, arrives at the same destination: detection is the control, and the timer is overhead.

Start with the best one. **"Dependabot and Renovate exempt security updates, so a cooldown will not sit on a CVE fix."** True. Now ask how the bot knows to make the exception. It consults a security-advisory database, maps the new version to a known fix, and waves it through. The exemption *is* a detection feed. Remove the feed and the cooldown goes blind again and starts blocking cures. Meanwhile the install-layer cooldown everyone is actually told to turn on — npm's `min-release-age` — has no exemption mechanism at all. It cannot scope by registry, cannot tell an internal package from a stranger's, cannot let an urgent fix through. The "safe" cooldown is safe only because a different mechanism overrides its decisions. That is not a control. It is the part you could delete without changing any outcome except the ones it makes worse.

Then there is the category error hiding in the word itself. For known malware, the correct action is a *permanent block*, refused on every request, because the version never becomes safe with age. Calling that a "cooldown" misnames the thing protecting you. The same goes for typosquats, homographs, and account takeovers — none of them age out. `axois` is exactly as malicious on day thirty as on day one. A timer helps only if someone detects and removes the package during your window, which is, once again, detection doing the work while the timer takes the bow.

---

Now weigh the cooldown against the tools it is supposed to stand in for, because the claim is not merely that it is weak. It is that it is *dominated* — beaten on every axis by something more targeted.

- **Known-bad threat feeds** block the malicious artifact on the first install attempt and let the fix through.
- **Disabling install scripts**, which npm is finally doing by default, removes the execution vector most of these attacks ride in on, regardless of timing.
- **Provenance and trust-policy checks** flag the missing attestation of a stolen-token publish instantly.
- **Lockfiles and `npm ci`** remove the unattended auto-upgrade that makes the publish-window race dangerous in the first place.

Every one of these is targeted, and none of them taxes a fix. The cooldown is the only option that is blind to intent, universal in scope, and inverted against the fastest-growing class of risk. It loses to all of them.

I will concede the one case the timer earns. There is a real gap between a malicious version going live and it appearing in any feed, including the best ones — no detection is instant. A very short cooldown, minutes or a few hours, sitting *behind* a real detection layer, defers you across that gap until detection catches up. Note that even here the timer detects nothing; it schedules you behind protection that is about to act. That value is spent within hours of publication. Every day beyond it buys nothing but a rising probability of blocking a fix, and a quiet bet that some other team gets burned first so the package is pulled before your window ends.

> That is not a defense. It is free-riding with a stopwatch.

So keep the knob if you want it, and keep it honest: minutes, behind detection, never days. The long cooldown was never the control. It was the comfortable feeling of one.
