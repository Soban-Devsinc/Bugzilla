class AddProjectidToProjectBugs < ActiveRecord::Migration[7.1]
  def change
    change_table :project_bugs do |t|
      t.references :project, null: false, foreign_key: true
      t.references :bug, null: false, foreign_key: true
    end
  end
end
