class FormTeamsController < ApplicationController
    def index
        @groups = Group.where('name LIKE ? and ccode LIKE ?',  
                        "%#{params[:search]}%","%#{params[:search2]}%")
                        .paginate :page => params[:page],
                                  :per_page => 10
                                 
    end
    
    def apply
       @menber = Menber.new(authority:0,status:0,
                 user_id:params[:user_id], group_id:params[:group_id]);
    end
    
    def join
    end
    
    def accpet
        
        @menber = Menber.find(params[:menber_id] )
        @group = Group.find(params[:group_id])
        @menber.status=1
        @menber.save
        redirect_to @group
    end
 
end
