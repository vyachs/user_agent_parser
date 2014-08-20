Gem::Specification.new do |s|
  s.name        = 'user_agent_parser'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'User agent parser which distinguishes ios, android, web'
  s.authors     = ['Vyacheslav Soldatkin']
  s.files       = Dir.glob('lib/**/*')
  s.homepage    = 'https://github.com/AlpsVentures/user_agent_parser'
  s.add_runtime_dependency 'useragent_parser'
  s.add_development_dependency 'rspec', '~> 3.0'
end
