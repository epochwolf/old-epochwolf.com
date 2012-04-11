---
layout: post
title: "Singleforest Beta Soon (for real)"
date: 2011-04-14 16:15
comments: true
categories: singleforest
alias: [singleforest-beta-soon-for-real]
---

So close, I can taste it. Singleforest is nearly ready for beta. I've hammered the most the major bugs I'm aware of. 

What's left before launch?

* Some of the custom logging code is storing passwords. That needs to get fixed before the site can go live.
* Moving the server from Rackspace to WebbyNode. Waiting on WebbyNode to get debian 6 out. Will go with Ubuntu in a pinch. 
* Need to write up Terms of Service and Rules documents. 

Some of the issues getting the site ready:

* Getting SSL/nonSSL redirection working properly was not happening. 
  * Moved the entire site to ssl instead. Easier and more secure anyway.
* Getting tests written for some of the code. RSpec fought me every step of the install process.
  * Releasing the beta with only minimal test coverage, will add tests as bugs pop up. 
* Writing my own css was taking way too much time.
  * Purchased a theme for $20
  * Will fix some of the icky coloration later. (background too bright, link color too light) 
* Event system was pretty complicated and was breaking a lot of code
  * Stripped events and notifications to the minimum that was required and stopped trying to ensure they get saved.
* Spending too much time making the ajax stuff nicer
  * Stopped working on writing my own widget library and settled on a just works solution for now.

I can't wait to for this thing to be live. It's been way too long. 