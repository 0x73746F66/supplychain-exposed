---
title: "Detection Was the Control"
weight: 9
slug: "detection-was-the-control"
kicker: "Coda"
subtitle: "Put it where publishing happens, and the rest follows."
epigraph: "Detection was the control all along, and its home is the source."
---

Hold the whole argument in one hand. The cooldown takes credit for a takedown it did not perform. The catalog records what is convenient and omits what is killing you. The scanner guesses at a tree the package manager already built, and bills you for the guess. Three different failures, one shape — a control standing where it can take the credit, not where it can do the work. Pull the detection out from under each, and there is nothing left to defend.

So put detection where it actually changes the outcome: at the source, at the moment of publication, in front of the attacker. Everything else in this book is a consequence of that one move. Scan before you publish, and the cooldown has nothing left to do. Track the malware as a first-class object, and the catalog stops lying by omission. Free the data and feed it to the things doing the installing, and the agent at the keyboard reasons with facts instead of folklore. Trust the package manager that did the install, gate the unsafe thing at `--install-unsafe`, treat a hash mismatch as the malware it almost always is, and the truth lives where the work happened. None of these are separate programs. They are the same sentence, read from different ends.

> The control was never the cooldown, the number, or the brand. It was the detection. It always was.

---

I will leave you with the campaign that makes the abstraction concrete. Attackers rewrote orphaned AUR build scripts to pull a malicious npm dependency and steal the credentials of Arch users. The hijacked package looked clean and old, so a cooldown saw nothing to wait on — its age was the whole disguise. A package-age gate inspected exactly the wrong property and waved the attack through. Detection run on the artifact, at the moment it entered the chain, caught the vector. The timer trusted what the attacker bought. The detection looked at what the attacker did.

That is the entire difference, and it is not theoretical for me. The automation that caught and blocked that vector exists. It runs. And the offer is open and unconditional:

**I will donate it to any registry willing to run it at publish.** Not license it, not pilot it behind a sales process — donate it, to put detection at the door where it belongs, for whoever owns a door. The control was sitting in the wrong place this whole time. Move it to the source, and the supply chain stops being the softest target in computing.

Detection was the control all along. Its home is the source. Take it home.
