require 'rails_helper'

RSpec.describe Task, type: :model do

  it "Validation does not pass if the title is empty" do
    task = Task.new(title: '', content: 'Failure test')
    
    expect(task).not_to be_valid
  end

  it "Validation does not pass if content is empty" do
    task = Task.new(title: 'title', content: '')
    
    expect(task).not_to be_valid
  end

  it "validation passes If content is described in title and content" do
    task = Task.new(title: 'sucess', content: 'succeded test')
    
    expect(task).to be_valid
  end
  
end