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

  scenario 'test lock version' do
    visit '/login'

    fill_in 'email', with: 'somchai@uiuc.alumni'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/market/index'

    page.find('td', text: 'Korea King').find(:xpath, './parent::tr').find('a', text: 'Edit Item').click

    expect {
      Item.where(name: 'Korea King').update(lock_version: 10000)
    }.to raise_error(ActiveRecord::StaleObjectError)

    fill_in 'item[name]', with: 'changed name 29ur902h2htg;l'
    
    click_button 'commit'

    expect(page).to have_content 'Item was successfully updated.'
  end
end
