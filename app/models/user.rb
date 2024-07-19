class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :usertype ,presence: true

  # Associations
  has_many :user_projects
  has_many :projects, through: :user_projects, dependent: :destroy

  has_many :user_bugs
  has_many :bugs, through: :user_bugs, dependent: :destroy

  enum usertype: { Manager: 0, Developer: 1, QA: 2 }

end
