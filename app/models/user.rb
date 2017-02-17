class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_role
  validates :name, presence: true

  has_many :categories
  has_many :messages

  def assign_role
    add_role(:user)
  end

end
