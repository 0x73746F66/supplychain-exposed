---
title: "A Number Is Not a Fact"
weight: 7
slug: "a-number-is-not-a-fact"
kicker: "Chapter Six"
subtitle: "The score compresses the facts, then hides them."
---

Every queue in the building sorts on it. The 9.8 goes to the top, the 6.1 waits its turn, and a number nobody in your organization computed decides what your week looks like. So ask the question this whole book is built on. Would the vulnerability be one shade more or less dangerous if the score had never been calculated? It would not. The exploit runs or it does not. The vulnerable path is reachable or it is not. The asset faces the internet or it sits on a private subnet no one can route to. None of that moves when you delete the score, which is the tell that the score was never the thing keeping you safe. It was a label stuck on the thing, and you have spent years treating the label as the medicine.

Look at what the number is made of, and watch where the facts go. CVSS takes the handful of things that actually decide your response — whether it is being exploited, whether the weak path is exposed, what it costs you if it gives — and runs them through a formula that returns a single figure between zero and ten. The inputs are facts. The output is not. A 9.8 is not a fact; it is an algorithm's compression of several facts into one number, and the compression is lossy on purpose. The reasons go in and they do not come out. You are handed the nine point eight and then forbidden, by the very shape of the thing, from asking which fact made it a nine point eight, because the formula has already thrown that away.

> A 9.8 is not a fact. It is a fact set on fire, and the ash handed back with a number on it.

This is the part that should end the argument. A score cannot be scrutinized. When the tool says 9.8 you cannot interrogate it, because the only honest account of where it came from is that the algorithm said so. You cannot tell from the badge whether it is a nine point eight being exploited this morning on an internet-facing box, or a nine point eight that needs a local account, a stolen certificate, and a victim willing to click. Both wear the same number. The number was sold to you as a way to rank your work, and it cannot tell a live round from a blank.

---

The alternative is not a better number. It is no number. A decision is not a magnitude, it is a choice, and the way you make a choice you can stand behind is to lay the facts out in the open and let them carry you to the outcome. That is what a decision method like SSVC is for. It asks the questions that actually matter — is exploitation happening, is the system exposed, can the attack be automated, what is the technical impact, what is the mission impact — and each answer routes to the next until you arrive at an action: act now, track it, attend to it on the normal cycle. Every step is a fact, stated plainly, and a fact is a thing you can check. Either exploitation is active or it is not. There is nothing to argue over and nowhere for the reasoning to hide. When the tree says act, you can put your finger on every fact that led there. When the score says 9.8, there is nothing underneath to point at.

Probability has a place in this, and it is a narrow one. While the facts do not exist yet — no observed exploitation, no public proof, nothing to point to — a forecast like EPSS is a fair way to bet on what is coming. But it earns its keep only in the absence of facts, and it turns into a liability the moment they arrive. Once you know the thing is being exploited, the probability that it might be is worse than useless, because it tempts you to discount evidence you already hold. A forecast is a stand-in for proof. When the proof walks in, you retire the stand-in. You do not keep ranking a live exploit by the odds it was ever going to happen.

This is the catalog's failure, compounded. The last chapter showed the ledger arriving after the exploit; the score is a second fiction stacked on the first, a confident figure laid over data that was already late and already full of holes. Good data, the kind the next chapter demands, carries the facts a decision can be built from — exploited or not, reachable or not, fixed or not — structured so that a machine, or a tired human at midnight, can read them and act. A score carries none of that. It is the facts, deleted, with a number standing where they used to be.

So stop ranking the world by a figure no one can defend. **Stop scoring. Start deciding, in the open, where the decision can be checked.** A number cannot be questioned, and anything in security that cannot be questioned is not a control. It is a comfort.
