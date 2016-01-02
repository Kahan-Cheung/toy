class Group < ActiveRecord::Base
    validates :name, presence: true, length: { maximum: 50 }
    validates :ccode, presence: true, length: { maximum: 50 }
end
