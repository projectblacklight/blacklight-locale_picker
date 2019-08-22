require 'spec_helper'

RSpec.describe 'Locale picker', type: :feature do
  it 'switches between languages' do
    visit root_url

    expect(page).to have_css '#language-dropdown-menu'
    expect(page).to have_css 'li', text: 'English'
    expect(page).to have_css 'li', text: 'Español'

    expect(page).to have_text 'Welcome'
    click_link 'Español'
    expect(page).to have_text 'Bienvenido'

    click_link 'Entrar'
    expect(page).to have_text 'Historia'
    expect(page).to have_css 'li', text: 'English'
  end

  it 'handles locales with country codes' do
    visit root_url
    
    expect(page).to have_css '#language-dropdown-menu'
    expect(page).to have_css 'li', text: 'English'
    expect(page).to have_css 'li', text: 'Português braileiro'

    expect(page).to have_text 'Welcome'
    click_link 'Português braileiro'
    expect(page).to have_text 'Bem-Vindo'
  end
end
