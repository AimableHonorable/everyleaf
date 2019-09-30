require 'rails_helper'

RSpec.feature "Task management function", type: :feature do
  background do
    FactoryBot.create(:task, title: 'task1', content: 'content1', start_at: '2019-10-01', end_at: '2019-10-02')
    FactoryBot.create(:task, title: 'task2', content: 'content2', start_at: '2019-10-03', end_at: '2019-10-04')
    FactoryBot.create(:task, title: 'task3', content: 'content3', start_at: '2019-10-05', end_at: '2019-10-06')
    FactoryBot.create(:task, title: 'task4', content: 'content4', start_at: '2019-10-07', end_at: '2019-10-08')
    
  end
  
  scenario "Test task list" do
    visit tasks_path
    save_and_open_page
    expect(page).to have_content 'content1'
    expect(page).to have_content 'content2'
  end
  
  scenario "Test task creation" do
    visit new_task_path
    fill_in 'Title', with: 'greeting'
    fill_in 'Content', with: 'good'
    click_button '登録する'
    save_and_open_page
    expect(page).to have_content 'good'
  end

  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.all.order('created_at desc')
    visit tasks_path
    save_and_open_page
  end

  scenario "Test if tasks are ordered by deadline" do
    visit tasks_path
    click_button 'Sort by deadline'
    assert Task.all.order('end_at desc')
    save_and_open_page
  end

end