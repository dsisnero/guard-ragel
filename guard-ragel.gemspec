Gem::Specification.new do |s|
  s.name         = 'guard-ragel'
  s.version      = '0.0.1'
  s.platform     = Gem::Platform::RUBY
  s.authors      = ['John Barker']
  s.email        = ['jebarker@gmail.com']
  s.summary      = 'Guard gem for Ragel'
  s.description  = 'Guard::Ragel automatically rebuilds ragel .rl files into their corresponding .rb files'
  
  s.required_rubygems_version = '>= 1.3.6'
  
  s.add_dependency 'guard',   '>= 0.2.1'
  
  s.add_development_dependency 'bundler', '~> 1.0.2'
  s.add_development_dependency 'rspec',   '> 2.0.0.rc'
  
  s.files        = Dir.glob('{lib}/**/*') + %w[LICENSE README.md]
  s.require_path = 'lib'
end
