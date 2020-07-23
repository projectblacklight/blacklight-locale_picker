# frozen_string_literal: true

require 'rails/generators'

module Blacklight::LocalePicker
  ##
  # Blacklight::LocalePicker install generator
  class Install < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def add_locale_picker_to_controller
      inject_into_file 'app/controllers/application_controller.rb', after: 'include Blacklight::Controller' do
        "\n  include Blacklight::LocalePicker::Concern"
      end
    end

    def add_locale_picker_helpers
      inject_into_file 'app/helpers/application_helper.rb', after: 'module ApplicationHelper' do
        "\n  include Blacklight::LocalePicker::LocaleHelper"
      end
    end

    def install_webpacker
      return unless Rails.version.to_i == 6

      rake 'webpacker:install'
    end
  end
end
