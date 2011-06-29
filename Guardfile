guard 'rspec', :version => 2 do
  watch(%r{^spec/assets/(.+)\.rl$})   { "spec" }
  watch(%r{^spec/guard/.+_spec\.rb$})
  watch(%r{^lib/guard/(.+)\.rb$})     { |m| "spec/guard/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')        { "spec" }
end
