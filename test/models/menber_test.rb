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
  
  test "one person can't join twice in one team" do
     @user.save
     @group.save
     @menber.save
     @menber2 = Menber.new(authority:1,status:1,
          message:"ddd",user_id:@user.id,group_id:@group.id)
     assert_not @menber2.valid?
  end
  
  test "group.nownum shou be +1 when add a menber" do
     @user.save
     @group.save
     num = @group.nownum
     @menber.save
     assert_equal num+1, @menber.group.nownum 
  end
  
   test "group.nownum shou be no differe when a menber apply for it" do
     @menber = Menber.new(authority:1,status:0,
          message:"ddd",user_id:@user.id,group_id:@group.id)
     @user.save
     @group.save
     num = @group.nownum
     @menber.save
     assert_equal num, @menber.group.nownum 
  end
  
  test "group.nownum shou be -1 when delete a menber" do
      @user.save
      @group.save
      @menber.save
      num = @menber.group.nownum
      @menber.destroy
      assert_equal num-1, @menber.group.nownum 
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
