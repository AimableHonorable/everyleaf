class Task < ApplicationRecord
  belongs_to :user, optional:true
  validates :title, presence:true
  validates :content, presence:true
  enum priority: [:low, :medium, :high]
  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels
  paginates_per 3
end
