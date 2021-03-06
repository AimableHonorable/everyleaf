class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.text :name
      t.text :content
      t.references :task, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
