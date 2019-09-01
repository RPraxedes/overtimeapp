class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :audit_logs
  has_many :hands_associations, class_name: 'Hand'
  has_many :hands, through: :hands_associations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :email, :first_name, :last_name

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
