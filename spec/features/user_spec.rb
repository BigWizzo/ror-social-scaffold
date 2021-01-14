require 'rails_helper'

RSpec.describe 'User Sign up/in' do
  it 'Signs up a new user and redirects to the Home page' do
    visit 'users/sign_up'
    fill_in 'user[name]', with: 'myname'
    fill_in 'user[email]', with: 'myname@email.com'
    fill_in 'user[password]', with: 'mypassword'
    fill_in 'user[password_confirmation]', with: 'mypassword'
    click_on 'commit'
    expect(current_path).to eql(root_path)
    expect(page).to have_text('Welcome! You have signed up successfully.')
  end

  it 'Fails to Sign up a user if name is not given' do
    visit 'users/sign_up'
    fill_in 'user[email]', with: 'myname@email.com'
    fill_in 'user[password]', with: 'mypassword'
    fill_in 'user[password_confirmation]', with: 'mypassword'
    click_on 'commit'
    expect(page).to have_text("Name can't be blank")
  end

  it 'Signs in a new user and redirects to the Home page' do
    User.create(name: 'myname', email: 'myname@email.com', password: 'mypassword',
                password_confirmation: 'mypassword')

    visit 'users/sign_in'
    fill_in 'user[email]', with: 'myname@email.com'
    fill_in 'user[password]', with: 'mypassword'
    click_on 'commit'
    expect(current_path).to eql(root_path)
    expect(page).to have_text('Signed in successfully.')
  end

  it 'Fails to Sign in a user if email is not given' do
    visit 'users/sign_in'
    fill_in 'user[password]', with: 'password'
    click_on 'commit'
    expect(page).to have_text('Invalid Email or password.')
  end
end
