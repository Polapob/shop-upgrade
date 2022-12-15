require 'rails_helper'

RSpec.describe 'Main', type: :feature do
	scenario 'visit main page without logging in' do
		visit '/'

    expect(page).to have_content 'Login Required'
    expect(page).to have_content 'Login'
	end

  scenario 'visit main page as admin' do
    visit '/login'

    fill_in 'email', with: 'jetnipit54@gmail.com'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/'

    expect(page).to have_content 'Hi admin'
    expect(page).to have_content 'Welcome to Shop ver. Upgrade'

    within('div.page-container') do
      expect(page).to have_content 'Show Users'
      expect(page).to have_content 'Goto Market'
      expect(page).to have_content 'Goto Inventory'
      expect(page).to have_content 'Purchase History'
      expect(page).to have_content 'Sale History'
      expect(page).to have_content 'Top Seller'
    end

    within('nav') do
      expect(page).to have_content 'Logout'
      expect(page).to have_content 'home'
      expect(page).to have_content 'Profile'
      expect(page).to have_content 'Show Users'
    end

    click_link 'Profile'

    expect(page).to have_content 'Display User Information'

    click_link 'home'

    expect(page).to have_content 'Welcome to Shop ver. Upgrade'

    click_link 'Show Users'

    expect(page).to have_content 'Show List of Users'

    click_link 'home'

    click_button 'Goto Market'

    expect(page).to have_content 'Market'

    click_link 'home'

    click_button 'Goto Inventory'

    expect(page).to have_content 'My Inventory'

    click_link 'home'

    click_button 'Purchase History'

    expect(page).to have_content 'My Purchase History'

    click_link 'home'

    click_button 'Sale History'

    expect(page).to have_content 'My Sale History'

    click_link 'home'

    click_button 'Top Seller'

    expect(page).to have_content 'Top Seller'

    click_link 'home'

    click_link 'Logout'

    expect(page).to have_content 'Login'
  end

  scenario 'visit main page as seller' do
    visit '/login'

    fill_in 'email', with: 'somchai@uiuc.alumni'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/'

    expect(page).to have_content 'Hi seller'
    expect(page).to have_content 'Welcome to Shop ver. Upgrade'

    within('nav') do
      expect(page).to have_content 'Logout'
      expect(page).to have_content 'home'
      expect(page).to have_content 'Profile'
      expect(page).to have_content 'My Inventory'
      expect(page).to have_content 'Sale History'
    end

    within('div.page-container') do
      expect(page).to have_content 'Goto Inventory'
      expect(page).to have_content 'Sale History'
      expect(page).to have_content 'Top Seller'
    end
    click_link 'Profile'

    expect(page).to have_content 'Display User Information'

    click_link 'My Inventory'

    expect(page).to have_content 'My Inventory'

    click_link 'Sale History'

    expect(page).to have_content 'My Sale History'

    click_link 'home'

    expect(page).to have_content 'Welcome to Shop ver. Upgrade'

    click_button 'Goto Inventory'

    expect(page).to have_content 'My Inventory'

    click_link 'home'

    click_button 'Sale History'

    expect(page).to have_content 'My Sale History'

    click_link 'home'

    click_button 'Top Seller'

    expect(page).to have_content 'Top Seller'

    click_link 'home'

    click_link 'Logout'

    expect(page).to have_content 'Login'
  end

  scenario 'visit main page as buyer' do
    visit '/login'

    fill_in 'email', with: 'nattee@chula.ac.th'
    fill_in 'password', with: '123'
    
    click_button 'Log In'

    visit '/'

    expect(page).to have_content 'Hi buyer'
    expect(page).to have_content 'Welcome to Shop ver. Upgrade'

    within('nav') do
      expect(page).to have_content 'Logout'
      expect(page).to have_content 'home'
      expect(page).to have_content 'Profile'
      expect(page).to have_content 'Market'
      expect(page).to have_content 'Purchase History'
    end

    within('div.page-container') do
      expect(page).to have_content 'Goto Market'
      expect(page).to have_content 'Purchase History'
    end

    click_link 'Profile'

    expect(page).to have_content 'Display User Information'

    click_link 'home'

    expect(page).to have_content 'Welcome to Shop ver. Upgrade'

    click_link 'Market'

    expect(page).to have_content 'Market'

    click_link 'Purchase History'

    expect(page).to have_content 'My Purchase History'

    click_link 'home'

    click_button 'Goto Market'

    expect(page).to have_content 'Market'

    click_link 'home'

    click_button 'Purchase History'

    expect(page).to have_content 'My Purchase History'

    click_link 'home'

    click_link 'Logout'

    expect(page).to have_content 'Login'
  end
end
