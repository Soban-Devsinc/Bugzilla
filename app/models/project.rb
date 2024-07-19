class Project < ApplicationRecord
  # Associations
  has_many :user_projects
  has_many :users, through: :user_projects, dependent: :destroy

  # has_many :project_bugs
  # has_many :bugs, through: :project_bugs, dependent: :destroy

end
