---
layout: post
title: Not Invented Here Syndrome, RVM Edition
published: false
---


Gonna nerd out on [rbenv](https://github.com/sstephenson/rbenv) here just for a 'sec, bear with me.

First, let it be said that [RVM](http://beginrescueend.com/) is awesome. It fills a void in dependency management that traditional package managers like `apt-get` don't even begin to address. Nothing is more finicky than a series of development libraries trying to interact with each other. 

In fact, it is so great that I almost don't understand how I used to do work before it came along. For a programming community that is so famously ridiculous, back stabbing and fad-obsessed, the Ruby ecosystem has ended up with some [world class](http://rubygems.org) [tools](http://rack.rubyforge.org/) [at its disposal](https://github.com/capistrano/capistrano). They all have [their problems](http://gnuu.org/2011/06/01/slimgems-a-drop-in-replacement-for-rubygems/), but they're shockingly advanced in comparison to what the majority of the rest of the programming world has to endure. 

Here are some valid criticisms of RVM, courtesy rbenv's [README](https://github.com/sstephenson/rbenv/blob/master/README.md):

1. RVM has to be loaded in your shell.
2. RVM performs some shell hocus-pocus in order for the seamless interpreter switching to work properly.
3. RVM has some ugly user interface warts.

These are all valid points. No rc files should be eval'ed. RVM is much harder to install than it probably **needs** to be. There are spots where RVM causes integration problems with other libraries.

If you told me that you created an RVM fork that annoys me less and is easier to install, I would applaud you and consider switching and for a full five minutes I thought rbenv was going to be a winner. With bundler, I could probably live without gemsets.

Then I scrolled down the page.

To quote,

5. Install Ruby versions into `~/.rbenv/versions`. For example, to
install Ruby 1.9.2-p290, download and unpack the source, then run:

        $ ./configure --prefix=~/.rbenv/versions/1.9.2-p290
        $ make
        $ make install

    The [ruby-build](https://github.com/sstephenson/ruby-build)
    project simplifies this process to a single command:

        $ ruby-build 1.9.2-p290 ~/.rbenv/versions/1.9.2-p290

6. Rebuild the shim binaries. You should do this any time you install
a new Ruby binary (for example, when installing a new Ruby version, or
when installing a gem that provides a binary).

        $ rbenv rehash
&lt;&lt;ENDQUOTE


Hah! Are you fucking kidding me? One of the biggest wins behind RVM is never having to *care* about how I compile my ruby interpreter. I don't know about you but I **hate** chasing down the appropriate versions of readline and openssl and what have you. It Just Works, Goddamnit&trade;. 

In my relatively short career, I've come to the realization that one of the most important luxuries in life is the ability to **not care** and in this regard RVM was a huge step forward for humanity.

It has yet to fail me, across maybe a dozen machines. If you're going to build a replacement it better be just as good at [enabling me](https://twitter.com/#!/raganwald/status/96984328084520960) to **Totally Not Give A Shit**&trade;. Building the interpreter is one of the bigger pieces of that puzzle.  Stretching that functionality across a whole separate tool is just More Complexity Than It Is Worth&trade;. rbenv is a tool for switching environment variables, which is nice, but what I really want is a tool for managing my interpreter environments. 

Close, but not quite.

<h2>That sounds like a shitty argument. I'm starting to think that you're a shitty person. Why is this important?</h2>

It's a *[tell](http://en.wikipedia.org/wiki/Tell_(poker\))*. [Sam Stephenson](https://twitter.com/#!/sstephenson) obviously has problems with RVM; I just happen to think that they're the wrong problems.

rbenv is a totally valid effort!, and I would be the first to assert that Sam is almost definitely a smarter man than I am. Despite spending time writing about this, I have no skin in the game, I bear no ill will towards any participants and I understand that the language I'm using is needlessly harsh towards people I would rather be friends with. I'm trying to represent my immediate emotional reaction.

The problem here is entirely social: a programming language is only as useful as its community.

On the one hand, I actually think that this kind of [bitchy](http://stackoverflow.com/questions/6199301/global-access-to-rake-dsl-methods-is-deprecated) break neck pace of development is… probably a net-win for the genetic diversity of the ecosystem. On the other hand, the divisive nature of the religious arguments we end up engaging in invariably produce [toxic quantities of burn out](https://twitter.com/#!/wayneeseguin/status/101797127595892736).

Speaking in code is always going to [be easier](https://twitter.com/#!/sstephenson/status/101788598248017922), and it's always going to be more fun but sometimes… maybe it should be something you resort to after you get a couple pull requests denied. Code is easy, and code is cheap. The main value of RVM comes from the fact that [Wayne Seguin](https://twitter.com/#!/wayneeseguin) has gone above and beyond the call of duty in maintaining it; the effort behind the code itself is negligible in comparison. 

\[Someday, someone is going to write an incredible essay on the enormous tectonic shift that github dealt to the open source community. It's amazing how it grappled with the social dimensions of open-source software by 1\) dramatically lowering communication and participation costs and 2\) dramatically improving a given project's organizational transparency. But I digress. [Here is a good start](http://eaves.ca/2011/06/14/how-github-saved-opensource/).\]

At the end of the day, we have an infinite amount of disk space to [store extra projects](https://twitter.com/#!/sstephenson/status/101806774331514881), but we suffer from an extreme shortage of poor assholes, sitting upstream, toiling away for our explicit benefit.
