class AddLabelToTaskLabels < ActiveRecord::Migration[5.2]
  def change
    add_column :task_labels, :label_id, :integer
  end
end
