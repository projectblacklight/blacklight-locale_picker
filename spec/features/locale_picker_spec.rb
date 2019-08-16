require 'spec_helper'

RSpec.describe 'Locale picker', type: :feature do
  it 'switches between languages' do
    visit root_url

    expect(page).to have_css '#language-dropdown-menu'
    expect(page).to have_css 'li', text: 'English'
    expect(page).to have_css 'li', text: 'Spanish'

    expect(page).to have_text 'Welcome'
    click_link 'Spanish'
    expect(page).to have_text 'Bienvenido'

    click_link 'Entrar'
    expect(page).to have_text 'Historia'
  end
end
