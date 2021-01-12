require 'rails_helper'

RSpec.describe 'User Sign up/in' do

  before :each do
    user = User.create(name: 'myname', email: 'myname@email.com', password: 'mypassword', password_confirmation: 'mypassword')
    visit 'users/sign_in'
    fill_in 'user[email]', with: 'myname@email.com'
    fill_in 'user[password]', with: 'mypassword'
    click_on 'commit'
  end

  it 'Create a post for the signed in user' do
    visit '/'
    fill_in 'post[content]', with: 'This is some test content'
    click_on 'commit'
    expect(page).to have_text('Post was successfully created.')
  end

  it 'Failed if the user try to create a blank post' do
    visit '/'
    fill_in 'post[content]', with: ''
    click_on 'commit'
    expect(page).to have_text("Post could not be saved. Content can't be blank")
  end

end
