require 'test_helper'

class GroupsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:michael)
    @group = groups(:one)
  end
  
  test "groups index as admin including pagination and delete links" do
    log_in_as(@admin)
    get groups_path
    assert_template 'groups/index'
    first_page_of_groups = Group.paginate(page: 1,per_page: 10)
    first_page_of_groups.each do |group|
        assert_select 'a[href=?]', group_path(group), text: '删除',
        method: :delete
    end
  
    assert_difference 'Group.count', -1 do
      delete group_path(@group)
    end
  
  end

end
