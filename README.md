# Introduction
Sometimes you may not want to expose Database table ID on application or on browsers but you need to show/use the ID as encoded.

In that case, record_locator ruby gem will provide you flexible way to show the same ID encoded and at the same time
you can find ActiveRecord object by the encoded id from your application instead of using original database ID!

# How to install
Include the gem into your Gemfile
<pre>
  <code>
    gem 'record_locator', '1.0.0', :git => 'git@github.com:barek2k2/record_locator.git'
  </code>
</pre>

Then run
<pre>
  <code>
    bundle install
  </code>
</pre>

Suppose, you want to apply this encoding stuff on your Book Model's publisher_id then follow this way:
<pre>
  <code>
    class Book &lt; ActiveRecord::Base
     extend RecordLocator
     has_record_locator :publisher_id
   end
  </code>
</pre>

<strong>Now restart your server!</strong>

<p>
<strong> has_record_locator will expect Numeric field only (here publisher_id is Integer)</strong>
</p>

From your ActiveRecord model object, You can get the encoded value by calling encoded_record_locator method:
<pre>
  <code>
    encoded_publisher_id = @book.encoded_record_locator
  </code>
</pre>

Here, encoded_publisher_id will give you the encoded id of publisher_id of Book Model

You can find the ActiveRecord Model Object by passing encoded value, for example:
<pre>
  <code>
    Book.record_locator.find(encoded_publisher_id)
  </code>
</pre>

You can get ActiveRecord objects as Array like this:
<pre>
  <code>
    Book.record_locator.find_all(encoded_publisher_id)
  </code>
</pre>

If you want to pass origin ActiveRecord ID instead of encoded ID then you can pass simply the originla ID and this
gem will give you original Activerecord object as normal like this:
<pre>
  <code>
    Book.record_locator.find(params[:publisher_id])
  </code>
</pre>

#Tested and Supports for
Ruby 1.8.7, 1.9.2,1.9.3,2.0
Rails 2.3,3.2,4.0
