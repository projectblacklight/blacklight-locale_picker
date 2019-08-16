# Helpers for building the locale picker
module Blacklight::LocalePicker::LocaleHelper
  # Locales to display in the locale picker; by default, it picks up
  # the information from the engine configuration
  def available_locales
    Blacklight::LocalePicker::Engine.config.available_locales
  end

  # Returns the url for the current page in the new locale. This may be
  # overridden in downstream applications where our naive use of `url_for`
  # is insufficient to generate the expected routes
  def current_page_for_locale(locale)
    initial_exception = nil

    ([self] + additional_locale_routing_scopes).each do |scope|
      return scope.public_send(:url_for, locale: locale)
    rescue ActionController::UrlGenerationError => e
      initial_exception ||= e
    end

    raise initial_exception
  end

  # Returns an array of routing scopes (e.g. mounted engines) to attempt to use
  # for switching locale-specific routes. This is likely overridden in complex
  # applications to add scopes for additional mounted engines
  def additional_locale_routing_scopes
    [blacklight]
  end
end
