# == Schema Information
#
# Table name: card_assignments
#
#  id         :integer          not null, primary key
#  card_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CardAssignment < ActiveRecord::Base
  validates :card_id, :user_id, presence: true

  belongs_to(
    :card,
    class_name: :Card,
    foreign_key: :card_id,
    primary_key: :id
  )

  belongs_to(
    :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )
end
