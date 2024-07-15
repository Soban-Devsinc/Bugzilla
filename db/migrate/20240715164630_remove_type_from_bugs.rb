class RemoveTypeFromBugs < ActiveRecord::Migration[7.1]
  def change
    remove_column :bugs, :type, :integer
    add_column :bugs, :bug_type, :integer
  end
end
