class CreateProjectBugs < ActiveRecord::Migration[7.1]
  def change
    create_table :project_bugs do |t|

      t.timestamps
    end
  end
end
