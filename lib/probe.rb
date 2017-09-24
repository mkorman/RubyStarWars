class Probe
  def deploy
    puts 'Deploying probe...'
  end
  def take_sample
    puts 'Sampling...'
  end
end

class MineralProbe < Probe
  def take_sample
    super
    puts 'Mineral sample taken'
  end
end

class AtmosphericProbe < Probe
  def take_sample
    super
    puts 'Atmospheric sample taken'
  end
end