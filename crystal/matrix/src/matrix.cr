class Matrix
  
  @matrix : Array(Array(Int32))

  def initialize(string)
    @matrix = string.split("\n").map(&.split(" ").map(&.to_i))
  end

  def row(row)
    @matrix[row - 1]
  end

  def column(column)
    @matrix.map(&.[column - 1])
  end

end
