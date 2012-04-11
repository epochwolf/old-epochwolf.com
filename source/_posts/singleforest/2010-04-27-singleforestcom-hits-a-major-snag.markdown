---
layout: post
title: "Singleforest.com hits a major snag"
date: 2010-04-27 18:29
comments: true
categories: singleforest
alias: [singleforestcom-hits-a-major-snag]
---
Well I've been working on singleforest.com for a while. I made the mistake of choosing the Rails 3.0 beta with Ruby 1.9 for my application. I've spent almost at much time dealing with framework and library bugs as I have with writing code. Today I hit the final bug. The openid library I've been using doesn't work with several openid providers due to the way Ruby 1.9 handles string encoding. The library throws unhandled exceptions that I can't work around. I could try patching the library myself but I'm already working with 4 patched libraries that will likely not survive the next Rails 3.0 beta release. 

So, I've decided to walk away from rails for a bit. I know I could use Rails 2.3.5 with Ruby 1.8 but I would like a change of scenery. I have previous experience with python so I have been looking at using Django or Pylons. Many people have wasted time on debating the merits of various framework for weeks before choosing one. I will have chosen a framework by this time tomorrow. 