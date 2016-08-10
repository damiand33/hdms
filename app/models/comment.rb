class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :worksheet

  PRIORITY = {
    'High' => 'High-code',
    'Medium' => 'Medium-code',
    'Low' => 'Low=code'
  }
end
