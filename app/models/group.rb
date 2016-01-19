class Group < ActiveRecord::Base

    has_many :menbers
    has_many :articles
    has_many :active_relationships, class_name: "Relationship",
                            foreign_key: "follower_id",
                            dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :passive_relationships, class_name: "Relationship",
                            foreign_key: "followed_id",
                            dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower
    validates :name, presence: true, length: { maximum: 50 }, 
                     uniqueness: { case_sensitive: false }
    validates :ccode, presence: true, length: { maximum: 50 }
    validates :ltnum, presence: true

    def follow(other_group)
        active_relationships.create(followed_id: other_group.id)
    end
    # 取消和另一组组合
    def unfollow(other_group)
        active_relationships.find_by(followed_id: other_group.id).destroy
    end
    # 如果当前发送了组合申请，则返回true
    def following?(other_group)
        following.include?(other_group)
    end
end
