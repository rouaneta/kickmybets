# Preview all emails at http://localhost:3000/rails/mailers/invitation_mailer
class InvitationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invitation_mailer/invitation
  def invitation
    user = User.first
    contest = Contest.find(params[:id])
    InvitationMailer.invitation(user, contest).deliver_now
  end

end
