class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :posts
  has_many :commented_posts, through: :comments, source: :post

  validates :name, :presence => true




  scope :made_today?, -> { where("created_at >=?", Time.zone.today.beginning_of_day) }
  # scope :most_comments, -> { where("User.joins(:comments).group('users.id').order('count(users.id) desc').limit(1)") }

  scope :most_comments, -> { joins(:comments).group('users.id').order('count(users.id) desc').limit(1) }


  scope :created_before, ->(time) { where("created_at < ?", time) }

end
