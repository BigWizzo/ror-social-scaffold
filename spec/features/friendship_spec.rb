require 'rails_helper'

RSpec.describe 'Friendship' do
  before :each do
    User.create(name: 'myname', email: 'myname@email.com', password: 'mypassword',
                password_confirmation: 'mypassword')
    User.create(name: 'yourname', email: 'yourname@email.com', password: 'mypassword',
                password_confirmation: 'mypassword')
    visit 'users/sign_in'
    fill_in 'user[email]', with: 'myname@email.com'
    fill_in 'user[password]', with: 'mypassword'
    click_on 'commit'
  end

  it 'Should have a button to Add Friend in the Users List ' do
    visit '/users'
    expect(page).to have_selector(:link_or_button, 'Add as Friend')
  end

  it 'Should have a button to See Profile of a User' do
    visit '/users'
    expect(page).to have_selector(:link_or_button, 'See Profile')
  end

  it 'Should send a friend request to the User' do
    visit '/users'
    click_link('Add as Friend', match: :first)
    expect(page).to have_content('Confirmation pending')
    click_on 'Sign out'
  end
end
