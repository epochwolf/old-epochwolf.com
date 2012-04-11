---
layout: post
title: "Singleforest: screenshot "
date: 2010-02-03 10:37
comments: true
categories: singleforest
alias: [singleforest-screenshot]
---
After 2 days of really hard work, I've gotten comments working on both literature and the forums. It would have been easier if ruby on rails didn't have such a bungled acts_as_tree implementation. I was forced to use awesome_nested_set to implement a sane scheme for loading threaded comments. I figured it was better to use a decent plugin that I could drop later if I needed to than spend a week to write a better version of acts_as_tree now. (Nested set plugins have a rather nasty O(n) update scheme) As a result I can load an entire forum thread with only 3 queries.


Enjoy the screenshot. (The website is probably <strike>1-2 months</strike> 2-4 years<sup>\*</sup> out from public beta tests)

{% img /images/sf/screenshot.png %}

\*Rule of estimates: double and increase by one order of magnitude. (Months = Years, Years = Decades)