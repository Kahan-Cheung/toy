require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = Group.new(name: "team1", introduce:"who care", ltnum:5, nownum:3, ccode:"#223321")
  end
  
  test "gourp should be valid" do
      assert @group.valid?
  end
  
  test "group's name should be present" do
    @group.name = " "
    assert_not @group.valid?
  end
end
