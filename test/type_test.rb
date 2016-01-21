require_relative 'test_helper'

class TypeTest < Minitest::Test
  def test_all_returns_all_types
    VCR.use_cassette('all_types') do
      types = MTG::Type.all
      
      assert types.length > 10
      assert types.any? {|type| type == 'Creature'}
    end
  end
end