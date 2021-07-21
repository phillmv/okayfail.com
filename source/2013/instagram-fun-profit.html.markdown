---
layout: post
occurred_at: 2013-10-22
subject: instagram for fun and profit
---
Back in December 2011, I was approached by [Michael Joffe](http://mwjoffe.tumblr.com/) to make something happen for the early 2012 installment of his [dance party art things](http://www.thegridto.com/life/society/the-nocturne-back-in-the-new-york-groove/), this one being called "Oui Paris". 

So, I stuck together some bits of ruby and javascript and made "audiogram", an instagram feed that updates in real time, and Michael threw a dance party around it. 

The folks at the [Brockton Collective](http://brocktoncollective.com/) were awesome and created a timelapse of the whole thing:

<iframe width="480" height="360" src="//www.youtube.com/embed/QKBF3a6bkbw?rel=0" frameborder="0" allowfullscreen></iframe>

A couple of times I had to [drunkenly climb a ladder](http://instagram.com/p/lV_V7/) and troubleshoot it. (Here is more proof that [I was there](http://instagram.com/p/lUq-X/)).

Michael longed for something deeply interactive that would directly engage with the crowd. I'd always wanted an excuse to play with the instagram api and the rest was covered in [NOW Magazine](http://www.nowtoronto.com/music/story.cfm?content=184963):

>In order to do so, the organizers have implemented an interactive element that they’ve deemed “the world’s first Instagram music visualizer”. With the help of developer Phillip Mendonça-Vieira, they’ve created a display wall that will project partygoer’s pictures in real time, in the ersatz nostalgic haze of the Instagram photo app. All you need to participate is a smart phone[^yayinsta].

>“Instagram has become a huge part of sharing life experiences… and in a way it tells much more of a story than a status update,” Joffe explains. “So with this party we wanted to do an experiment wherein a tool that is used to share experiences becomes the reason for the event itself.”

The event was a success; apparently something like 400 people[^instatruefact] showed up on a cold January night. The whole thing ended up being one of the coolest things I've done to date. 

[Most](http://instagram.com/p/lUud_/) [importantly,](http://instagram.com/p/lW80X/) [people](http://instagram.com/p/lXoWc/) [seem to](http://instagram.com/p/lXXOZ/) [have had](http://instagram.com/p/lX2hv/) [a good](http://instagram.com/p/lWrgz/) [time](http://instagram.com/p/lVoKX/).

<h2>Neat. What did the app look like?</h2>

I'm glad you asked. This video will give you the general idea:

<iframe width="480" height="360" src="//www.youtube.com/embed/Q-J17YcFsic?rel=0" frameborder="0" allowfullscreen></iframe>

The reason I am writing about this now, in 2013, is because I never got around to making the above recording until a few months ago. I don't understand why, or what overcame me, it really wasn't that much work[^instaarcheology].

Some people really took a liking to it, and the app has since been used in a <a href="http://throneofjs.com/parties/#parties">conference party</a>, a corporate holiday party, a wedding, a <a href="http://lookingforgold.blogspot.ca/2012/12/long-winter-three.html">winter music festival series</a>, and a sexy aids fundraising dance party[^instanopantsnoproblem].

<h2>Cool. What did you use to make it?</h2>

I wrote a little sinatra thing that spat out new instagram photos when asked. I put down a layer of [masonry](http://masonry.desandro.com/) and wrapped it together with [jmpress.js](http://jmpressjs.github.io/jmpress.js/). It works surprisingly well: new photos show up within five seconds of being posted.

The waterfall effect was achieved by prepending new instagram thumbnails in a div taller than the screen; masonry does the rest. I also remove elements a couple rows below the fold as a crude form of garbage collection. Without it, Chrome quickly starts to run out of memory.

I was reticent to accept Michael's invitation. I wasn't sure if I could put together something that was cool enough[^instasob] and as a result it only really came together the week before the party date. Overall, I spent about five nights poking at it and one long evening and an afternoon frantically making it work. 

In the process I wrote some of the most terrible javascript ever committed to disk. I've since rewritten all the ruby a couple of times over, but that javascript remains inscrutable because I really don't want to touch it. That javascript is why I haven't linked to the github page. I've gotten a lot better at it since then.

<h2>What did you learn from this experience?</h2>

Telling the bouncer to let your friends [skip a huge line](http://instagram.com/p/lV7hv/) feels pretty cool[^instalol]. 

I think to this day, event and location apps are underexplored. Something to facilitate documentation and increase serendipity. I think my phone could someday output significantly more whimsy into my life.

The barrier to making something neat can be surprisingly low; the important thing is to play with it and see what you can make. I've been terrible at following this advice. 

<strong>tl;dr</strong> if someone asks you to write software for a dance party, say yes.

[^yayinsta]: It was the beginning of 2012; smart phones were common but not yet ubiquitous and instagram had only recently become a thing and it was cool and exciting and and no one thought it was going to be worth one billion dollars.

[^instatruefact]: Per the [Brockton Collective's writeup](http://brocktoncollective.com/oui-paris-event-coverage/). Michael wrote about it [here](http://mwjoffe.tumblr.com/post/16653348653/instagram-music-visualizer).

[^instaarcheology]: Oh, and the #ouiparis photos that pop up are obviously not from the dance party. In the preceeding year and a half, other people have begun to use #ouiparis. I love this kind of stuff, unique and obscure events buried away in tags. I feel there is one great short sci fi story in me where a crucial bit of plot stems around a 14 month old foursquare checkin someone made at a house party.

[^instanopantsnoproblem]: It was seriously overshadowed by the burlesque, the vigorous dancing, and the fact that nobody wore pants.

[^instasob]: Without any advance notice, he put my name on the facebook event and the event listings he got into the alt-weeklies, and by then it was too late for me to wuss out.

[^instalol]: Me, pointing: "Would it be cool if they came straight in?", <br/>Extremely Nice Bouncer Guy: "Dude, it's your party."


