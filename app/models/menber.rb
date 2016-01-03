class Menber < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  validates :user_id, presence: true, 
            :uniqueness => {:scope => :group_id}
  validates :group_id, presence: true
  validates :authority, presence: true
  validates :status, presence: true
  validates :message, length: { maximum: 100 }

end
