class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "Group"
  belongs_to :followed, class_name: "Group"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  has_many :following, through: :active_relationships, source: :followed
end
