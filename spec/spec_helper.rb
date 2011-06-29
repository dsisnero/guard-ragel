require 'rspec'
require 'guard/ragel'

RSpec.configure do |config|
  config.color_enabled = true
  config.run_all_when_everything_filtered = true
  
  config.before(:each) do
    ENV["GUARD_ENV"] = 'test'
    @lib_path = Pathname.new(File.expand_path('../../lib/', __FILE__))
  end
end
