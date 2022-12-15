require 'rails_helper'

RSpec.describe 'Market', type: :feature do
  scenario 'visit market page without logging in' do
    visit '/my_market'

    expect(page).to have_content 'Login Required'
  end
  
  scenario 'visit market page as seller' do
    visit '/login'

    fill_in 'email', with: 'somchai@uiuc.alumni'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/my_market'

    expect(page).to have_content 'Permission Denied : No Seller!'
  end

	scenario 'visit market page as buyer' do
    visit '/login'

    fill_in 'email', with: 'nattee@chula.ac.th'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/my_market'

    expect(page).to have_content 'Market'
    expect(page).to have_content 'Item_id'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Picture'
    expect(page).to have_content 'Stock'
    expect(page).to have_content 'Price'
    expect(page).to have_content 'Qty Buy'
	end

  scenario 'click buy button without informing quantity' do
    visit '/login'

    fill_in 'email', with: 'nattee@chula.ac.th'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/my_market'

    td = page.find('td', text: 'Bastard Sword')
    tr = td.find(:xpath, './parent::tr')
    tr.click_button 'commit'
    
    expect(page).to have_content 'You need to insert positive quantity.'
	end

  scenario 'click buy button with exceeding quantity' do
    visit '/login'

    fill_in 'email', with: 'nattee@chula.ac.th'
    fill_in 'password', with: '123'
    
    click_button 'Log In'

    visit '/my_market'

    td = page.find('td', text: 'Bastard Sword')
    tr = td.find(:xpath, './parent::tr')
    tr.fill_in 'market[qty]', with: 10000
    tr.click_button 'commit'
    
    expect(page).to have_content 'You cannot buy item more than the number of stock.'
	end

  scenario 'click buy button with valid quantity' do
    visit '/login'

    fill_in 'email', with: 'nattee@chula.ac.th'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/my_market'

    td = page.find('td', text: 'Bastard Sword')
    tr = td.find(:xpath, './parent::tr')
    tr.fill_in 'market[qty]', with: 1
    tr.click_button 'commit'

    expect(page).to have_content 'You successfully bought the item.'
  end
end