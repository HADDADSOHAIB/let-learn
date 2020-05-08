require 'rails_helper'

RSpec.describe 'User sign out', type: :feature do
  before(:each) do
    @user = User.new(username: 'ExampleUser',
                     fullname: 'Example User',
                     email: 'exampleuser@example.com',
                     password: 'password',
                     password_confirmation: 'password')
    @user.save
  end
  scenario 'they click the sign out link' do
    visit new_user_session_path

    fill_in 'user[email]', with: 'exampleuser@example.com'
    fill_in 'user[password]', with: 'password'

    click_button 'Sign In'

    find('.sidenav #signout').click
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
