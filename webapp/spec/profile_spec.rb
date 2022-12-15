require 'rails_helper'

RSpec.describe 'Profile', type: :feature do
	scenario 'visit profile page without session' do
		visit '/profile'

		expect(page).to have_content 'Login Required'
	end

	scenario 'visit admin profile' do
		visit '/login'

    fill_in 'email', with: 'jetnipit54@gmail.com'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/profile'

    expect(page).to have_content 'Name: Jet K'
    expect(page).to have_content 'Email: jetnipit54@gmail.com'
    expect(page).to have_content 'User_type: admin'
	end

	scenario 'visit seller profile' do
		visit '/login'

    fill_in 'email', with: 'somchai@uiuc.alumni'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/profile'

    expect(page).to have_content 'Name: Somchai SPJ'
    expect(page).to have_content 'Email: somchai@uiuc.alumni'
    expect(page).to have_content 'User_type: seller'
	end

	scenario 'visit buyer profile' do
		visit '/login'

    fill_in 'email', with: 'nattee@chula.ac.th'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/profile'

    expect(page).to have_content 'Name: Nattee NN'
    expect(page).to have_content 'Email: nattee@chula.ac.th'
    expect(page).to have_content 'User_type: buyer'
	end

  scenario 'change password as buyer' do
    visit '/login'

    fill_in 'email', with: 'nattee@chula.ac.th'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/profile'

    expect(page).to have_content 'Change Password'
    
    fill_in 'change_password[password]', with: '12433'
    fill_in 'change_password[confirm_password]', with: '12433'

    click_button 'Submit'

    expect(page).to have_content 'Successfully Reset Password'
  end

  scenario 'change password to empty string' do
    visit '/login'

    fill_in 'email', with: 'nattee@chula.ac.th'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/profile'

    expect(page).to have_content 'Change Password'
    
    fill_in 'change_password[password]', with: ''
    fill_in 'change_password[confirm_password]', with: ''

    click_button 'Submit'

    expect(page).to have_content 'Password length must be greater than 3!'
  end

  scenario 'change password with mismatching password confirmation' do
    visit '/login'

    fill_in 'email', with: 'nattee@chula.ac.th'
    fill_in 'password', with: '123'
      
    click_button 'Log In'

    visit '/profile'

    expect(page).to have_content 'Change Password'
    
    fill_in 'change_password[password]', with: '55555'
    fill_in 'change_password[confirm_password]', with: 'ttttt'

    click_button 'Submit'

    expect(page).to have_content 'Password and Confirm password mismatch!'
  end
end