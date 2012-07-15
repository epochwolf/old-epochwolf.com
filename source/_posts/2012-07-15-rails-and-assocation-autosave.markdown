---
layout: post
title: "Why autosave doesn't work on belongs_to associations"
date: 2012-07-15 12:53
comments: true
categories: programming
---
*This post relates to Rails 3.2. It probably applies all the way back to Rails 2 but I make no guarantees of past or future applicability.*

The rails docs on association autosave for belongs_to currently reads 

{% blockquote ActiveRecord::Associations::ClassMethods http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-belongs_to Rails docs %}
If true, always save the associated object or destroy it if marked for destruction, when saving the parent object. If false, never save or destroy the associated object. By default, only save the associated object if it’s a new record.
{% endblockquote %}

Clear enough. So you would expect this code to work.

{% codeblock lang:ruby %}
class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :series

  # nested_attributes_for doesn't work on belongs_to association
  # so we duplicate a subset of that behavior for new records
  attr_accessor :series_title 

  before_save :save_series_title, if: ->(o){ o.series_id.nil? && o.series_title }

  def save_series_title
    self.series = user.series.find_or_initialize_by_title(series_title)
  end 
end
{% endcodeblock %}


What the documentation doesn't tell you is that this autosave for a *belongs_to* association is implemented as a *before_save* callback. This is obviously going to throw a wrench in things. Other associations like has_may and has_one are implemented in a after_create/after_update callback. 

The solution for the example is rather simple.

{% codeblock lang:ruby %}
def save_series_title
  self.series = user.series.find_or_initialize_by_title(series_title)
  # Need to manually save since the autosave callbacks have already been called.
  self.series.save
end
{% endcodeblock %}

Calling save at the last line of the function will maintain the same functionality of the autosave callbacks. If the association fails to save, the callback returns false, the save is aborted and the transaction is rolled back.

## Why this behavior exists

The save order for belongs_to callbacks is different for a very simple and logical reason. The foreign key for a belongs_to association is on the record that is being saved. So the association needs to to be saved before the record it's on so it can set the field before the query is executed. For the same reasons has_many and has_one associations save after the query executes since those associations need to wait for the record to have an id before they can be saved. 


