require 'rails_helper'

RSpec.describe 'Main', type: :feature do
	scenario 'click buy button with valid quantity' do
		visit '/login'

		fill_in 'email', with: 'nattee@chula.ac.th'
		fill_in 'password', with: '123'
		
		click_button 'Log In'

		visit '/purchase_history'

    expect(page).to have_content 'My Purchase History'

    expect(page).to have_content 'Bastard Sword'
    expect(page).to have_content 'Crime & Punishment'
    expect(page).to have_content 'Red Pill'
	end
end