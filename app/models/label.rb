class Label < ApplicationRecord
  belongs_to :user
  has_many :task_labels, dependent: :destroy
end
