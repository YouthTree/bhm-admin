require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name        = "bhm-admin"
    gem.summary     = %Q{Simple, Rails 3 + Compass admin area.}
    gem.description = %Q{Provides a reasonably dynamic and simple to use admin area for Rails 3 application. Built on a bunch of open source libraries.}
    gem.email       = "sutto@sutto.net"
    gem.homepage    = "http://github.com/Sutto/bhm_admin"
    gem.authors     = ["Darcy Laycock"]
    
    gem.add_dependency "will_paginate"
    gem.add_dependency "inherited_resources"
    gem.add_dependency "show_for"
    gem.add_dependency "compass", ">= 0.10.0.rc4"
    gem.add_dependency "fancy-buttons"
    gem.add_dependency "compass-960-plugin"
    gem.add_dependency "compass-colors"
    
    gem.add_development_dependency "shoulda", ">= 0"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "bhm_admin #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
