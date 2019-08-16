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
  end
end
