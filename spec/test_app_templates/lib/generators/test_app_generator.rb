require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root "./spec/test_app_templates"

  # if you need to generate any additional configuration
  # into the test app, this generator will be run immediately
  # after setting up the application

  def add_gems
    version = ENV['BLACKLIGHT_VERSION']
    if version
      gem 'blacklight', version
    else
      gem 'blacklight' # latest version
    end

    Bundler.with_clean_env do
      run 'bundle install'
    end
  end

  def run_blacklight_generator
    say_status('warning', 'GENERATING BL', :yellow)

    generate 'blacklight:install', '--devise'
  end

  def install_engine
    generate 'blacklight:locale_picker:install'
  end

  def add_test_locales
    initializer 'test_configuration.rb' do
      "Blacklight::LocalePicker::Engine.config.available_locales = ['en', 'es', 'pt-BR']"
    end
  end
end
