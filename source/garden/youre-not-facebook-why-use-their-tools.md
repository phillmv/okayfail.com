---
occurred_at: 2024-04-22
---

# You're not Facebook. Why use their tools?

I've seen folks expend remarkable amounts of effort to adopt Facebook tooling, for example GraphQL and React. Typically, the reasoning is that they're Industry Best Practice™ for Solving These Particular Problems.

I don't have well-formed or particularly nuanced views on the One True And Right Way To Make Rich Client Web Applications. But as I approach middle age I think I've just enough experience to know when something is messier than it ought to be.

I want to push back on this "Industry Best Practice" view. I fear that the honest reasoning is more like "Facebook has high prestige; if I try to be more like Facebook, my own prestige will increase".

### Facebook is an anti-pattern

Instead of thinking "well, Facebook does this, and Facebook is a rich and successful company – so it must be a good idea", we should be more like "Facebook does this? – ah, **it's probably a bad idea**".

I have come to believe that "whatever Facebook does is an anti-pattern" is a much more useful heuristic.

My reasoning goes like this: _you_ are not Facebook.

Very few companies are shaped like Facebook, and therefore decisions that make sense for Facebook probably don't make sense for you. It's ironic, tragic even, that so many people think that tools that make sense for Facebook will automatically make sense for their own organizations.

There are two ways in the vast majority of organizations are not like Facebook:
1. Facebook is a very high traffic, very high margin advertising business with a quasi monopoly on its audience.
2. Nothing important happens on Facebook.

## 1. Facebook is big, and flush with cash

Fact 1 means that **Facebook has an unusual amount of resources at its disposal**. They can afford to pay developers obscene salaries to compensate for the moral injury of working at Facebook. And those developers can toil away at problems that are either irrelevant or out-of-scope for the vast majority of organizations that lack either their scale or their access to capital.

Consider GraphQL. As a domain specific language for querying graph shaped data, it has an admirable goal. I'm sure it really is a remarkable tool for rich client developers to iterate on new designs without having to negotiate new APIs with their backend counterparts. As a single, common interface for querying data, data which is often stored in different silos, it sure seems promising.

But in practice… well, those silos are real, they exist for (good and bad) reasons. If your data access spans several teams' areas of responsibility, then it's fiendishly easy to end up with _stupendously slow & expensive queries_. If ownership is diffuse, then no one's worrying about the performance of this one retrieval pattern and you get weird scaling issues.

If you're joining data across mysql clusters, someone has to pay the piper.

Put another way: a GraphQL only makes sense if you have _a whole team dedicated_ to making it not suck. To have a GraphQL API at scale is to have a GraphQL API platform team whose sole job is to fuss over it and keep it ticking. The vast majority of organizations aren't big enough, nor high margin enough, to justify spending millions of dollars a year optimizing their API platform.
 
In most organizations, it probably really is easier to just ask the team responsible to open up an endpoint – or do it yourself.

(In this sense, GraphQL to me smells almost like an attempt to deal with Facebook's org chart: the dedicated GraphQL platform team bears the coordination costs, instead of having dozens of teams duking it out with each other ad hoc).


## 2. Facebok is not important

Which leads us into Fact 2: **nobody cares if Facebook has downtime**. Nobody's day is ruined because Facebook had ten or thirty or sixty minutes of downtime.

Time spent on Facebook competes with other leisure activities. If the hate speech and cat pictures website doesn't work right now, you'll just try again later, whatever. You can just watch tv, read a book, or go for a walk instead. When Facebook goes down, it's really not a big deal in the grand scheme of things. Most people will never notice that it happened.[^downtime]

By contrast, if my current employer has an availability incident, the entire internet explodes into paroxysms of rage because they can't get their work done. It's not an exageration to say that deliveries might not get made, factories might sit idle, etc, because GitHub is a _productive tool_. There are things you can only accomplish because this tool exists.

### Your tools make what you ship

This distinction matters because these incentives towards availability percolate throughout your entire stack & architectural decisions.

If your React stack makes deployment more brittle, and you've added multiple round trips of latency, and a widget fails to load for whatever reason, and the whole thing contrives to swallow errors – Facebook has teams of people slaving away optimizing all of these steps, _and_ they have a way higher tolerance for messing up.

Move fast and break things!, is easy when _nobody cares that it's broken_.


My employer promises its users three nines of uptime. I giggled at the idea of Facebook offering a service level agreement, and when I googled it in fact they explicitly say "lol what SLA? sometimes when we deploy the API will go down for 5 minutes".[^whatsapp-sla] 5 minutes of downtime! Lmao.

I live in a different world. Where I work, I work on real things that matter. And so do most programmers out there.

## In conclusion,

Facebook should be considered harmful. Facebook's devrel marketing is designed to ease their hiring pipeline and destroy their competitors.

Govern yourself accordingly. 


[^whatsapp-sla]: "When we update the API, you may experience up to 5 minutes of downtime." / "We do not currently offer commercially available product service level agreements for uptime and/or latency." https://developers.facebook.com/docs/whatsapp/cloud-api/support/#faq_775539867197306, accessed 2024-04-22

[^downtime]: Of course if Facebook goes down… _Facebook_ will be sad, cos Facebook will lose money. I suppose their customers (the advertisers) will be sad because their future sales trajectory will be impacted, but I bet even they don't get that worked up about it. Ads that didn't get displayed today can be displayed tomorrow.
