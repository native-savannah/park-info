$LOAD_PATH.unshift 'lib'
require "version"

Gem::Specification.new do |s|
  s.name              = "park_info"
  s.version           = ParkInfo::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Simple library to get theme park information, including Disney."
  s.homepage          = "https://github.com/mnmlst-sftwr/park-info"
  s.email             = "bfordham@gmail.com"
  s.authors           = [ "Bryan Fordham" ]

  s.files             = %w( README.md LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.license          = "MIT"

  s.description       = <<desc
    This is a *very* simple library to access information about theme parks.

    Currently, it is only handling Disney parks, but I plan to add others quickly.
desc
end
