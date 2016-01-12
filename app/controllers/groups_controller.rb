class GroupsController < ApplicationController
  def new
    @group= Group.new
  end
  
  def index
    @groups = Group.where('name LIKE ?',  "%#{params[:search]}%")
                    .paginate :page => params[:page],
                              :per_page => 10
                             # :conditions => ["name like ?", "%#{params[:search]}%"]
  end
  
  def create
    @group = Group.new(group_params)
    @group.nownum = 1;
    puts "ooooooooo"
    puts current_user.name
    puts current_user
    if @group.save
       @menber = Menber.new(authority:1,status:1,
          user_id:current_user.id,group_id:@group.id)
       @menber.save
      flash[:success] = "队伍创建成功"
      redirect_to @group
    else
      render 'new'
    end
  end
  
  def show
    @group = Group.find(params[:id])
    @re_groups = Group.where('ccode = ? and name !=? and nownum <= ?', 
                            @group.ccode, @group.name, @group.ltnum - @group.nownum).order("nownum DESC").limit(6)
                 #           .paginate :page => params[:page],
                  #          :per_page => 5
    
    #@re_groups =  @re_groups[2..10]
  end
  
  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group deleted"
    redirect_to groups_path
  end 
  
  private
  
    def group_params
      params.require(:group).permit(:name, :ccode, :ltnum, :introduce)
    end
  
end
