require_relative 'test_helper'

class SupertypeTest < Minitest::Test
  def test_all_returns_all_types
    VCR.use_cassette('all_supertypes') do
      types = MTG::Supertype.all
      
      assert types.length == 5
      assert types.any? {|type| type == 'Legendary'}
    end
  end
end