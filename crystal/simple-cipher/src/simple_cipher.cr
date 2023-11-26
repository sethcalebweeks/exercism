class SimpleCipher

  getter key : String
  
  def initialize(@key = "aaaaaaaaaa")
  end

  def encode(text : String)
    keyChars = @key.each_char.cycle
    String.build do |str|
      text.each_char do |char|
        shifted = char + (keyChars.next.as(Char) - 'a')
        str << (shifted > 'z' ? 'a' + (shifted - 'z' - 1) : shifted)
      end
    end
  end

  def decode(text : String)
    keyChars = @key.each_char.cycle
    String.build do |str|
      text.each_char do |char|
        shifted = char - (keyChars.next.as(Char) - 'a')
        str << (shifted < 'a' ? 'z' - ('a' - shifted - 1) : shifted)
      end
    end
  end

end