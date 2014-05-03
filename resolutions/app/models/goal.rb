# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  user_id    :integer          not null
#  access     :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Goal < ActiveRecord::Base
  has_many :comments, as: :sayable
end
