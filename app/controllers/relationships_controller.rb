class RelationshipsController < ApplicationController
    def apply
        g1 = Group.find(params[:followed_id])
        g2 = Group.find(params[:follower_id])
        begin  
           raise g2.follow(g1)
        rescue => err   
           puts err   
        ensure  
           redirect_to g2        
        end  
    end
    
    def accpet
         g1 = Group.find(params[:follower_id])
         g2 = Group.find(params[:followed_id])
         
         g2.menbers.each do |m|
              menber = Menber.new(authority:0,status:1,
              user_id: m.user.id, group_id: g1.id)
              menber.save
         end
         g2.destroy
         redirect_to g1
    end
    
    def destroy
        redirect_to user
    end
end
