# Introduction
Sometimes you may not want to expose Database table ID on application but you need to show the ID.

In that case, record_locator Gem will provide you flexiable stuff to show the same ID encoded and at the same time
you can find ActiveRecord object by the encoded id from your application instead of using original ID.

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
    @book.encoded_record_locator
  </code>
</pre>

You can find the ActiveRecord Model Object by passing encoded value, for example:
<pre>
  <code>
    Blog.record_locator.find(params[:encoded_publisher_id])
  </code>
</pre>
