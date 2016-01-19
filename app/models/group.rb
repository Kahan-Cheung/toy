class Group < ActiveRecord::Base

    has_many :menbers
    validates :name, presence: true, length: { maximum: 50 }, 
                     uniqueness: { case_sensitive: false }
    validates :ccode, presence: true, length: { maximum: 50 }
    validates :ltnum, presence: true

end
