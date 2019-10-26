class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence:true
  validates :content, presence:true
  enum priority: [:low, :medium, :high]
  paginates_per 2
end
