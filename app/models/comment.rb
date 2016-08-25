class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :worksheet
  after_create :send_comment_email

  PRIORITY = {
    'High' => 'High',
    'Medium' => 'Medium',
    'Low' => 'Low'
  }

    def send_comment_email
      NotificationMailer.comment_added(self).deliver
  end


end
