
require "./lib/spaceship"
require "./lib/probe"
require "./lib/person"

han = Person.new('Han Solo')
chewie = Person.new('Chewbacca', :wookie)
luke = Person.new('Luke Skywaalker')
princess = Person.new('Leia Organa')
r2 = Person.new('R2D2', :droid)
c3po = Person.new('C3-PO', :droid)
obi_wan = Person.new('Unidentified hermit', :humanoid)
ship = ModifiedLightFreighter.new('Millennium Falcon', han)
ship.pilot= han
ship.copilot= chewie
ship.passengers = [princess, luke, r2, c3po]
ship.passengers << obi_wan
puts ship.status
ship.launch ('Tatooine')
ship << "Power converters"
ship << "Moisture extractors"
ship << "(unidentified cargo)"
puts "#{ship.owner}'s #{ship.name} (#{ship.model}) is headed for #{ship.destination}"
ship.destination = 'Hoth'
puts ship.status
puts ship.inspect
ship.arrive
puts ship.hail
ship.passengers -= [luke, c3po]
puts ship.manifest
p ship
MineralProbe.new.take_sample
