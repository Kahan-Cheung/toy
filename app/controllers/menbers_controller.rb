class MenbersController < ApplicationController
  
  def destroy
    Menber.find(params[:id]).destroy
    flash[:success] = "Menber deleted"
    redirect_to current_user
  end
  
  def create
     @menber= Menber.new(menber_params)
     @menber.save
     redirect_to current_user
  end
  
  private
    def menber_params
      params.require(:menber).permit(:group_id, :user_id, 
                :authority, :status, :message)
    end
end
