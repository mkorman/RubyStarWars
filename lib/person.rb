class Person

  attr_accessor :name
  attr_accessor :species

  def initialize (name, species = :human)
    raise ScriptError, 'name cannot be empty' if name.nil?
    @name = name
    @species = species
  end

  def non_human?
    @species != :human
  end

  def to_s
    if self.non_human? then
      "#{@name} (#{@species})"
    else
      @name
    end
  end
end