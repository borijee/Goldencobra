# == Schema Information
#
# Table name: goldencobra_widgets
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  content        :text
#  css_name       :string(255)
#  active         :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  id_name        :string(255)
#  sorter         :integer
#  mobile_content :text
#  teaser         :string(255)
#

require 'test_helper'

module Goldencobra
  class WidgetTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end
  end
end
