class Post < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments

  validates :title, :presence => true

  # scope where 
end
