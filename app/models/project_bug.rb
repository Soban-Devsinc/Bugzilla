class ProjectBug < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :bug
end
