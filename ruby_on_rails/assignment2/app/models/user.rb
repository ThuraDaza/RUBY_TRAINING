class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
  validates :password, confirmation: true, on: :update
  validates :super_user_flag, inclusion: { in: [ true, false ] }
  validates :phone, presence: true
  validates :address, presence: true
  validates :birthday, presence: true
end