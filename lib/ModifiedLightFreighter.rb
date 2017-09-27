require_relative 'spaceship'

class ModifiedLightFreighter < Spaceship
  def initialize(name, owner)
    super('Modified light freighter', name, owner)
  end
end