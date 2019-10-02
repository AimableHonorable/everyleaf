class Task < ApplicationRecord
  validates :title, presence:true
  validates :content, presence:true
  enum priority: [:low, :medium, :high]
end
