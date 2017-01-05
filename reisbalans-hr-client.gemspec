Gem::Specification.new do |s|
  s.name        = 'reisbalans-hr-client'
  s.version     = '0.0.1'
  s.date        = '2017-01-05'
  s.summary     = "Query the reisbalans hr client"
  s.description = "A gem to query the reisbalans hr client"
  s.authors     = ["Zilverline"]
  s.email       = 'info@zilverline.com'
  s.files       = Dir.glob("lib/**/*")
  s.homepage    = 'http://rubygems.org/gems/reisbalans-hr-client'
  s.license     = 'MIT'

  s.add_dependency 'oauth2', "1.2.0"
end
