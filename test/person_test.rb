require 'minitest/autorun'
require_relative '../lib/person'

class TestPerson < MiniTest::Test

  def test_person_needs_a_name
    assert_raises (ScriptError) { person = Person.new(nil) }
  end

  def test_species_defaults_to_human
    person = Person.new ('Leia Organa')
    assert_equal(:human, person.species)
  end

  def test_humans_are_not_nonhumans
    person = Person.new("Luke")
    refute (person.non_human?)
  end

  def test_other_species_are_nonhumans
    [:droid, :wookie, :geonosian, :thrandoshan, :sullustan, :mon_calamari].each { |species|
      person = Person.new("Luke", species)
      assert (person.non_human?)
    }
  end

  def test_to_s_includes_species_if_nonhuman
    person = Person.new('Chewbacca',:wookie)
    assert_includes(person.to_s, "wookie")
  end

  def test_to_s_does_not_include_species_if_human
    person = Person.new ('Leia Organa')
    refute_includes(person.to_s, "human")
  end

end