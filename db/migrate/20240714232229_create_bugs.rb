class CreateBugs < ActiveRecord::Migration[7.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.datetime :deadline
      t.string :screenshot
      t.integer :type
      t.integer :status

      t.timestamps
    end
  end
end
