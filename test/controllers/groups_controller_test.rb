require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  
  def setup
     @user = users(:michael)
     @group = groups(:one)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should redirect group index when destroy a group" do
    log_in_as(@user)
    delete :destroy, id: @group
    assert_redirected_to groups_path
  end
  

end
