module Blacklight
  module LocalePicker
    class Engine < ::Rails::Engine
      config.available_locales = []

      config.autoload_paths += %W(
        #{config.root}/app/controllers/concerns
      )
    end
  end
end
