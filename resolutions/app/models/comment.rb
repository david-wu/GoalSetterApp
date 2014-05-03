# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :string(255)      not null
#  sayable_id   :integer          not null
#  sayable_type :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Comment < ActiveRecord::Base

  belongs_to :sayable, polymorphic: true

end

