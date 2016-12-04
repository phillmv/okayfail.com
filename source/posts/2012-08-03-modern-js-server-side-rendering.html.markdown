---
layout: post
title: Modern Javascript and Server-Side Rendering
---


I served as Director of Animated GIFs at a [recent conference](http://throneofjs.com). Steven Sanderson made a [pretty good writeup](http://blog.stevensanderson.com/2012/08/01/rich-javascript-applications-the-seven-frameworks-throne-of-js-2012/) of the event.

I'm aware that this was a gauche position to take, but I originally started out with a question: Do I start learning [Ember](http://emberjs.com/) or do I start learning [Backbone](http://backbonejs.org/)? Much to my surprise the answer I left with was: pick up [Batman](http://batmanjs.org/). 

There are many ways to consider the different frameworks but in a nutshell: 1) data-binding feels like a superior solution to wrapping moustache {} in script tags, and more importantly, 2) Batman is clearly dedicated to conventions and patterns that I have come to [love and admire](http://rubyonrails.org/). 


Now, I'm not interested in 'opinionated software'. I'm interested in getting work done. I'm interested in an application development framework that holds my hand throughout the process. I'm interested in software that makes hard decisions for me, so that I don't have to repeatedly solve the same problems. As it turns out, I'm also a big fan of the MVC pattern as implemented by dhh et al. I think we're on to something[^1].

Yet there is one major problem that almost no framework seeks to resolve, and most attempted to dodge, and that is of server-side rendering.

<h2>Problems with rich js web apps</h2>
Now, I'm not going to pretend that I'm actually concerned with graceful degradation. Lord knows I've sprinkled just enough jQuery into my apps that they wouldn't work otherwise. I'm also going to conveniently ignore [progressive enhancement](http://www.yuiblog.com/blog/2012/07/30/what-happened-at-throne-of-js/) for the moment, because I'm open to the idea that you have to occasionally burn your bridges in order to move forward.

As far as I can tell, there are two real concerns:

1. The Google Problem
3. The Twitter Problem

--

<h2>Google</h2>

Google can't parse javascript, condemning your content/app/idea to permanent obscurity. 

I'm not super concerned with this. While being able to fully parse javascript on crawl is a phenomenal technical problem, someone's going to solve it eventually; the economics of the situation dictate it. 

However, it's still something we'll have to deal with over the next five years, and you're insanely irresponsible to pretend it doesn't exist.

<h2>Twitter</h2>

The twitter problem stems in that when I am looking at a [resource](http://en.wikipedia.org/wiki/Uniform_resource_identifier) ([for instance](https://twitter.com/phillmv/status/229972875153641472)) it is somewhat preposterous that you have to load the application, and then issue another request for the actual data[^2].

It's preposterous for two reasons. 

First and for all, the resource locator I just pointed to *contains all the state necessary to construct the page*. The server, that ultimate guardian of persistence, already knows what information I'm trying to obtain. Resources are amongst the most important UI conventions we've established over the past couple of decades. The ability to share links to any application or content is incredibly powerful, and it's not an achievement that we're not going to abandon.

More importantly, adding a second round trip to your application load can really harm your user's experience.

<h3>Latency is the final frontier</h3>

Whenever someone talks about the minified size of their libraries, I can't help but roll my eyes. [Bandwidth is not an issue](https://twitter.com/miketaylr/status/227056824275333120). Anyone who has worried about shaving a few kilobytes off their libraries has wasted their time.

We all manage to watch streaming HD video on a daily basis.  Economics will also solve any bandwidth gaps we may suffer. What remains after that is permanent, in that at the high end our latency time is already mostly dominated by [the speed of light](http://www.ibiblio.org/harris/500milemail.html). 

If you're genuinely concerned about user experience, it is all about sub ~300ms loading times. We'll get fatter pipes, but we'll always have laggy cell phone connections. If you're careful and intelligent about [the way you send data down the pipe](http://37signals.com/svn/posts/3112-how-basecamp-next-got-to-be-so-damn-fast-without-using-much-client-side-ui) you don't even need all that much javascript in order to achieve the rich experiences we seek.

--

Now you tell this to a lot of js people and they'll hold up their nose and say that the answer is to build spaghetti evented apps. The one language everywhere paradigm is a nice dream but it's not necessary (and given the limitations of Javascript, nor is it *desirable*).

You're not going to actually be sharing that much code - outside of
validations - between the server and the client. In fact, there's lots
of code that I specifically don't want my clients to have access to.

So let's continue to write apps in our preferred engineering aspects
of choice. As long as an interface gets exposed it doesn't matter.

You just have to have content on first page load.


[^1]: This is not to knock against any of the other vendors who gave talks that weekend. For instance, I was impressed with [knockout](http://knockoutjs.com/). Steven et al achieved a very cool engineering feat when they openly set out to be interoperable with as many other libraries as possible.

    The beauty of something like Knockout - where you get to choose your preferred routing library - is also its downfall; the whole point of an application framework is that it's some other asshole's job to worry about maintaining all the glue between the different aspects of the framework. 
    
    The way I see it, the biggest advances in programming productivity over the past couple of decades have revolved around making some poor asshole upstream from you worry about maintaining the platform on which you write your applications.

[^2]: Twitter suffered from this but they have since [made it go away](http://engineering.twitter.com/2012/05/improving-performance-on-twittercom.html)



