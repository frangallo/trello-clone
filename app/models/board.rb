# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Board < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to(
    :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :lists,
    class_name: :List,
    foreign_key: :board_id,
    primary_key: :id
  )

  has_many(
    :memberships,
    class_name: :BoardMember,
    foreign_key: :board_id,
    primary_key: :id
  )

  has_many(:watchers, through: :memberships, source: :user)

end
