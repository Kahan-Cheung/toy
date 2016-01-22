class StaticPagesController < ApplicationController
  def home
    @groups = Group.all
    @users = User.all
    @groups_sets = @groups.group_by{|s| s.ccode}
    
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
