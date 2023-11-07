class JuiceMaker
  
  def initialize(fluid : Int32)
    @running = false
    @fluid = fluid
  end

  def self.debug_light_on?
    true
  end

  def start
    @running = true
  end

  def running?
    @running
  end

  def add_fluid(fluid)
    @fluid += fluid
  end

  def stop(minutes)
    @running = false
    @fluid -= (minutes * 5)
  end

end
