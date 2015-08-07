# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  card_id    :integer          not null
#  done?      :boolean          default(FALSE), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  validates :card_id, :done?, :title, presence: true

  belongs_to(
    :card,
    class_name: :Card,
    foreign_key: :card_id,
    primary_key: :id
  )

end
