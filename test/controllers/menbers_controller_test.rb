require 'test_helper'

class MenbersControllerTest < ActionController::TestCase
  include ApplicationHelper
  test "should redirect user show when destroy a menber" do
    @menber = menbers(:menber_two) 
    @user = @menber.user
    log_in_as(@user)
    assert_difference 'Menber.count',-1 do
       delete :destroy, id: @menber
    end
    
    assert_redirected_to user_path(@user)
  end
  
  test "should redirect user show when create a menber" do
    @user = users(:michael)
    @group = groups(:two)
    log_in_as(@user)
    assert_difference 'Menber.count', 1 do
    post :create, menber: { group_id: @group.id,
                            user_id: @user.id,
                            status: -1,
                            authority: 0
                          }
    end
    assert_redirected_to user_path(@user)
    
  end
end
