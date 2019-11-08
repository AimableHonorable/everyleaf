class RemoveIntegerFromTaskLabels < ActiveRecord::Migration[5.2]
  def change
    remove_column :task_labels, :integer, :string
  end
end
