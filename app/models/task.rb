class Task < ApplicationRecord
  belongs_to :user, optional:true
  validates :title, presence:true
  validates :content, presence:true
  enum priority: [:low, :medium, :high]
  paginates_per 2
  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels
end
