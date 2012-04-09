---
layout: post
title: 'Net::HTTPBadResponse: wrong status line: "<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML 2.0//EN\">"'
date: 2011-12-06 17:19
comments: true
categories: programming
---
If you ever see: `Net::HTTPBadResponse: wrong status line "<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML 2.0//EN\">"`

Then you probably forgot to use ssl with your request to port 443. Apache coughed up a 400 error page over ssl in a way that caused the ruby standard library Net::HTTP to vomit exceptions all over your application.

This behavior was discovered on with Ruby 1.8.7 patch level 352. Judging by how it affected all the development system at my work, it affects all Ruby 1.8.7 patch levels equally. I have no ideal what happens with Ruby 1.9.