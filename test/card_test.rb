# encoding: UTF-8
require_relative 'test_helper'

class CardTest < Minitest::Test
  def test_find_returns_one_card
    VCR.use_cassette('one_card') do
      card = MTG::Card.find(88803)

      assert_equal 'Choice of Damnations', card.name
      assert_equal '{5}{B}', card.mana_cost
      assert_equal 6, card.cmc
      assert_equal 'Sorcery — Arcane', card.type
      assert card.colors.any?{|color| color == 'Black'}
      assert card.color_identities.any?{|color_id| color == 'B'}
      assert card.types.any?{|type| type == 'Sorcery'}
      assert card.subtypes.any?{|subtype| subtype == 'Arcane'}
      assert_equal 'Rare', card.rarity
      assert_equal 'SOK', card.set
      assert_equal 'Saviors of Kamigawa', card.set_name
      assert_equal "Target opponent chooses a number. You may have that player lose that much life. If you don't, that player sacrifices all but that many permanents.", card.text
      assert_equal "\"Life is a series of choices between bad and worse.\"\n—Toshiro Umezawa", card.flavor
      assert_equal 'Tim Hildebrandt', card.artist
      assert_equal '62', card.number
      assert_equal 'normal', card.layout
      assert_equal 88803, card.multiverse_id
      assert_equal 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=88803&type=card', card.image_url
      assert card.rulings.any?{|ruling| ruling.date == Date.parse('2005-06-01')}
      assert card.foreign_names.any?{|foreign_name| foreign_name.name == '破灭抉择' && foreign_name.image_url == 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=104898&type=card'}
      assert card.printings.any?{|printing| printing == 'SOK'}
      assert_equal "Target opponent chooses a number. You may have that player lose that much life. If you don't, that player sacrifices all but that many permanents.", card.original_text
      assert_equal 'Sorcery — Arcane', card.original_type
      assert card.legalities.any?{|legality| legality.format == 'Commander' && legality.legality == 'Legal'}
      assert_equal '1c4aab072d52d283e902f2302afa255b39e0794b', card.id
    end
  end

  def test_find_with_invalid_id_throws_exception
    VCR.use_cassette('invalid_id') do
      assert_raises ArgumentError do
        MTG::Card.find(3239482932)
      end
    end
  end

  def test_where_with_page_size_and_page_returns_cards
    VCR.use_cassette('query_cards_pageSize') do
      cards = MTG::Card.where(pageSize: 10).where(page: 1).all

      # make sure we got only 10 cards back
      assert cards.length == 10
      assert cards.kind_of?(Array)
      assert cards.first.kind_of?(MTG::Card)
    end
  end

  def test_all_returns_cards
    VCR.use_cassette('all_filtered') do
      cards = MTG::Card.where(supertypes: 'legendary')
                       .where(subtypes: 'elf,warrior')
                       .all

      first_card = cards[0]
      assert first_card.supertypes.include? 'Legendary'
      assert first_card.subtypes.include? 'Elf'
      assert first_card.subtypes.include? 'Warrior'
    end
  end

  def test_all_returns_all_cards
    VCR.use_cassette('all_cards') do
      stub_request(:any, "https://api.magicthegathering.io/v1/cards").
        to_return(:body => File.new('test/responses/sample_cards.json'), :status => 200, :headers => {"Content-Type"=> "application/json"})

      stub_request(:any, "https://api.magicthegathering.io/v1/cards?page=2").
        to_return(:body => File.new('test/responses/no_cards.json'), :status => 200, :headers => {"Content-Type"=> "application/json"})

      cards = MTG::Card.all

      assert_equal 2, cards.length
    end
  end
end
