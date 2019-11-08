class RemoveLabelIdFromTaskLabels < ActiveRecord::Migration[5.2]
  def change
    remove_column :task_labels, :label_id, :string
  end
end
