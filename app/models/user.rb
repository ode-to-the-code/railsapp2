class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :posts
  has_many :commented_posts, through: :comments, source: :post

  validates :name, :presence => true


  # scope :made_today?, -> { where("created_at >=?")}

  scope :made_today?, -> { where("created_at >=?", Time.zone.today.beginning_of_day) }
  scope :most_comments, -> { where("User.joins(:comments).group('users.id').order('count(users.id) desc').limit(1).first") }

  # scope :name_includes_i, -> { where(name: includes{"i"}) }

  scope :created_before, ->(time) { where("created_at < ?", time) }

  # scope :most_comments, -> { where("comments.count.max")}
  # scope :most_comments, -> { where("Comment.group(:user_id).count")}

  # User.find_by_sql("SELECT * FROM users INNER JOIN posts ")


  # User.joins(:pins).group('users.id').where('pins.created_at >= ?', 1.week.ago.utc).order('count(pins.id) desc').limit(1).first


  # User.joins(:comments).group('users.id').order('count(users.id) desc').limit(1).first

  #  User.joins(:comments).ids
  # 1, 1, 3



  # this one pulls up the largest hash key
#
#   - largest_hash_key method(x) returns [1, 2] which is the pair with the highest value
#   -finds the count of comments the object has
#
#   Comment.group(:user_id).count
#   User.find(largest_hash_key(x)[0]).comments.count
#
#   def method_name
#
#   end
#
#
#
# AGGREGATE?
#
# WHERE
#
#
# JOINS
#  posts = Post.joins(:user).where(:users => {:id => "2"})
#  - returns one post, since this user only has one
#
# GROUP BY
#   Comment.group(:user_id).count
#   => {1=>2, 3=>1}
#
# ORDER BY
#  User.order('name DESC')
#  this returns the user objects, but listed in desc alphabetical order
#
#  Comment.order('user_id DESC')
#  this returns the three comment objects, but listed in desc order of their
#  user ids. so 3, 1, 1.
#
#
# MAX

end
