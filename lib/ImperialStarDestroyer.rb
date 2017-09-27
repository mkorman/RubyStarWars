require_relative 'spaceship'

class ImperialStarDestroyer < Spaceship
  def initialize(name, owner)
    self.affiliation = :empire
    super('Imperial Star Destroyer', name, owner)
  end
end