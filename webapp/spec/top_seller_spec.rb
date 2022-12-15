require 'rails_helper'

RSpec.describe 'Main', type: :feature do
	scenario 'visit top seller page' do
		visit '/login'

    fill_in 'email', with: 'somchai@uiuc.alumni'
    fill_in 'password', with: '123'
    
    click_button 'Log In'

    visit '/top_seller'

    expect(page).to have_content 'Top Seller'

    first_seller = page.find("div.top-seller-card", text: 'Jet K')
    expect(first_seller).to have_content 'total price : 10000'

    second_seller = page.find("div.top-seller-card", text: 'Somchai SPJ')
    expect(second_seller).to have_content 'total price : 1050'
	end

  scenario 'search top seller page with invalid time' do
		visit '/login'

    fill_in 'email', with: 'somchai@uiuc.alumni'
    fill_in 'password', with: '123'
    
    click_button 'Log In'

    visit '/top_seller'

    fill_in 'start_date', with: "12/21/2022"
    fill_in 'end_date', with: "12/1/2022"

    click_button 'commit'

    expect(page).to have_content 'Invalid start and end date'
	end

  scenario 'search top seller page with valid time' do
		visit '/login'

    fill_in 'email', with: 'somchai@uiuc.alumni'
    fill_in 'password', with: '123'
    
    click_button 'Log In'

    visit '/top_seller'

    fill_in 'start_date', with: "12/10/2022"
    fill_in 'end_date', with: "12/24/2022"

    click_button 'commit'

    first_seller = page.find("div.top-seller-card", text: 'Jet K')
    expect(first_seller).to have_content 'total price : 10000'

    second_seller = page.find("div.top-seller-card", text: 'Somchai SPJ')
    expect(second_seller).to have_content 'total price : 1000'
	end

end