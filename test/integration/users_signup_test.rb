require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
  name = "Example User"
  email = "user@example.com"
  password = "password"
  phone = "123233112"
  academy = "control and conputer"
  assert_difference 'User.count', 1 do
    post_via_redirect users_path, user: { name: name,
                                          email: email,
                                          password: password,
                                          phone: phone,
                                          academy: academy,
                                          password_confirmation: password }
  end
    assert_template 'users/show'
  end
end
