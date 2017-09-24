class Person

  attr_accessor :name
  attr_accessor :race

  def initialize (name, race = :human)
    raise ScriptError, 'name cannot be empty' if name.nil?
    @name = name
    @race = race
  end

  def to_s
    name
  end
end