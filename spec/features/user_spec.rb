require 'rails_helper'

RSpec.describe 'User Sign up' do
  it 'Signs up a new user and redirects to the Home page' do
    visit 'users/sign_up'
    fill_in 'user[name]', with: 'myname'
    fill_in 'user[email]', with: 'myname@email.com'
    fill_in 'user[password]', with: 'mypassword'
    fill_in 'user[password_confirmation]', with: 'mypassword'
    click_on 'commit'
    expect(current_path).to eql('/')
    expect(page).to have_text('Welcome! You have signed up successfully.')
  end

  # it 'fails to login user when username is not given' do
    # visit '/sessions/new'
    # click_on 'Enter'
    # expect(current_path).to eql('/users/new')
  # end

  # it 'logins a user when username is given' do
    # visit '/sessions/new'
    # fill_in 'username', with: 'myname'
    # click_on 'Enter'
    # expect(current_path).to eql('/users/new')
  # end
end
