# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  user_id      :integer
#  title        :string(255)      not null
#  body         :string(255)
#  completed_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end
