require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    #@group = Group.new(name: "team1", introduce:"who care", ltnum:5, nownum:0, ccode:"#223321")
    @user = users(:michael)
    @group = groups(:one)
    @menber = Menber.new(authority:1,status:1,
          message:"ddd",user_id:@user.id,group_id:@group.id)
  end
  
  test "gourp should be valid" do
      assert @group.valid?
  end
  
  test "group's name should be present" do
    @group.name = " "
    assert_not @group.valid?
  end
  
  test "group's ccode should be present" do
    @group.ccode = " "
    assert_not @group.valid?
  end
  
  test "group's ltnum should be present" do
    @group.ltnum = nil
    assert_not @group.valid?
  end
  
end
