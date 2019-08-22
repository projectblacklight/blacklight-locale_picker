begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'
require 'engine_cart/rake_task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Blacklight::LocalePicker'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'bundler/gem_tasks'

require 'solr_wrapper'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

namespace :i18n do
  desc 'Check for missing translations'
  task :health do
    system 'bundle exec i18n-tasks health'
  end
end

require 'engine_cart/rake_task'

task ci: ['engine_cart:generate'] do
  ENV['environment'] = 'test'

  SolrWrapper.wrap(port: '8983') do |solr|
    solr.with_collection(name: 'blacklight-core', dir: File.join(File.expand_path(File.dirname(__FILE__)), '.internal_test_app', 'solr', 'conf')) do
      within_test_app do
        system 'bundle install'
        system 'bundle exec rake db:migrate'
      end

      # run the tests
      Rake::Task['spec'].invoke
    end
  end
end

task default: %i[i18n:health ci]
