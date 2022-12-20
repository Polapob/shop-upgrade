require 'rails_helper'

RSpec.describe 'Security', type: :feature do
	scenario 'test injection' do
    visit '/login'

    fill_in 'email', with: 'somchai@uiuc.alumni'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    expect {
      visit '/market/edit/1=1;drop table items;'
    }.to raise_error(URI::InvalidURIError)

    visit '/my_inventory'
    expect(page).to have_content 'Bastard Sword'
    expect(page).to have_content 'Crime & Punishment'
    expect(page).to have_content 'Korea King'
	end
end
