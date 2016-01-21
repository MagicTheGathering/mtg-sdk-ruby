require_relative 'test_helper'

class SubtypeTest < Minitest::Test
  def test_all_returns_all_subtypes
    VCR.use_cassette('all_subtypes') do
      types = MTG::Subtype.all
      
      assert types.length > 10
      assert types.any? {|type| type == 'Warrior'}
    end
  end
end