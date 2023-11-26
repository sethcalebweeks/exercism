class Node

  property value : Int32
  property left : Node | Nil
  property right : Node | Nil

  def initialize(@value)
  end

  def insert(item)
    if item <= @value
      if @left.nil?
        @left = Node.new(item)
      else
        @left.as(Node).insert(item)
      end
    else
      if @right.nil?
        @right = Node.new(item)
      else
        @right.as(Node).insert(item)
      end
    end
  end

  def sort
    left = @left.nil? ? [] of Int32 : @left.as(Node).sort
    right = @right.nil? ? [] of Int32 : @right.as(Node).sort
    left + [@value] + right
  end
    
    
end