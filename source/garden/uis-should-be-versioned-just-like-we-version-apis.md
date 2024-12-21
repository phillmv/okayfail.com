---
occurred_at: 2024-12-21
---

# UIs Should Be Versioned, Just Like We Version APIs

Every organization that offers an application programming interface almost immediately starts to version it. APIs are essentially contracts between us, service providers, and our users. The bargain is you build your app using our service in some presumably mutually beneficial arrangement, and in exchange we promise to give you a stable platform atop which you will construct your dreams.

Everyone agrees that it is extremely rude to break an API. Changing APIs unexpectedly makes our users sad because their robots will break, and they will be forced to waste time and energy figuring out whatever broke. To prevent this, we version our APIs. Versions are clauses in this contract: we say, this is `v1` or `v2` or `20241231` or whatever, and we hereby promise to not change it. Should you want to use latest and greatest features, you are free to upgrade at your leisure. Or not don't upgrade, that's fine too.

Why don't we do this for user interfaces?

We _could_ version UIs, but we don't.  We change UIs constantly, remorselessly. Every reason for providing stable interfaces applies just as well for _human beings_ as they do for robots – but somehow we only respect the robots.

Why is that? Pure vibes but I feel like the reason ultimately is that we, the computer industry, hate people and wish for them to suffer.

👉 There's absolutely **no reason** why we can't show the same care and attention to how changes impact our UIs as we do to our APIs.

We have zero respect for the effort humans have to put into learning interfaces, and we actively destroy any skills they may have painfully acquired for using the tools we gave them. You can spend a lifetime learning how to use a paint brush, a knife or a needle more skillfully, and be rewarded for it with efficiency and expertise.[^not-original]

Yet once a computer is involved a programmer somewhere will unthinkingly destroy all of that built up skill every 24-36 months just because _[it's no longer fashionable](https://en.wikipedia.org/wiki/Flat_design)_.

Anyways, I was reminded of this while [reading this depressing and correct essay by Ed Zitron about our dystopian present](https://www.wheresyoured.at/never-forgive-them/):

>The tools we use in our daily lives outside of our devices have mostly stayed the same. While buttons on our cars might have moved around […] we generally have a brake, an accelerator, a wheel, and a turn signal. Boarding an airplane has worked mostly the same way since I started flying, other than moving from physical tickets to digital ones. We’re not expected to work out “the new way to use a toilet” every few months because somebody decided we were finishing too quickly.

>Yet our apps and the platforms we use every day operate by a totally different moral and intellectual compass. While the idea of an update is fairly noble… many tech platforms see it as a means to further extract and exploit, to push users into doing things that either keep them on the app longer or take more-profitable actions.

>We as a society need to reckon with how this twists us up, makes us more paranoid, more judgmental, more aggressive, more reactionary, because when everything is subtly annoying, we all simmer and suffer in manifold ways. There is no digital world and physical world — they are, and have been, the same for quite some time, and reporting on tech as if this isn’t the case fails the user. It may seem a little dramatic, but take a second and really think about how many little digital irritations you deal with in a day. It’s time to wake up to the fact that our digital lives are rotten.

>I’m not talking about one single product or company, but most digital experiences. The interference is everywhere, and we’ve all learned to accept conditions that are, when written out plainly, are kind of insane.

>…

> Earlier in the year, smart speaker company Sonos released a redesign of its app that removed accessibility features and the ability to edit song queues or play music from your phone in an attempt to “modernize” the interface, with WIRED suggesting that the changes could potentially open the door to adding a subscription of some sort to help Sonos’ ailing growth…

>Now, what’s important to accept here is that absolutely none of this is done with any real consideration of the wider effects on the customer, as long as the customer continues doing the things that the company needs them to. We, as people, have been trained to accept a kind of digital transience — an inherent knowledge that things will change at random, that the changes may suck, and that we will just have to accept them because that’s how the computer works, and these companies work hard to suppress competition as a means of making sure they can do what they want.

the end that's the tweet full stop #antihumanism #programming

[^not-original]: This is not an original idea; I read something like this on someone's blog, or on Mastodon, but darned if I can find it now.
