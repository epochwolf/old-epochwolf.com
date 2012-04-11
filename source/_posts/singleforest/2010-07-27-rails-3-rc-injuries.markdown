---
layout: post
title: "Rails 3 RC injuries."
date: 2010-07-27 09:26
comments: true
categories: singleforest
alias: [rails-3-rc-injuries]
---
If you're going to run bleeding edge, you will bleed profusely. I nearly lost an arm today. I upgraded my application to Rails 3 rc from Rails 3 beta4. The list of problems I've encounter is not long but very annoying.. 

1.  gem install rails --pre on top of existing rails beta causes vague untraceable errors just like upgrading to beta2 and beta3.. 
    1.  Solution is to remove all installed gems. **manually**.
    2.  Happily discover rvm has support for this. (rvm gemset clear)
    3.  Install rails 3 rc and all dependencies.. 
    4.  While gems download find out in #rails-contrib that rails 3 rc isn't loading the lib/ folder  
        1.  Add "config.autoload_paths += %W(#{config.root}/lib)" to application.rb
    5.  Ruby 1.9.1 segfautls on load.. Joy of joys but not surprising.
2.  Try ruby 1.9.2-preview1
    1.  Remove all installed gems
    2.  Install rails 3 rc. and application gems
    3.  Instant sigabrt on running rails server
    4.  Discover in #rails-contrib that preview1 is buggy as hell... (then why does rvm install 1.9.2 install preview1?)
3.  Try ruby 1.9.2-head
    1.  No gems to remove because I need to update the head anyway.
    2.  Download, compile, and install ruby 1.9.2-head
    3.  Install rails 3 rc and application gems
    4.  Instant internal server errors relating to failsafe failing.
    5.  \#rails-contrib recommends 1.9.2-rc2
4.  Try ruby 1.9.2-rc2
    1.  Not installed
    2.  Download, compile, and install ruby-1.9.2-rc2
    3.  Install rails 3 rc and application gems
    4.  Instant internal server errors relating to failsafe failing.
5.  Swear quietly and profusely
6.  Start testing
    1.  Build new rails 3 rc application.   
        1.  launches okay with simple controller and view
        2.  compare boot.rb, application.rb, environment/ and initializers/ with non-working app. 
        3.  no difference...
    2.  Test difference configurations with non-working application
        1.  Throw exception in home#index
        2.  Works, controllers are probably okay
        3.  Render index view without layout
        4.  500 Error
        5.  Render index using erb instead of haml
        6.  Works...
    3.  Back to new rails 3 rc app
        1.  Add haml gem to Gemfile and make a basic haml view
        2.  Works okay.. 
        3.  Add haml configuration initializer from non-working application
        4.  500 Error
        5.  Start playing around with different configuration options
        6.  Discovered setting. :encoding to :"utf-8" (notice the colon, :"" is a symbol, not a string)
        7.  Using "UTF-8" (string) instead of :"utf-8" (symbol) works...
    4.  Change :"utf-8" to "UTF-8" in non-working application
        1.  Application works now.

I am now able to continue working on singleforest.com but I'm ready for a nap. I estimated this morning I would spend several hours just getting my application working again. For once I was correct. It only took several hours instead of the entire day.

I would like to thank elux and nbibler in #rails-contrib on freenode for helping me out.