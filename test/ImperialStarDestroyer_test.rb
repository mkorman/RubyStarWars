require 'minitest/autorun'
require_relative '../lib/ImperialStarDestroyer'

class TestImperialStarDestroyer < MiniTest::Test

  def test_destroyers_are_imperial
    destroyer = ImperialStarDestroyer.new('Victory','Grand Moff Tarkin')
    assert_equal(:empire, destroyer.affiliation)
  end

end