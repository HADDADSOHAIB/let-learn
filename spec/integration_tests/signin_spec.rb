require 'rails_helper'

RSpec.describe 'User sign in', type: :feature do
  before(:each) do
    @user = User.new(username: 'ExampleUser',
                     fullname: 'Example User',
                     email: 'exampleuser@example.com',
                     password: 'password',
                     password_confirmation: 'password')
    @user.save
  end
  scenario 'they access the home page to sign in' do
    visit new_user_session_path

    fill_in 'user[email]', with: 'exampleuser@example.com'
    fill_in 'user[password]', with: 'password'

    click_button 'Sign In'

    expect(page).to have_content('Example User')
  end
end
