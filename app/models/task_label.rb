class TaskLabel < ApplicationRecord
  belongs_to :tasks
  belongs_to :labels
end
