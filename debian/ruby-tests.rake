task :default => :test
require 'rake/testtask'
require 'rbconfig'

Rake::TestTask.new do |t|
  t.libs = []
  t.libs << File.join('debian/ruby-cairo', Config::CONFIG['vendordir'])
  t.libs << File.join('debian/ruby-cairo', Config::CONFIG['vendorarchdir'])
  t.libs << "test"
  t.test_files = FileList['test/test_*.rb'].reject do |test|
    test =~ %r{^test/test_(xml|tee|script)}
  end
  t.ruby_opts << '-rcairo-test-utils' << '-rtest/unit' << '-Idebian' << '-rtest-unit-stub'
  t.verbose = true
end
