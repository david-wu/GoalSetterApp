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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
  end
end
