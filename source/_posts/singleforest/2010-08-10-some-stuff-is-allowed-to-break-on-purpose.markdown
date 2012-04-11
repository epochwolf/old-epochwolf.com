---
layout: post
title: "Some stuff is allowed to break on purpose."
date: 2010-08-10 17:13
comments: true
categories: singleforest
alias: [some-stuff-is-allowed-to-break-on-purpose]
---
I was playing around with markdown and I discovered attempting to submit indented text breaks things rather nicely.

This is what indented text looks like when viewed.

{% img /images/sf/breaking_indents.png %}

With a black background you have no hope of reading the submission. Editing is even worse.

{% img /images/sf/missing_editor.png %}

The text box for editing has completely disappeared... wait, there is a horizontal scrollbar!

{% img /images/sf/missing_editor_found.png %}

Ah, there it is. That's going to be a pain to edit.

I didn't plan on breaking indented text this badly but it certainly works. I don't want any user-submitted content to have indentation. I have a very specific reason for this. I want to present every submission in the same, readable format. If you want indented text, I would be happy to use css to properly indent it for you! I want the text on singleforest to be readable and consistent when submitted. Using markdown enforces some level of standardization. Restricting allowed html helps even more. (CSS may work in the preview but you ain't getting colored fonts in your literature. Yeah, I remove the <font> tag too.)