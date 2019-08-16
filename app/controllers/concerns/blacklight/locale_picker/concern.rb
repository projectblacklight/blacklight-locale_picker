# frozen_string_literal: true

##
# A module to add set locales that is sent to application controller
module Blacklight::LocalePicker::Concern
  extend ActiveSupport::Concern
  included do
    before_action :set_locale

    def default_url_options
      { locale: (I18n.locale unless I18n.default_locale == I18n.locale) }
    end

    before_action do
      blacklight_config.add_nav_action(:locale, partial: 'shared/locale_picker')
    end

    private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end
end
