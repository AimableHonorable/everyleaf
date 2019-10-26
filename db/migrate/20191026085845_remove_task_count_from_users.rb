class RemoveTaskCountFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :task_count, :integer
  end
end
