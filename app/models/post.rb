class Post < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments

  validates :title, :presence => true
  validates :content, :presence => true

end
