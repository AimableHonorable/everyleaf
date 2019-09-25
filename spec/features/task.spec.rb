require 'rails_helper'

RSpec.feature "Task management function", type: :feature do
  background do
    FactoryBot.create(:task, title: 'task1', content: 'content1')
    FactoryBot.create(:task, title: 'task2', content: 'content2')
    FactoryBot.create(:task, title: 'task3', content: 'content3')
    FactoryBot.create(:task, title: 'task4', content: 'content4')
    visit tasks_path
  save_and_open_page
  end
  scenario "Test task list" do
  
  
  expect(page).to have_content 'content1'
  expect(page).to have_content 'content2'
  end
  
  #omitted
  scenario "Test whether tasks are arranged in descending order of creation date" do
    
    Task.all.order('created_at desc')
  end
end