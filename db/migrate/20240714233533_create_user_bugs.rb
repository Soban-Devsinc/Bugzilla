class CreateUserBugs < ActiveRecord::Migration[7.1]
  def change
    create_table :user_bugs do |t|

      t.timestamps
    end
  end
end
