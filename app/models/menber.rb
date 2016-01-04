class Menber < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
   after_save {
     if self.status == 1
       @tg = self.group
       @tg.nownum +=1
       @tg.save
     end}
   after_destroy {  if self.status == 1
       @tg = self.group
       @tg.nownum -=1
       @tg.save
     end
   }
  validates :user_id, presence: true, 
            :uniqueness => {:scope => :group_id}
  validates :group_id, presence: true
  validates :authority, presence: true
  validates :status, presence: true
  validates :message, length: { maximum: 100 }

end
