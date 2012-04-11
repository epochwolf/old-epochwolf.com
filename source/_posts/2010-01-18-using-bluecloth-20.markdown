---
layout: post
title: "Using Bluecloth 2.0"
date: 2010-01-18 11:04
comments: true
categories: irl
alias: [using-bluecloth-20]
---
This is a quick reference for how to use the BlueCloth 2.0 gem. I couldn't find anything anywhere on how to use this gem so I used irb and the C source of the plugin to figure it out.

Require the gem in a generic ruby project.

    require 'rubygems'  #needed to load gems.
    gem 'bluecloth', '>= 2.0.0'  #need to specify we want the 2.0 version, not the 1.0 version.
    require 'bluecloth'
  
If you are using Ruby on Rails just add the line below to your environment file.

    config.gem 'bluecloth', :version => '>= 2.0.0' 

Once you have the gem included you can make a wrapper function

    def markdown_parse(str)
      bc = BlueCloth.new(str)
      bc.to_html
    end
  
or a one-liner

    html = BlueCloth.new(str).to_html()
  
If you want to get more complicated and change the default options.

    def markdown_parse(str, options={})
      options = {
        :escape_html => true,
        :strict_mode => false,
      }.update(options)
      bc = BlueCloth.new(str, options)
      bc.to_html
    end
  
A full list of options supported by BlueCloth 2.0.5 is below. Be sure to read the notes, some of them are important. You need to be using an html sanitizer with BlueCloth (such as rgrove's sanitize) if you allow user-submitted html to be used with markdown.

##:remove_links => false

Disable links in markdown. This will ignore the link syntax and break a tags in an unsafe manner. Recommend using a sanitizer instead.

WARNING `<a href="testing">test</a>` is converted to `&lt;a href="testing">test</a>` which leaves a trailing `</a>` which is unsafe. It's not dangerous but it could break the html on your site. It might also be possible to slip a tag past this using unicode or other tricks which is why I recommend using a sanitizer instead of this option.

##:remove_images => false

Disable images in markdown. This will ignore the link syntax and break image tags naively using the same method as above. Recommend using a sanitizer instead.

##:smartypants => true

Enable smartypants with markdown

##:pseudoprotocols => false

Allow url syntax to create named anchors using id: and styled span tags using class:. Unsafe, allows duplicate ids in h tags. Html spec requires ids to be unique.

    [just as he said](id:foo) converts to <a id="foo">just as he said</a> 
    [just as he said](class:foo) converts to <span class="foo">just as he said</span>

##:pandoc_headers => false

Enable Discount extension named "pandoc_headers

This the unit test for this feature, I've never used it myself.

    it "correctly applies the :pandoc_headers option" do
      input = "% title\n% author1, author2\n% date\n\nStuff."
      bc = BlueCloth.new( input, :pandoc_headers => true )
      bc.header.should == {
        :title => 'title',
        :author => 'author1, author2',
        :date => 'date'
      }
      bc.to_html.should == '<p>Stuff.</p>'
    end


##:header_labels => false

Auto generate ids for h tags. Unsafe, allows duplicate ids in h tags. Html spec requires ids to be unique.

    # A header
    Some stuff
    
    ## A header
    More stuff.
    is converted to
    
    <h1 id="A+header">A header</h1>
    <p>Some stuff</p>
    <h2 id="A+header">A header</h2>
    <p>More stuff.</p>


##:escape_html => false

Escape any html the parser finds. Given how naive the html escaping is in :remove_links I would recommend using a sanitizer on top of this.


##:strict_mode => true

When on, it follows the markdown spec strictly allowing the use of intraword emphasis. (`T*hi*s` converts to <code>T<i>hi</i>s</code>) When off, intraword emphasis are disabled and a subscript notation is added. I recommend setting this to false because intraword emphasis is annoying.


##:auto_links => false

Convert bare urls in text into clickable links.


##:safe_links => false

Only allow links that have recognized protocols to be parsed. Turning this on prevents relative urls from working. I recommend leaving this off and using a sanitizer instead.