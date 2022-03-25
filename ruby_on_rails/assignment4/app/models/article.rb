class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates_inclusion_of :public_flag, :in => [true, false]  
end