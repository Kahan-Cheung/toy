require 'test_helper'

class MenberTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @group = groups(:one)
    @menber = Menber.new(authority:1,status:1,
          message:"ddd",user_id:@user.id,group_id:@group.id)
  end
  
  test "menber should be valid" do
    assert @menber.valid?
  end
  
  test "user id should be present" do
    @menber.user_id = nil
    assert_not @menber.valid?
  end
  
  test "group id should be present" do
    @menber.group_id = nil
    assert_not @menber.valid?
  end
  
  test "message should be less 100" do
    @menber.message = "a"*200
    assert_not @menber.valid?
  end
  
  test "associated menber should be destroyed" do
    @user.save
    @group.save
    @menber.save
    assert_difference 'Menber.count', -1 do
      @user.destroy
    end
  end
end
