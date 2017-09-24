class Person

  attr_accessor :name
  attr_accessor :species

  def initialize (name, species = :human)
    raise ScriptError, 'name cannot be empty' if name.nil?
    @name = name
    @species = species
  end

  def to_s
    if species==:human then
      @name
    else
      "#{@name} (#{@species})"
    end
  end
end