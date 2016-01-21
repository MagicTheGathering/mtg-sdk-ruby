require_relative 'test_helper'

class ChangelogTest < Minitest::Test
  def test_all_returns_all_changelogs
    VCR.use_cassette('all_changelogs') do
      changelogs = MTG::Changelog.all
      
      assert changelogs.length > 1
      assert changelogs.any? {|changelog| changelog.version == '1.0.0'}
    end
  end
end