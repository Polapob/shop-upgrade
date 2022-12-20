require 'rails_helper'

RSpec.describe 'Main', type: :feature do
  scenario 'visit inventory as Mr. Somchai' do
    visit '/login'

    fill_in 'email', with: 'somchai@uiuc.alumni'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/my_inventory'
      
    sword_item = page.find('tr', text: 'Bastard Sword')
    expect(sword_item).to have_content 'Edit'
    expect(sword_item).to have_content 'Remove from the market'

    book_item = page.find('tr', text: 'Crime & Punishment')
    expect(book_item).to have_content 'Edit'
    expect(book_item).to have_content 'Remove from the market'
  end

  scenario 'change published item quantity' do
    visit '/login'

    fill_in 'email', with: 'somchai@uiuc.alumni'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/my_inventory'
    
    sword_item = page.find('td', text: 'Bastard Sword').find(:xpath, './parent::tr')
    sword_item.click_link('Edit')

    expect(page).to have_content 'Edit market after created'

    fill_in 'market[price]', with: "1000"
    fill_in 'market[stock]', with: "100"

    click_button 'commit'

    sword_item = page.find('td', text: 'Bastard Sword').find(:xpath, './parent::tr')
    expect(sword_item).to have_content "100"
  end

  scenario 'delete item from market' do
    visit '/login'

    fill_in 'email', with: 'somchai@uiuc.alumni'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/my_inventory'
    
    sword_item = page.find('td', text: 'Bastard Sword').find(:xpath, './parent::tr')
    sword_item.find('button', text: 'Remove from the market').click

    expect(page).to have_content 'My Inventory'

    sword_item = page.find('td', text: 'Bastard Sword').find(:xpath, './parent::tr')

    expect(sword_item).to have_content "false"
    expect(sword_item).to have_content "Add to market"
  end
end