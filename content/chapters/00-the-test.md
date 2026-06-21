---
title: "The Test"
weight: 1
slug: "the-test"
kicker: "Preface"
subtitle: "One question that settles the argument."
epigraph: "The worst thing about a placebo is that you stop taking the medicine."
---

There is one question I am going to ask over and over in this book, and I want to teach it to you now so you can ask it without me. Here it is.

**Would this still be true if the thing had never been invented?**

It is a test for stolen credit. Point it at any control someone is defending and watch where the protection actually comes from. The line everyone repeats is that *a twenty-four-hour cooldown would have blocked the malicious axios release*. Run the test. That claim is carried entirely by the words "detected and pulled in three hours." The takedown did the blocking. The cooldown only made you wait until after the takedown had already happened. Remove the cooldown and the sentence is still true. Remove the detection and it collapses.

That is the whole book in one move. Most of what the industry calls security is detection wearing someone else's name tag. A waiting period takes the credit for a researcher's takedown. A catalog number takes the credit for an analyst's triage. A scanner's dashboard takes the credit for a fact the package manager already knew. Pull the detection out from under any of them and nothing is left but cost.

So I am going to hold three things to account, and the test is the same each time.

I will hold the **registries** to account for publishing without scanning, for shipping timers that start counting only after the attacker has already had his week, while they sit on detection they already run and could run at the door.

I will hold the **CVE Program** to account for keeping a 1999 filing cabinet and calling it ground truth, for a catalog that records what is convenient for vendors and omits the malware actually landing on developer laptops, and for dressing up its own decline as due process.

I will hold the **security industry** to account for selling generic software composition analysis and a waiting period as if either were a control, when a package manager that knows what it installed is more accurate than both and was there the whole time.

One thesis runs under all three, and I will keep returning to it until it is boring and then keep returning to it after that.

> Detection was the control all along, and its home is the source.

Everything else is a clock, a number, or a logo, taking a bow for work it did not do.
