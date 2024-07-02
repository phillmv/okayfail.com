---
occurred_at: 2024-05-20
---

# Complex vs Clear: Choosing The Right Tool For The Right Problem
## or, when to use Ruby on Rails 

**tl;dr,** in this post I meditate on how different programming tools seem to "fit" different kinds of problems in different ways, which I illustrate through recent examples and a decision-making framework. The best problem-solving tool depends on the problem you're facing.

### A game developer leaves Rust
Recently, I came across a blog post called [_Leaving Rust gamedev after 3 years_](https://loglog.games/blog/leaving-rust-gamedev/). In it, the author(s)[^unclear-author] describe how they found the Rust programming language to be a sub-optimal tool for their use-case, i.e. making video games.

I thought they made some interesting observations that are worth discussing. The post goes into a lot of detail, but I think it can be summarized like this:

> Rust fits very nicely in low level algorithmic areas where one knows exactly what the problem is and just needs to solve it. But writing a video game is different from writing a CLI tool or a server API. 

> Video games are complex state machines where requirements change all the time. This is because the most important thing in a video game is to deliver a _fun experience_ for the player, but you can't tell if your game is fun until you actually make it. A good game is made by scraping a lot of bad ideas, through a non-linear process.

> If you think about it, designing a video game is a kind of iterative search. As a result,
> - most of the effort goes into code you experiment with, and then throw away, and
> - tight feedback loops, and being able to iterate quickly, are way more important than correct, efficient, "maintainable" code

> By contrast, Rust's features and overall philosophy make it hard to write code with a "I can throw this away later" mentality. Rust's embodied values on correctness and efficiency produce code that is hard to iterate on without a lot of laborious refactoring, which takes up a lot of time you could be spending on testing new ideas for the game.

This is highly stylized, but if we grant that I did a good job with the summary this post **really** resonated with me.

Now, I've never used Rust, and I've never made a video game. But I have been spending a lot of time writing Go, which occupies a similar niche to Rust's, and in my career I've made a number of _products_ from scratch. Nothing fancy. Mostly security tooling aimed at software developers. But also a few business-automation interfaces intended for non-expert computer users.

In my experience, when I write Go I feel like spend a lot more time than I would like trying to refactor my code into the "right shape", so it's easier to test, and so that it works how Go "wants" my code to work.

It's hard to articulate.

### Making multidimensional choices
A week later, I came across a thread on the fediverse where two people were discussing Mastodon's implementation of the ActivityPub protocol. Mastodon, as you may recall, is a short-message social media platform, where users can share text and multimedia across a federated network.

The thread went something like this:[^not-quotes]

> **Person A:** I wonder why there are so many more "Mastondon-like" projects implemented in Golang, C#, JS, etc than in Ruby (on Rails), Mastodon's native ecosystem.
> **Person B:** well, Go is very popular, it's very easy to make modular code in Go, and, frankly, Rails is basically _multidimensionally the wrong choice_ for this kind of project.
> **Person A:**: It's just surprising no one has done an ActivityPub blog, bookmarker, etc, in Ruby.
> **Person B:** To be cynical, as far as I'm concerned, Rails is not the correct choice for basically _anything_.

Seeing this reply… well, it pissed me off 😛🙈. To be clear, this is my fault. I waste way too much time being Mad Online™.

I'm sure Person B, who works in Big Tech at Big Scale, is a reasonable person who is competent at her job. But even if she is just being cheeky, this whole attitude is a kind of facile machismo. Programmers operate on a prestige hierarchy, where certain languages are seen as more rigorous and worthwhile than others.[^mea-culpa]

The litany is familiar:
- **This** language is more efficient, and performant. It's easier to write maintainable code. It's harder to write "bad code" in this language.
- _That_ language is slow, and useless. You can only write broken code that is impossible to maintain.

I hate this attitude.[^success] Obviously, I hate it because it attacks an ecosystem in which I have invested in and developed expertise. But I also hate it because it's _wrong_. It's a shallow kind of thinking.

I, a deeper, more exalted thinker (sarcasm), I think… I think you need to **pick the right tool for the job at hand**. 

Oh sure, you say, now there's an original idea 🙄. Who can disagree with that? The trick is making that choice in the first place, innit.

### Well, what kind of problems do you got?

In order to choose the right tool for the job, I think it's helpful to try to understand the nature of the problem you're dealing with. When we make _stuff_, we're trying to make a dent in the universe. What is the shape of that dent? What are your constraints? What outcomes are possible? What kind of decisions can you make?

This can sound kind of hopeless, but last year I learned about something called the "[Cynefin framework](https://en.wikipedia.org/wiki/Cynefin_framework)" that can help us out. It's a, quote, "conceptual framework used to aid decision-making", and… while I don't think I fully endorse it, I feel like it's a useful framing device. It can help order our thinking.

Here I'm mostly paraphrasing from Wikipedia. Cynefin argues that a leader making decisions may find herself in one of four contexts or "domains". If your problem is…
- **Clear**, or _known_, then you can look hard at the facts, figure out what kind of rule or process can handle it, and then follow that rule or process. We know how to solve this problem, we just have to categorize it properly.
- **Complicated**, or _knowable_, then there isn't just _one_ right answer. There's a range of answers. You have to analyze the situation, call in some experts, and weigh your options. But if we think hard enough, we can figure out how to solve it.
- **Complex**, then there aren't _any_ right answers. Cause and effect can only be determined after the fact. All you really can do is make informed guesses, run experiments, and feel your away around it. We won't know if we figured it out until after we've done the work.
- **Chaotic**, then something is on fucking _fire_, and holy shit put the fire out, hurry! Don't just _stand there_, you and you, get some buckets, form a line, where are the extinguishers?, Follow me! How the fire got started we'll figure out later.

With me so far? The core idea is that most problems can be sorted into buckets labeled **Clear**, **Complicated**, **Complex**, or **Chaotic**.

And so, here's a vibe: I feel like a programmer can spend, or maybe even that _most programmers_ spend their entire careers in computers dealing only with problems that are **Clear** or **Complicated**. This is especially true for people who work in Big Tech or Big Corporate, whose very size and scale encourage and expect strict hierarchies and role specialization.[^google-giggle]

For example, as a junior programmer, knowing the difference between a quadratic and a sublinear algorithm can qualify you for a six-figure salary. Once hired, you spend most of your time plugging widget Delta into socket Epsilon. As you become more senior, you'll be asked to figure out **Complicated** tasks. How should this deployment process work? How will we architect this app for Web Scale™? There is no one right answer. But someone gave you some requirements, and some answer can be found to meet them.

It's not the average developer's job to figure out requirements, nor is her role judged on business outcomes. That's what product managers are for. Hell, in many corporate environments, not giving a single shit about the requirements is a sanity-preserving technique. You'll burn out to a crisp within a couple of sprints if you stray too far from what the boss man asked you to do, and then who'll pay your mortgage?

In this model of the universe, it's not that **Complex** problems don't exist. But maybe they're shunted higher up in the corporate hierarchy, or towards different modes of work. For example, Site Reliability Engineers have to deal with **Chaotic** Shit all the time, and once the fire has been extinguished figuring out how to stop more fires from happening is usually a **Complex** problem.


### If all you have is a hammer, everything looks like a nail

If we take this for granted, it follows that the kinds of problems that you tend to deal with, or that your personality is suited towards, will naturally shape your worldview.


This is how you get tools like Rust or Go. When the Rust Evangelism Strikeforce argues that X or Y tool ought to be rewritten in Rust for safety reasons, well, that's a **Clear** problem. An existing, well-understood, tool is being optimized.

Similarly, you can spend years proxying HTTP requests at the edges of Kubernetes control planes, and figuring out how to handle those HTTP requests more efficiently, and if that is your life then there is no reason to leave the warm embrace of Golang.

From this perspective, "maintanability" is kind of synonymous with "hard to change". In this sense, I mean: once you get it to work, it's hard for someone else to accidentally fuck it up in the future. If you have well-defined requirements that's a good property to have!

I think where we get into trouble is that, due to their experience, many programmers don't understand or have sympathy for the nature of **Complex** problems.

### Making a new product is a lot like making a video game 

Once upon a time I attended a startup accelerator whose core mantra is "make something people want". And the main insight in that mantra, which they drill into your head week after week, is that you don't know, you can't know, what people **want** until you _show it to them_.

It's not enough to listen to what people tell you they want. People are not capable of articulating, or sometimes even understanding, what can fill the void in their lives and solve their problems. The only feedback that truly matters is creating a demo so powerful that it compels your audience to reach for their credit cards.

And so, making a new product is a kind of iterative search. Most of the effort in a startup – in creating a new product from scratch – consists of writing code you experiment with, and then throw away. And in that context, tight feedback loops, and being able to iterate quickly, are way more important than correct, efficient, maintainable code.

In fact, forget about efficiency. Do things that don't scale, the folks at the accelerator told us. It's more important to figure out how to do the right thing by hand than it is to do the wrong thing in large quantities.[^cringe-advice]

I hope the parallel I've set up is obvious. And here I'll add: making Mastodon successful is a lot more like making a video game than it is like making a kubernetes http proxy. It has to work, it has to delight people on some fundamental level, and the requirements are wishy washy and not obvious.

When you write code in a high level framework like Ruby on Rails, it's relatively easy to write code you can experiment with and throw away. Will your app automatically scale to millions of users? No, of course not. But when you're dealing with a **Complex** task, that's not an important value.

First you need to tweak, and experiment, and feel your way towards a solution.

(add example about how the attester service is a fine example of a go program)

<!--

---

The Cynefin framework goes like this: any leader making decisions needs to understand the context she is inserted in, and what _kinds_ of decisions are necessary. According to the Cynefin worldview, your operating context might be 

This can sound hopelessly vague, but sometime last year I learned about something called the Cynefin Framework that can help us out. I don't know that I fully endorse it; anything that sorts the world into four quadrants is bound to be wrong somewhre. But I feel like it's a useful framing device.

The Cynefin whatever works like this:

Sometime last year, I was introduced to this framework and, while I don't know that I fully endorse it, I think it's a helpful w


---


Nothing fancy. I work on developer security tooling, and before that I had a developer security tool startup, and before that I made a living 

This isn't true for every problem. 

>A good game is made through scraping a lot of bad ideas, through a non-linear process.

>Rust fits very nicely in the low level algorithmic areas where one knows exactly what the problem is and just needs to solve it.

>A more flexible language would allow the game developer to immediately implement the new feature in a hacky way, and then play the game, test it and see if the feature is actually fun, and potentially do a bunch of these iterations in a short amount of time.


Here, I'll pull some quotes to illustrate:

>The most fundamental issue is that the borrow checker forces a refactor at the most inconvenient times. Rust users consider this to be a positive, because it makes them "write good code", but the more time I spend with the language the more I doubt how much of this is true. Good code is written by iterating on an idea and trying things out, and while the borrow checker can force more iterations, that does not mean that this is a desirable way to write code. I've often found that being unable to just _move on for now_ and solve my problem and fix it later was what was truly hurting my ability to write good code.

>In other languages one can write code with "I can throw this away later" in mind, which I've found to be the most useful approach in terms of getting good code.
>…
>The thing is, Rust is also a language that will force the user to refactor much more often than other languages. It doesn't take a lot to suddenly be backed in a corner with the borrow checker and realize "wait I can't add this new thing because things will no longer compile, and there's no workaround other than code restructuring".

>This is where experienced people will often say that this becomes less of an issue once you get better at the language. My take is, while that is 100% true, there's a fundamental problem of games being complex state machines where requirements change all the time. Writing a CLI or a server API in Rust is a very different experience than writing an indie game. Assuming the goal is to build a good experience for players rather than an inert set of general purpose systems, the requirements might change from day to day just after having people play the game and you realize some things need to fundamentally change. Rust's very static and overly-checked nature fights directly against this.

>Many people would counter-argue that if you end up fighting the borrow checker and have to refactor your code it's actually good, because this makes your code better. I think this is a valid point to raise for something where you know what you're building. But in the majority of cases, I don't want "better code", I want "game faster" so that I can test it sooner and realize if the idea was good.

>I'd argue as far as _maintainability being the wrong value for indie games,_ as what we should strive for is iteration speed. Other languages allow much easier workarounds for immediate problems without necessarily sacrificing code quality.

>All of these are fine goals in terms of playing around with tech and learning Rust, but I want to re-iterate what was said at the top of this article. I'm not evaluating Rust from the perspective of technical curiosities or "this scratches the right brain itch". I want to make real games that will get shipped to real people (not developers) in reasonable amount of time, that those people will pay for and play, and have an actual chance of hitting the front page of Steam. To clarify, this isn't a cold blooded "make money at all costs" scheme, but it's also not a "I'm just doing this for the lulz". The whole article is written from a perspective of wanting to be a serious game developer who cares about games, gameplay and players, and not just tech enthusiasm.

>A more flexible language would allow the game developer to immediately implement the new feature in a hacky way, and then play the game, test it and see if the feature is actually fun, and potentially do a bunch of these iterations in a short amount of time. By the time the Rust developer is finished with their refactoring, the C++/C#/Java/JavaScript developer has implemented many different gameplay features, played the game a bunch and tried them all out, and has a better understanding of which direction should their game be taking.

>[Jonas Tyroller explains this extremely well in his video on game design as a search,](https://www.youtube.com/watch?v=o5K0uqhxgsE) which I'd 100% recommend every game developer to watch, because it feels like the best explanation of why so many games people make (myself included) are profoundly terrible. A good game is not made in a lab where careful types are crafted, it is made by a developer who is a grandmaster player at the genre, and who understands every aspect of the design and has tried and failed many things before reaching upon the final design. A good game is made through scraping a lot of bad ideas, through a non-linear process.

>Rust as both language and community is so preoccupied with avoiding problems at all cost that it completely loses sight of what matters, delivering an experience that is so good that whatever problems are there aren't really important. This doesn't mean "ship crap games", it means focusing on the game being a good game, not on the code being good code.

>Rust fits very nicely in the low level algorithmic areas where one knows exactly what the problem is and just needs to solve it. Unfortunately, a lot of gamedev requires more dynamic approaches, and this becomes especially painful around level editing, tooling and debugging.

I have never used Rust, but I thought this post was very interesting for two reasons:

1. The author felt the need to pre-emptively disarm the "the problem you're having is only a problem because you haven't tried hard enough" critique, which is something I experienced when [I whined about Clojure](https://blog.appcanary.com/2017/hard-isnt-simple-ruby-clojure.html).
2. The author's _main_ problem with Rust is that the overall tooling makes it difficult to quickly iterate on the design as whole.

The first point is a funny quirk of human psychology, I think. A kind of tribalism. The second point is   A lot of their critiques felt similar to my own complaints about doing work in Go, which is reasonably different from Rust but occupies a similar "low-level high-performance" niche. 

-->

[^not-quotes]: Emphasis mine; this is another stylized summary. I obscured people's identities because it is not my intention to be rude or call anyone out. I just want to talk about how it felt to me, my interpretation, and what it made me think about.

[^unclear-author]: It's genuinely unclear to me _who_ wrote this post ;p. There's no attached author name, and the post itself liberally intermingles "I" with "we".

[^mea-culpa]: I'm as guilty of this as anyone else. Back in my day, we hated on PHP and avoided Javascript like the plague.

[^success]: Success doesn't prove worth per se, but there's a weird irony in that she typed this into a popular website powered by Ruby on Rails, and to prove anyone wrong she is likely to upload code to another, fantastically more popular website also powered by Ruby on Rails. 

[^google-giggle]: This is why, whenever I see a startup pitch deck that proudly states context-free that the founders are ex-Google and ex-Facebook, I have to stifle a giggle. Why would that imply any competency at running a startup? You could've spent years tasked with picking [the right colour of blue](https://stopdesign.com/journal/2009/03/20/goodbye-google.html) for the call to action buttons.

[^cringe-advice]: Here I feel compelled to add a disclaimer: I promise that I'm not a weird tech bro. I don't agree with everything pg has to say, but I do think "make something people want" and "do things that don't scale" are banger mantras for startup kids.
