class AddTasksCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :task_count, :integer
  end
end
