class Group < ActiveRecord::Base

    has_many :menbers
    has_many :articles
    validates :name, presence: true, length: { maximum: 50 }, 
                     uniqueness: { case_sensitive: false }
    validates :ccode, presence: true, length: { maximum: 50 }
    validates :ltnum, presence: true

end
