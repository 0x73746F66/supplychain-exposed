---
title: "The Package Manager Is the Source of Truth"
weight: 8
slug: "the-package-manager"
kicker: "Chapter Seven"
subtitle: "SCA is a guess. The thing that did the install is not."
---

Stand a generic software composition analysis tool next to the package manager and ask one question: which of these actually knows what is installed? Only one of them performed the install. The package manager resolved the graph, fetched the artifacts, linked them, and wrote down exactly what landed and at which version. That is not an opinion about your dependencies. It *is* your dependencies. It is, almost by definition, the source of truth — because it is the literal mechanism by which any dependency is acquired, with only a few edge cases (an environment-inherited library, a vendored copy) that a competent SBOM generator is built to catch.

Generic SCA, by contrast, stands outside and guesses. It parses a manifest, pattern-matches names against a database, and infers a tree it never built. Sometimes the guess is right. Then a lockfile changes, a resolution shifts, a platform-specific dependency appears, and the guess is quietly wrong — and you do not find out, because nothing about a guess announces its own staleness. A guess cannot be more accurate than the thing that did the work, ever, as a rule. The only way for an external tool to match the package manager is to *become* one — to apply the static-analysis techniques that actually resolve what is installed, linked, compiled, and reachable. Short of that, it is a less accurate copy of information the package manager already holds, sold back to you at a premium.

This reframes the SBOM, and the reframing is the whole point. An SBOM is meant to be a source of truth — the authoritative bill of what is in the build. So an SBOM cannot be the *output* of a tool that guessed the tree, because then your source of truth is downstream of a guess. The order is backwards everywhere you look. **A correct SBOM is an _input_ to SCA, not an output of it.** You generate the bill of materials from the thing that did the install, and *then* you evaluate that bill against vulnerability data. SCA tools should not be in the business of producing SBOMs at all. Produce the SBOM at the source; feed it to the analysis. Input, then evaluation — never the reverse.

> Whoever did the install holds the truth. Everyone else is reading tea leaves and invoicing for the brew.

---

Once you accept that the package manager is the source of truth, the package manager is also where the controls belong — and most of them are missing or broken. Two in particular.

The first is reachability with teeth. A package manager that knows the dependency graph, and increasingly knows which vulnerabilities are *reachable* in it, should not silently install a known-exploitable, reachable vulnerability and leave a note in a log nobody reads. It should stop, and it should make the human say so out loud: an explicit `--install-unsafe` to proceed, every time, no ambiguity about what is being waved through. Reachable and exploitable is not a warning. It is a gate.

The second is the hash mismatch, and the way it is handled today is close to malpractice. A lockfile pins a hash because that hash is the artifact you trust. When the registry serves something whose hash does not match, that is the single loudest malware signal in the entire workflow — and the typical tooling response is to print the *expected* and the *received* hash side by side, as if inviting the developer to copy the new one in and move on. Worse, the folk remedy that spreads on forums is to delete the lockfile so it regenerates — which means regenerating it *around the malicious artifact*, baking the attacker's hashes in as the new trusted truth. pip almost gets this right and then loses its nerve. The correct behavior is unambiguous: a hash mismatch is **likely malware**, it must be reported as likely malware in language a tired developer cannot misread, and proceeding must require something deliberately alarming — an `--allow-running-unsafe-package-installs` that no one types by reflex. Never the bad hash, pre-formatted for the clipboard. Never a nudge toward deleting the one file that was protecting them.

---

And then there is the myth that sits underneath the whole industry: *just patch it.*

There is rarely a patch. "Just patch it" assumes a fixed version is sitting there waiting, and most of the time it is not. So the real toil is not applying patches — it is developers spending their week *proving a negative*, assembling evidence that no fix exists, to hand to a security team that told them to patch and will, predictably, ignore the evidence and report the open count up the chain anyway. That is the job now: not remediation, but the documentation of impossibility, performed for an audience that is not reading it.

Meanwhile the actual work goes undone. When there is no patch, the answer is a control somewhere else — an IDS, IPS, WAF, or RASP rule that neutralizes the path; a contract with the vendor who ships your operating system, your VM image, your base container, your distribution; a fix pushed where the code actually lives. That is real, unglamorous, effective work, and it is precisely the work the "just patch it" reflex lets everyone skip.

Worse, a large share of what is being escalated was never a vulnerability in the first place. The tool matched an over-broad CPE string that flags every version, including the patched one, so you are "vulnerable" forever no matter what you ship. Or it never found a vulnerability at all — it found that a *package was present*, declared a finding, and never once checked reachability: never asked whether the affected function or module is even imported, linked, or called. Present is not affected. Installed is not exploitable.

These tools are typically expensive, typically owned by a security team that is not effective at operating them, and typically tuned so loosely that they are noise machines. The toil they generate trains everyone around them to ignore the output — so on the rare occasion the tool is right, that finding is ignored too, buried in the same stream of false positives that taught the team to look away. A control that has trained its own audience not to read it is not a control. It is detection turned all the way up and then unplugged from anyone who could act on it.

The fix runs back through every other chapter. Trust the thing that did the install. Make the SBOM an input. Aggregate good data so the findings are real. Put the gate at install, and the detection at publish. The package manager was the source of truth the whole time.
