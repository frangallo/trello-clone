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

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
