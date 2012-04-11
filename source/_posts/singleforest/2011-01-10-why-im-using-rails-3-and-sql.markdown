---
layout: post
title: "Why I'm Using Rails 3 and SQL"
date: 2011-01-10 5:25
comments: true
categories: singleforest
alias: [why-im-using-rails-3-and-sql]
---
Anyone who has followed my modest blog will be familiar with the various frameworks and databases I have tried using for singleforest.com. Well, I have finally come to a conclusion. A real conclusion this time. Since August 2010 I have been working with Rails 3 using SQLite3 as a database backend. For anyone on Hacker News that has met me in Chicago, this is the version I demoed on my iPad at the Publican.


I would like to review the frameworks and database previous iterations of singleforest.com used and why I am not using them today.

## Frameworks

### Rails 2
I originally started coding with rails 2. It was an easy decision to make since I had learned rails during my internship and I had continued to use it after the end of my internship. The first rails 3 beta was released early in my development process. I found rails 3 to be cleaner than earlier versions. The routing api was elegant instead of clunky. (Yes, specifying :controller and :action for every route is clunky even if you can scope them.) The addition of AREL to active record was also important once I started using sql databases, my current code base relies on it for automatic sorting and pagination.  As a result I made several attempts to use rails 3 which resulted in enormous amount of pain. During the betas several key gems such as authlogic, formtastic, and various active record gems were either not compatible or buggy. I was forced back to rails 2 until rails 3 was out of beta. Once 3 was out of beta I switched back to it.

### Django
I had given Django some thought initially. I had played around with Django before and found it to be at least as large of a framework as Rails. I went with rails because of ruby. I hadn’t used python for almost a year when I started singleforest.com and I was looking at the start of a new semester in a few weeks. 

### Pylons
During my fights over whether to use Rails 2 or Rails 3, I decided to give a python framework a try. I dismissed Django for the same reasons as before, it’s too large of a framework to learn quickly. I figured I would be up to relearning python since I had enough free time between classes. Turns out relearning python wasn’t the problem, the documentation on pylons was. At the time I was learning pylons, the available documentation on the internet was out of date and pydoc refused to build the documentation for the version I was using. The only decent tutorial I could find was a half finished book on the previous version. I quickly ran into issues with the book. A quick trip to irc revealed to me there was no authoritative documentation, no tutorials for the current version, and no one had any idea how to actually build a pylons project from scratch. I was told to download a sample application (the pylon’s project website) and modify that. Upon doing that I found out I now had three different version of pylons on my system and all of them hated each other. I also had issues with python’s tooling. (Pydoc, virtualenv, and multiple package managers) In the end I went back to rails because I didn’t have the patience or time to deal with a pylons.

## Databases

### CouchDB
What’s not to love about CouchDB? From a system administrative perspective it’s the most awesome database ever. It’s crash-only, you can back it up with rsync, and it scales like nuts. From a programming perspective it’s a little more work. You need to define every query you will ever do before you do it. It’s not as bad as you think. CouchDB has a development mode that will run any query you want without an index. Slow as hell but flexible, you just have to define the indexes before you deploy. I can live with that. Data is stored as json documents in a single silo. I can live with that. For an old version of my application it would work fine. I would have loved to use it. 

Why didn’t I? I need joins in the future. CouchDB could work if I was willing to make trade offs on future design. I plan to add groups to singleforest. The queries I would need can’t run on couchdb without a lot of denormalization. Adding and removing users from groups and calculating activity on groups would be expensive and require cron jobs. Ironically, groups wouldn’t be able to scale on CouchDB. 

### MongoDB
I liked using mongodb but the tradeoffs make me uncomfortable from a system administration perspective. MongoDB plays fast and loose with data to get high speeds as a result, it requires two servers for data safety. I don’t currently have the resources to deploy two database servers. I did not feel comfortable trying to maintain a single server against strong recommendations not to. Later I found another reason not to use MongoDB: I need joins.  

## In Conclusion
Since rails 3 has matured it has been an absolute joy to work with. I do not regret having spent so much time switching between databases and frameworks. It’s given me a better appreciation for the tools I’m using now. Learning to model data in json has allowed me to model data better in sql. Fighting with python’s toolset has made me thankful for ruby version manager and bundler. 

## Project Update
Screenshots of the current version available on my [deviantArt](http://epochwolf.deviantart.com/gallery/27711539) account.