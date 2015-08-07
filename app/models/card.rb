# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  list_id     :integer          not null
#  ord         :integer          not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Card < ActiveRecord::Base
  validates :title, :list_id, :ord, :description, presence: true

  belongs(
    :list,
    class_name: :List,
    foreign_key: :list_id,
    primary_key: :id
  )

  has_many(
    :items,
    class_name: :Item,
    foreign_key: :card_id,
    primary_key: :id
  )

end
