
def letter_counter(string_to_search)
  # initialize variables to hold max count and character
  max_count = 0
  max_count_letter = nil
  
  string_array = string_to_search.gsub(' ' , '').split('')
  
  string_array.each do |char|
    current_count = 0
    
    string_array.each do |inner_char|
      if inner_char == char
        current_count += 1
      end
    end
    
    if current_count > max_count
      max_count = current_count
      max_count_letter = char
    end
    
  end
  
  max_count_letter
end

def letter_counter_optimzed(string_to_search)
  letter_counts = {}
  string_array = string_to_search.gsub(' ' , '').split('')

  string_array.each do |char|
    if letter_counts[char] == nil
      letter_counts[char] = 0
    end

    letter_counts[char] += 1
  end

  max_count = 0
  max_letter = nil
  letter_counts.each do |key, value|
    if value > max_count
      max_count = value
      max_letter = key
    end
  end

  max_letter
end


result = letter_counter("Bob is a very nice gardener")
p result

result2 = letter_counter_optimzed("Bob is a very nice gardener")
p result2