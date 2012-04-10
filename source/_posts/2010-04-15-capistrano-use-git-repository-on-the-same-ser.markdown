---
layout: post
title: "Capistrano: use git repository on the same server you deploy to"
date: 2010-04-15 18:32
comments: true
categories: programming
aliases: [capistrano-use-git-repository-on-the-same-ser]
---
I ran across an interesting problem the other night. I finally convinced myself that I need to set up automated deployment for a personal website I was working on. The website is written in Ruby on Rails and I decided to use capistrano for deployment like ever other person I know that uses rails. The first problem I had was the capistrano docs are really really lacking in details. The tutorial covers the basics but that only works if you aren't doing something wacky.

I'm using git for version control which isn't all that odd. What is odd is that I don't have a remote repository. I don't really need to because I backup my laptop almost every night.  I don't want capistrano to use the copy method for deployment because I don't want to be trying to push several hundred kilobytes of data over a coffee shop's overloaded public wifi for every deployment.

I didn't want to use a git host like github or any one of a hundred others because I already rent a Virtual Private Server from slicehost.com. (256 slice to be specific) So I decided to just use git over ssh and store a copy of my repository on my server. It was pretty easy to create an empty repository on my server and push my local copy over. Capistrano however did not like this. My website needed to deploy to the same sever my remote repository was sitting on. There is no tutorial or examples for doing this. I googled for over an hour and read all the docs on capistrano.

The problem with capistrano is that by default the :repository variable only paths to urls or files on your local machine. I couldn't find a way to tell capistrano to look on the deployment server for the repository.

The solution:

    set :repository, "file:///srv/git/repository.git"
    set :local_repository, "file://."

The above works because setting undocumented variable :local_repository tells capistrano that :repository is a location on the app server. Suddenly, I'm able to deploy using export instead of copy. I hope I saved someone else hours of searching to figure out how to do this.

