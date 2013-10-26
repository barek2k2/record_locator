Gem::Specification.new do |s|
  s.name = %q{record_locator}
  s.authors = %q{Abdul Barek}
  s.version = "1.0.0"
  s.date = %q{2013-10-21}
  s.email = 'barek2k2@gmail.com'
  s.summary = %q{record_locator finds ActiveRecord object using base32 encoded data}
  s.files = ["README.md", "Gemfile", "Rakefile",
            "lib/record_locator_finder.rb", "lib/record_locator_util.rb", "lib/record_locator.rb",
	    "spec/database.yml", "spec/spec_helper.rb", "spec/record_locator_spec.rb","models/book.rb"
  ]
   
  s.require_paths = ["lib","models","spec"]

end
