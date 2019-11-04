require 'rails_helper'

RSpec.feature "Task management function", type: :feature do
]

  scenario "Test task list" do
    visit tasks_path
    expect(page).to have_content 'Available tasks'
  end

  scenario "Test task creation" do
    visit new_task_path
    save_and_open_page
    fill_in 'Title', with: 'greeting'
    fill_in 'Content', with: 'good'
    click_button 'Save'
    expect(page).to have_content 'good'
  end

  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.all.order('created_at desc')
    visit tasks_path
  end

  scenario "Test if tasks are ordered by deadline" do
    visit tasks_path
    click_link 'Sort by deadline'
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

  scenario "Test sort by priority" do
    visit tasks_path
    click_link 'Sort by Priority'
    save_and_open_page
    assert Task.all.order('priority desc')
  end

end
