class Bug < ApplicationRecord

  # Associations
  has_many :project_bugs
  has_one :project, through: :project_bugs

  has_many :user_bugs
  has_one :user, through: :user_bugs

  # Enums
  enum type: { Feature: 0, Bug: 1}
  enum status: { New: 0, Started: 1, Completed: 2 }

end
