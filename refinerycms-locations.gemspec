
Gem::Specification.new do |s|
  s.name          = 'refinerycms-locations'
  s.version       = '0.1.0'
  s.authors       = ["chaunce"]
  s.email         = ["chaunce.slc@gmail.com"]
  s.homepage      = "https://github.com/chaunce/refinerycms-locations"
  s.description   = 'Ruby on Rails Locations engine for Refinery CMS'
  s.date          = '2011-01-26'
  s.summary       = 'Ruby on Rails Locations engine for Refinery CMS'
  s.require_paths = %w(lib)
  s.files         = Dir['lib/**/*', 'config/**/*', 'app/**/*']
  s.add_dependency("geocoder")
  s.add_dependency("spreadsheet")
  s.add_development_dependency("rspec", [">= 0"])
  s.add_development_dependency("autotest-standalone")
  s.add_development_dependency("factory_girl")
  s.add_development_dependency("factory_girl_rails")
  s.add_development_dependency("sqlite3", [">= 0"])
  s.add_development_dependency("refinerycms", [">= 0"])
  s.add_development_dependency("refinerycms-testing", [">= 0"])
  s.add_development_dependency("rake", [">= 0"])
  s.add_development_dependency("debugger", [">= 0"])
  s.add_development_dependency('machinist', '>= 2.0.0.beta2')
  s.add_development_dependency('faker')
end
