class ContactMailer < ApplicationMailer
  def send_mail(mail_title,mail_content,group_users,current_user_email)
    @mail_title = mail_title
    @mail_content = mail_content
    mail from: current_user_email, bcc: group_users.pluck(:email), subject: mail_title
  end
end
