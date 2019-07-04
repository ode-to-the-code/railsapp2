class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :posts, through: :comments

  validates :name, :presence => true 

  # scope :frequent_posters, -> { where("posts_count >= '5' ") }
  # scope :long_names, -> { where("name.length >= '5' ") }
  # the made_today scope method uses a lamba arrow to call on the Active Record method 'where'. It
  # lists any User objects who were created that day, if any were.
  scope :made_today?, -> { where("created_at >=?", Time.zone.today.beginning_of_day) }
  # User.where("created_at >=?", Time.zone.today.beginning_of_day)

end
