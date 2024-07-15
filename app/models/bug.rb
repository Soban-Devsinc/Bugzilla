class Bug < ApplicationRecord

  # Associations
  has_many :project_bugs
  has_many :project, through: :project_bugs, dependent: :destroy

  has_many :user_bugs
  has_many :users, through: :user_bugs, dependent: :destroy

  has_one_attached :image

  # Enums
  enum bug_type: { Feature: 0, Bug: 1}
  enum status: { New: 0, Started: 1, Completed: 2 }

  # Validations
  validates :title, uniqueness: true
  validates :title, :bug_type, :status , presence: true
  validate :acceptable_image

  # Functions
  def acceptable_image
    acceptable_types = ["image/gif", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a GIF or PNG")
    end
  end
end
