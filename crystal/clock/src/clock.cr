class Clock
  
  getter time : Int32

  def initialize(hour = 0, minute = 0)
    @time = (hour * 60 + minute) % (60 * 24)
  end

  def to_s
    hour = (@time // 60) % 24
    minute = @time % 60
    "#{hour.to_s(precision: 2)}:#{minute.to_s(precision: 2)}"
  end

  def +(other : self) : self
    @time += other.time % (60 * 24)
    self
  end

  def -(other : self) : self
    @time -= other.time
    self
  end

  def ==(other : self) : Bool
    other.time % (60 * 24) == self.time % (60 * 24)
  end

end
