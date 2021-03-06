class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :public_flag, inclusion: { in: [ true, false ] }
end