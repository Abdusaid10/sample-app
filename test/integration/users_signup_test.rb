require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
 
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {user: { name: "", email: "user@invalid",
                                        password: "foo",
                                        password_confirmation: "bar" }}
    end
    assert_template 'user/new'
    assert_select 'div#<CSS id for error explanatino>'
    assert_select'div.<CSS class for failed with error'
  end
end
