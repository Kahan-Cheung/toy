class GroupsController < ApplicationController
  def new
  end
  
  def index
    @groups = Group.where('name LIKE ?',  "%#{params[:search]}%")
                    .paginate :page => params[:page],
                              :per_page => 10
                             # :conditions => ["name like ?", "%#{params[:search]}%"]
  end
  
  def show
    
  end
  
  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group deleted"
    redirect_to groups_path
  end 
  
end
