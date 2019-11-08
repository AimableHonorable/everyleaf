require 'rails_helper'
RSpec.feature "Label Management Function", type: :feature do
  background do
    FactoryBot.create(:user, firstname: 'ange',
                             lastname: 'angel',
                             email: 'ange@gmail.com',
                             password: 'password',
                             password_confirmation: 'password')
    visit new_session_path
    fill_in 'Email', with: 'ange@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'
    @user = User.first
    FactoryBot.create(:label, name: "label1", user_id: @user.id)
    FactoryBot.create(:label, name: "label2", user_id: @user.id)
    FactoryBot.create(:label, name: "label3", user_id: @user.id)
    FactoryBot.create(:task, title: 'task1',
                             status: 'Not started',
                             content: 'content1',
                             priority:'low',
                             start_at: '2019-10-01',
                             end_at: '2019-10-02',
                             user_id: @user.id)
  end
  scenario "Test Label list availability" do
    visit labels_path
    save_and_open_page
    expect(page).to have_content 'label1'
  end

  scenario "Test Label creation" do
    visit new_label_path
    fill_in 'Name', with: 'label4'
    click_button 'save'
    expect(page).to have_content 'label4'
  end

  scenario "Test Label attached to task" do
    @task = Task.first
    @label1 = Label.first
    @label2 = Label.second
    @task.labels = [@label1, @label2]
    @task.save
    visit tasks_path
    fill_in 'search_label', with: 'label1'
    expect(page).to have_content 'label1'
  end
end
