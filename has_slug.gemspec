Gem::Specification.new do |s|
  s.name = %q{has_slug}
  s.version = "0.2.7"
  
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = %q{1.3.1}

  s.date = %q{2010-04-14}
  s.authors = ["Tom-Eric Gerritsen"]
  s.email = %q{tomeric@i76.nl}
  s.homepage = "http://www.i76.nl/"
  s.summary = %q{A slugging plugin for Ruby on Rails}
  s.description = %q{has_slug is a plugin that provides slugging capabilities to Ruby on Rails models. Inspired by the friendly_id plugin.}
  
  s.requirements << "unicode_utils or unicode gem install"
  
  s.require_paths = ["lib"]
  s.files = 
    ["init.rb", "MIT-LICENSE", "Rakefile", "README.rdoc", "lib/has_slug.rb", "lib/has_slug/slug.rb", 
     "lib/has_slug/not_sluggable_class_methods.rb", "lib/has_slug/not_sluggable_instance_methods.rb",
     "lib/has_slug/sluggable_class_methods.rb", "lib/has_slug/sluggable_instance_methods.rb",
     "rails/init.rb", "tasks/has_slug_tasks.rake"]
  s.test_files = 
    ["test/schema.rb", "test/test_helper.rb", "test/factories.rb", "test/models.rb",
     "test/unit/has_slug_test.rb", "rails/init.rb", "test/unit/slug_test.rb"]
  
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.rdoc"]
end