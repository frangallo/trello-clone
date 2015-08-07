# == Schema Information
#
# Table name: board_members
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  board_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BoardMember < ActiveRecord::Base
  validates :user_id, :board_id, presence: true

  belongs_to(
    :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :board,
    class_name: :Board,
    foreign_key: :board_id,
    primary_key: :id
  )
end
