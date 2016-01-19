require 'test_helper'

class GroupsIndexTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  test "apply a team test" do
    @user = users(:michael)
    log_in_as(@user)
    @group = groups(:one)
    get teams_path
    assert_select 'title', full_title("选择加入队伍")
    get apply_teams_url(group_id:@group.id,
                 user_id:@user.id)
    assert_template "form_teams/apply"
    assert_difference 'Menber.count', 1 do
    post_via_redirect menbers_path, menber: { 
                                            group_id: @group.id,
                                            user_id: @user.id,
                                            status: -1,
                                            authority: 0
                                          }
    assert_template "users/show"                      
    end
  end
  
  test "accpet a teammate" do
     @user = users(:michael)
     log_in_as(@user)
     @group = groups(:one)
     @menber = Menber.create(authority:0,status:0,
                user_id: @user.id, group_id: @group.id);
    
    #进到用户队伍页面         
     get user_path(@user)
     assert_template 'users/show'
     assert_select 'title', full_title(@user.name)
     assert_match @group.name, response.body
     
     
     #接受前
     get group_path(@group)
     assert_template 'groups/show'
     assert_no_match @user.name , response.body
     
     #接受中
     @menber.status = 1
     @menber.save
     
     #接受后
     get group_path(@group)
     assert_template 'groups/show'
     assert_match @user.name , response.body
     #assert_match @user.name , response.body
  end

end
