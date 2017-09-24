require 'minitest/autorun'
require_relative '../lib/spaceship'

class TestSpaceship < MiniTest::Test

  def setup
    @ship = Spaceship.new('Modified light freighter','Millenium Falcon','Han Solo')
  end

  def test_initialize
    assert_equal('Modified light freighter', @ship.model)
    assert_equal('Millenium Falcon', @ship.name)
    assert_equal('Han Solo', @ship.owner)
  end

  def test_cargo
    assert(@ship.cargo.size == 0)
    @ship << 'Flux capacitor'
    @ship << 'Wotsits'
    @ship << 'Thingybobby'
    @ship << 'Watchamacallit'
    assert_equal(4, @ship.cargo.size)
    @ship.cargo -= ['Wotsits', 'Thingybobby']
    assert_equal(2, @ship.cargo.size)
    assert_includes(@ship.cargo, 'Flux capacitor')
  end

  def test_needs_pilot_to_launch
    assert_raises (ScriptError) {@ship.launch('dummy')}
    @ship.pilot = 'Mal'
    @ship.launch ('dummy')
  end

  def test_travel
    @ship.pilot = 'dummy'
    assert_nil (@ship.destination)
    assert_nil (@ship.current_location)
    @ship.launch('Tatooine')
    assert_equal('Tatooine', @ship.destination)
    @ship.arrive
    assert_equal('Tatooine', @ship.current_location)
    assert_nil (@ship.destination)
    @ship.launch ('Hoth')
    @ship.cancel_launch
    assert_nil (@ship.destination)
  end

  def test_manifest
    @ship.passengers << "Luke"
    @ship.passengers << "Leia"
    @ship.passengers << "R2-D2"
    @ship.passengers << "C-3PO"

    @ship << 'Moisture condensers'

    manifest = @ship.manifest
    assert_includes(manifest, "Luke")
    assert_includes(manifest, "Leia")
    assert_includes(manifest, "Moisture condensers")
  end

end