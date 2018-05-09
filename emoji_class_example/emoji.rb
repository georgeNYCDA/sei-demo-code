class Emote
  attr_reader :original

  def initialize(str)
    @original = str
  end
  
  def sad
    @original + ' :‑('
  end
  
  def happy
    "#{@original}  :‑)"
  end
  
  def laughing
    @original + ' (*^.^*)'
  end
  
  def angry
    @original + ' >:[  '
  end
end

class SuperEmote < Emote

  def sad_reversed
    sad.reverse
  end
  
  def happy_reversed
    happy.reverse
  end
  
  def laughing_reversed
    laughing.reverse
  end
  
  def angry_reversed
    angry.reverse
  end
  
end


sentence = SuperEmote.new('This is my second string')
puts sentence.sad
puts sentence.happy
puts sentence.angry
puts sentence.laughing
puts sentence.original


puts sentence.sad_reversed
puts sentence.happy_reversed
puts sentence.angry_reversed
puts sentence.laughing_reversed