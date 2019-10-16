require 'rails_helper'

RSpec.feature "User Login management", type: :feature do

  let(:user) { FactoryBot.create(:user) }

  scenario "user registration with successful validations" do
    visit new_user_path
    user.reload
    expect(user.firstname).to eq('mugabo')
    expect(user.lastname).to eq('Aimable')
    expect(user.email).to eq('aimable@gmail.com')
  end

  scenario "successful user login and logout" do
    User.create(firstname: 'aimable', lastname: 'cherif', email: 'cherif@gmail.com', password: 'password', password_confirmation: 'password')
    visit new_session_path
    FactoryBot.create(:user)
    fill_in 'Email', with: 'cherif@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'
    save_and_open_page
    expect(current_path).to eq '/tasks'
    click_link 'Logout'
    expect(current_path).to eq '/sessions/new'
  end
  scenario "expect page to redirect to login when not logged in" do
    visit tasks_path
    save_and_open_page
  end

end
