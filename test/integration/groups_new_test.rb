require 'test_helper'

class GroupNewTest < ActionDispatch::IntegrationTest

  test "create a new group information" do
    @user = users(:michael)
    log_in_as(@user)
    name = "team-test1"
    introduce = "this is a good team"
    ltnum = 3
    nownum = 1
    ccode = "#hsidhf"
    assert_difference 'Group.count', 1 do
    post_via_redirect groups_path, group: { 
                                            name: name,
                                            introduce: introduce,
                                            ltnum: ltnum,
                                            nownum: nownum,
                                            ccode: ccode
                                          }
    end
    assert_template 'groups/show'
  end
end
