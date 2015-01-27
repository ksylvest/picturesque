$:.push File.expand_path("../lib", __FILE__)

require "picturesque/version"

Gem::Specification.new do |s|
  s.name        = "picturesque"
  s.version     = Picturesque::VERSION
  s.authors     = ["Kevin Sylvestre"]
  s.email       = ["kevin@ksylvest.com"]
  s.homepage    = "https://github.com/ksylvest/picturesque"
  s.summary     = "Picturesque makes image resizing simple"
  s.description = "Picturesque exposes a simple API for resizing images"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "mini_magick"

  s.add_development_dependency "pg"
end
