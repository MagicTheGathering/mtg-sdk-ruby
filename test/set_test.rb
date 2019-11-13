require_relative 'test_helper'

class SetTest < Minitest::Test
  def test_find_returns_one_set
    VCR.use_cassette('one_set') do
      set = MTG::Set.find('ktk')

      assert_equal 'KTK', set.code
      assert_equal 'Khans of Tarkir', set.name
      assert_equal 'expansion', set.type
      assert_equal 'black', set.border
      assert set.booster.any? {|rarity| rarity == 'common'}
      assert_equal '2014-09-26', set.release_date
      assert_equal 'ktk', set.magic_cards_info_code
    end
  end

  def test_find_with_invalid_code_throws_exception
    VCR.use_cassette('invalid_code') do
      assert_raises ArgumentError do
        MTG::Set.find('invalid')
      end
    end
  end

  def test_all_returns_all_sets
    VCR.use_cassette('all_sets') do
      sets = MTG::Set.all

      assert sets.length > 100
    end
  end

  def test_all_with_filter_returns_sets
    VCR.use_cassette('all_sets_filtered') do
      sets = MTG::Set.where(name: 'khans').all

      set = sets[0]
      assert_equal 'KTK', set.code
      assert_equal 'Khans of Tarkir', set.name
    end
  end

  def test_generate_booster_returns_cards
    VCR.use_cassette('booster') do
      cards = MTG::Set.generate_booster('ktk')

      assert cards.length == 15
      assert_equal 'KTK', cards.first.set
    end
  end

  def test_service_unavailable
    VCR.use_cassette('service_unavailable') do
      assert_raises ArgumentError, "Unavailable Service" do
        MTG::Set.find('ktk')
      end

      assert_raises ArgumentError, "Unavailable Service" do
        MTG::Set.all
      end
    end
  end
end
