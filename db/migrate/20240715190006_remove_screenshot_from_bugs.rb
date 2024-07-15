class RemoveScreenshotFromBugs < ActiveRecord::Migration[7.1]
  def change
    remove_column :bugs, :screenshot, :string
  end
end
