require 'rails_helper'

RSpec.feature "Task management function", type: :feature do
  scenario "Test task list" do
  Task.create!(title: 'test_task_01', content: 'hello')
  visit tasks_path
  expect(page).to have_content 'hello'
  end

  scenario "Test task creation" do
    visit new_task_path
    fill_in 'Title', with: 'greeting'
    fill_in 'Content', with: 'good'
    click_button 'Create Task'
    visit tasks_path
    expect(page).to have_content 'good'
    expect(page).to have_content 'greeting'
  end
  
  scenario "Test task details" do
    Task.create!(title: 'fine', content: 'hello')
    visit tasks_path
    click_button 'Show'
    expect(page).to have_content 'fine'
    expect(page).to have_content 'hello'
  end
end