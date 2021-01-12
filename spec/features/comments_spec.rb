require 'rails_helper'

RSpec.describe 'User Sign up/in' do
  before :each do
    User.create(name: 'myname', email: 'myname@email.com', password: 'mypassword',
                password_confirmation: 'mypassword')
    visit 'users/sign_in'
    fill_in 'user[email]', with: 'myname@email.com'
    fill_in 'user[password]', with: 'mypassword'
    click_on 'commit'
  end

  it 'Create a comment for the signed in user' do
    fill_in 'post[content]', with: 'This is a post test'
    click_button 'Save'

    visit '/'
    fill_in 'comment[content]', with: 'This is some comment for test'
    click_button 'Comment'
    expect(current_path).to eql('/posts')
    expect(page).to have_text('Comment was successfully created.')
  end

  it 'Failed if the user try to create a blank comment' do
    fill_in 'post[content]', with: 'This is a post test'
    click_button 'Save'

    visit '/'
    fill_in 'comment[content]', with: ''
    click_button 'Comment'
    expect(current_path).to eql('/posts')
    expect(page).to have_text("Content can't be blank")
  end
end
