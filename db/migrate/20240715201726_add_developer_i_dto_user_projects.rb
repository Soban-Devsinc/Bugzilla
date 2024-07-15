class AddDeveloperIDtoUserProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :user_projects, :developer_id, :integer
  end
end
