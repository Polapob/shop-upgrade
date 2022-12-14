require 'rails_helper'

RSpec.describe 'Login', type: :feature do
	scenario 'open login page' do
		visit '/login'
		expect(page).to have_content('Login')
	end

	scenario 'login with correct username and password' do
		visit '/login'

		fill_in 'email', with: 'jetnipit54@gmail.com'
		fill_in 'password', with: '123'
		
		click_button 'Log In'
		expect(page).to have_content 'Login successful'
	end

	scenario 'login with incorrect username or invalid password' do
		visit '/login'

		fill_in 'email', with: 'jetnipit53@gmail.com'
		fill_in 'password', with: '123'
		
		click_button 'Log In'
		expect(page).to have_content 'Invalid Email or password'

		fill_in 'email', with: 'jetnipit54@gmail.com'
		fill_in 'password', with: '1235'
		
		click_button 'Log In'
		expect(page).to have_content 'Invalid Email or password'

		fill_in 'email', with: 'jetnipit53@gmail.com'
		fill_in 'password', with: '11235'
		
		click_button 'Log In'
		expect(page).to have_content 'Invalid Email or password'
	end

	scenario 'click doesn\'t have an account? link' do
		visit '/login' 

		click_on 'doesn\'t have an account?'

		expect(page).to have_content 'Sign Up'
	end
end
