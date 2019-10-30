class RemoveContentFromLabels < ActiveRecord::Migration[5.2]
  def change
    remove_column :labels, :content, :text
  end
end
