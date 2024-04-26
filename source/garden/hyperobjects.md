---
occurred_at: 2024-03-25
---

# hyperobjects

i recently had to grapple with how my work's APIs handled authorization. our team wanted to do something slightly weird, and given my talents and knowledge of where the bodies are buried it fell to me to figure out how to do it safely & securely, etc.

now, the beating heart of GitHub is a sprawling, sixteen-year-old ruby on rails app so that is easier said than done,[^rails] but in theory who is allowed to read or write to this particular resource? ought to be a straight forward question. the system answers this literally millions of times a day.

patiently reading code and docs has historically served me quite well, so i sat down and started reading. there was a lot of code and docs, though, and i spent weeks, and weeks, _and weeks_ on this question. eventually, i thought i had resolved it to my satisfaction, and wrote it up in a narrative i presented to my team. and everyone agreed that it made sense.

but then a curious thing happened.

i asked a former teammate of mine, an expert in this system, for a sanity check, and she pointed out that i had missed an important detail. the approach i had outlined in my doc was _almost_ correct, which is another way of saying that it could never work.

i went back to the code.

and now every time i looked at some corner case, i seemed to find new quirks. someone would ask a perfectly sensible question that iluminated a corner of my ignorance. i struggled to explain what some of our automated tests _should_ be doing, and i kept finding new unexpected behaviour, lurking in a different part of the codebase i had either not read – or had read many times before, but had yet been able to internalize.

i eventually realized, far too late, that the full set of behaviour that describes how the app handles authorization – every nook and cranny, in its majestic entirety – was simply too large to fit in my head all at once. or more likely, _anyone's_ head. after over a decade of effort, rearchitecting for scale, handling new-use cases,[^invariants] etc, etc, the system had simply accreted too many details.

it has become a **[hyperobject](https://www.wired.com/story/timothy-morton-hyperobjects-all-the-way-down/)**.

>Examples of hyperobjects include: black holes, oil spills, all plastic ever manufactured, capitalism, tectonic plates, and the solar system. Hyperobjects are often ancient or destined to be, like the sum total of Styrofoam and plutonium we have littered across the Earth over the past century, which will remain for millennia. A human being may see _evidence_ of hyperobjects—pollution here, a hurricane there—but try gazing off into the distance to see the _totality_ of them, or to the very _end_ of them, and they disappear into a vanishing point. Hyperobjects, as Morton says, emerge only in fragments and patches that do not always seem to connect up from our view on the ground.

## well, duh?

in one sense, this observation is trivial.

our ruby on rails monolith alone, nevermind the dozens of services that connect to it, has seen hundreds and hundreds of engineers pour a lot of code into it. it is immediately apparent to all who clone the repository that the app as a whole is too vast and enormous for any one person to comprehend.

however, i had yet to grasp that even **important subsets** of the app could also be beyond comprehension.

---

around the same time, i came across [this entry in Dan Davies' newsletter](https://backofmind.substack.com/p/songs-my-portfolio-manager-taught-4fe), and here i will just quote the relevant passage in full (emphasis mine):

>Once upon a time, in the early to mid stages of the Global Financial Crisis, a client said to me …

>>    “Danny, since this thing began, there have been two types of analysts. Some people, like yourself, have been trying to develop their understanding of an incredibly complicated system, under huge pressure, absorbing vast amounts of technical detail in a short time, and doing a fairly good job of it. Others have just been mindless bomb-throwers, trying to attract attention to themselves with ill-informed displays of competitive panic. I decided early in this crisis that I was going to listen to the second type of analyst – and they have turned out, systematically, to be much closer to being right”

>He was correct; I changed my approach as a result and consequently, I think, did a much better job of understanding the Eurocrisis. **There’s a very great danger in believing that either a) the whole problem is of a size that you can fit in your head, so understanding it is just a matter of working hard enough, or that b) the relationship between the amount of detail you know and your understanding of the system is positive and monotonic.** This is often not the case.

i'm still meditating on the meaning of this quote. i experienced it as a bit of a profound insight. i've been meaning to track down Dan's email so i can ask him more about it.

## now what?

at any rate, my work (my life) is filled with hyperobjects. i have to grapple with them all the time. not coincidentally, Dan is [working on a book on cybernetics](https://profilebooks.com/work/the-unaccountability-machine/), and it makes me think a lot about the ol' Stafford Beer quote,

> **The purpose of a system is what it does.**[^posiwid]

we can't understand the whole system. nobody can take in every part and absorb every detail. and the intentions of any individual contributor are irrelevant. the only thing we can do is try to step outside and observe the actions it takes upon the world.

i'm probably mixing metaphors. but! with the benefit of hindsight, how should i have tackled my research problem?

i should've ignored all of the code & first attacked the test suite. work backwards from those weird tests i struggled with. those tests describe the behaviour we actually see, at a high enough level to be useful. how it works under the hood kind of doesn't matter.

when wrestling a hyperobject, you kind of have to:
- squint,
- suss out the vibes,
- don't try to take it all in, because you can't.
- instead, measure the end result you can see; observe the outcomes, and use your intuition. what is the system trying to _do_?

[^invariants]: the other day i came across Lorin's post "[the problem with invariants is that they change over time](https://surfingcomplexity.blog/2024/03/26/the-problem-with-invariants-is-that-they-change-over-time/)" and its simple truth still makes me giggle.

[^posiwid]: cf [wikipedia](https://en.wikipedia.org/wiki/The_purpose_of_a_system_is_what_it_does)

[^rails]: not, mind you, because it's a rails app; a lot of people struggle with that fact, for some reason, but i'm not one of them.
