require 'test_helper'

class InvitationMailerTest < ActionMailer::TestCase
  test "invitation" do
    mail = InvitationMailer.invitation
    assert_equal "Invitation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
