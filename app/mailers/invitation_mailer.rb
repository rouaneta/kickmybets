class InvitationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.invitation.subject
  #
  def invitation(contest, email)
    # @email = email
    @contest = contest
    mail(to: email, subject: 'contest invitation')
  end
end
