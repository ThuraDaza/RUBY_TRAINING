class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates_inclusion_of :super_user_flag, :in => [true, false]  
  validates :phone, presence: true
  validates :address, presence: true
  validates :birthday, presence: true
end