class CircularBuffer
  
  @buffer : Array(Int32 | Nil)
  @write = 0
  @read = 0

  def initialize(size)
    @buffer = Array(Int32 | Nil).new(size, nil)
  end

  def write(item)
    begin
      if @buffer[@write] == nil
        @buffer[@write, 1] = item
      else
        raise RuntimeError.new("Buffer is full")
      end
    rescue exception
      raise RuntimeError.new("Buffer is full")
    end
    @write = (@write + 1) % @buffer.size
  end

  def read
    begin
      value = @buffer[@read]
      if value == nil
        raise RuntimeError.new("Buffer is empty")
      else
        @buffer[@read, 1] = nil
        @read = (@read + 1) % @buffer.size
        value
      end
    rescue exception
      raise RuntimeError.new("Buffer is empty")
    end
  end

  def clear
    @buffer = Array(Int32 | Nil).new(@buffer.size, nil)
    @write = 0
    @read = 0
  end

  def overwrite(item)
    @buffer[@write, 1] = item
    if @write == @read
      @read = (@read + 1) % @buffer.size
    end
    @write = (@write + 1) % @buffer.size
  end

end
