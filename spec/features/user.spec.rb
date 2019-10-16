require 'rails_helper'

RSpec.feature "User Login management", type: :feature do
  background do
    User.create(firstname: 'aimable', lastname: 'twiringiyimana', email: 'aimable@gmail.com', password: 'password')
  end
  scenario "user creation" do
  end
end
