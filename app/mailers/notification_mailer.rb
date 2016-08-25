class NotificationMailer < ActionMailer::Base
  default from: "no-reply@racms.com"

  def comment_added(comment)
  		@worksheet = comment.worksheet
  		@worksheet_owner = @worksheet.user

  	    mail(to: @worksheet_owner.email,
         subject: "A comment has been added to PIW #{@worksheet.piw_id}")
  end
end
