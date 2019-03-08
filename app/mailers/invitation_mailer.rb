class InvitationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.invitation.subject
  #
  def invitation(contest, email)
    @contest = contest
    mail(to: email, subject: 'Invitation to a contest')
  end
end
