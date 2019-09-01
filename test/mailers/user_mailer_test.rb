require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user=users(:ada)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name, mail.body.encoded
    assert_match user.activation_token, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end

  # test "password_reset" do
  #   email = UserMailer.password_reset
  #   assert_equal "Password reset", email.subject
  #   assert_equal ["to@example.org"], email.to
  #   assert_equal ["from@example.com"], email.from
  #   assert_match "Hi", mail.body.encoded
  # end

end
