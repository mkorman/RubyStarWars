#member variables preceeded by "@"
class Spaceship

  # You can define a method to access a property
  def destination
    @destination
  end

  # and a method to set it (note that '=' is part of the method name)
  def destination= (newDestination)
    @destination = newDestination
  end

  # More idiomatic to use attr_accessor
  attr_accessor :name, :owner, :pilot, :copilot, :current_location, :passengers, :cargo
  attr_reader :model

  # constructor is defined via 'initialize' method
  def initialize(model, name, owner)
    @model = model
    self.name = name
    self.owner = owner
    self.passengers = []
    self.cargo = []
  end

  def launch (destination)
    raise ScriptError, 'needs a pilot to launch' if pilot.nil?
    @destination = destination
    puts "Launching towards #{@destination}"
  end

  def arrive
    raise ScriptError if @destination.nil?
    self.current_location = destination
    @destination = nil
    puts "Arrived at #{self.current_location}"
  end

  def cancel_launch
    @destination = nil
    puts 'Launch cancelled. Returning to port.'
  end

  def <<(cargo)
    self.cargo << cargo
  end

  def status
    if !self.destination
      'Stationary'
    else
      "Headed to #{self.destination}"
    end
  end

  def hail
    "This is the #{self.name}, headed for #{self.destination} and carrying #{self.passengers.size} passenger(s)"
  end

  def manifest
    manifest = "Vessel: #{self.name}\nPassengers:\n"
    self.passengers.each { |p| manifest += "  - #{p}\n"}
    manifest += "Cargo:\n"
    self.cargo.each { |c| manifest += "  - #{c}\n"}
    manifest
  end
end