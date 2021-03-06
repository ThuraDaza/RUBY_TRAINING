class Post < ApplicationRecord
  validates :user_name, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :public_flag, inclusion: { in: [ true, false ] }
end
