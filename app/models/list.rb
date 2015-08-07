# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  board_id   :integer          not null
#  ord        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ActiveRecord::Base
  belongs_to(
    :board,
    class_name: :Board,
    foreign_key: :board_id,
    primary_key: :id
  )

  has_many(
    :cards,
    class_name: :Card,
    foreign_key: :list_id,
    primary_key: :id
  )
end
