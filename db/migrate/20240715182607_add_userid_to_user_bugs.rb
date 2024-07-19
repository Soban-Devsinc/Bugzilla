class AddUseridToUserBugs < ActiveRecord::Migration[7.1]
  def change
    change_table :user_bugs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bug, null: false, foreign_key: true
    end
  end
end
