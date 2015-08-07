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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
