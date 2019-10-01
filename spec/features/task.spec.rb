require 'rails_helper'

RSpec.feature "Task management function", type: :feature do
  background do
    FactoryBot.create(:task, title: 'task1', status: 'Not started', content: 'content1', start_at: '2019-10-01', end_at: '2019-10-02')
    FactoryBot.create(:task, title: 'task2', status: 'In progress', content: 'content2', start_at: '2019-10-03', end_at: '2019-10-04')
    FactoryBot.create(:task, title: 'task3', status: 'Done', content: 'content3', start_at: '2019-10-05', end_at: '2019-10-06')
    
  end
  
  scenario "Test task list" do
    visit tasks_path
    expect(page).to have_content 'content1'
    expect(page).to have_content 'content2'
  end
  
  scenario "Test task creation" do
    visit new_task_path
    fill_in 'Title', with: 'greeting'
    fill_in 'Content', with: 'good'
    click_button '登録する'
    expect(page).to have_content 'good'
  end

  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.all.order('created_at desc')
    visit tasks_path
  end

  scenario "Test if tasks are ordered by deadline" do
    visit tasks_path
    click_button 'Sort by deadline'
    save_and_open_page
    assert Task.all.order('end_at desc')
    
  end
  scenario "Test search by title" do
    visit tasks_path
    fill_in 'title', with: 'task1'
    click_button 'Search'
    expect(page).to have_content 'task1'
  end

  scenario "Test search by status" do
    visit tasks_path
    fill_in 'status', with: 'In progress'
    click_button 'Search'
    expect(page).to have_content 'In progress'
  end

  scenario "Test search by both title and status" do
    visit tasks_path
    fill_in 'title', with: 'task3'
    fill_in 'status', with: 'Done'
    click_button 'Search'
    expect(page).to have_content 'task3'
    expect(page).to have_content 'Done'
  end

end