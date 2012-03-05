def combine_anagrams(words)
  hash = Hash.new()

  words.map do |word| 
    a = Array.new(1, word.to_s)
    if hash.has_key?(word.downcase.chars.sort.to_s)
      hash[word.downcase.chars.sort.to_s] = hash[word.downcase.chars.sort.to_s] + a
    else
      hash[word.downcase.chars.sort.to_s] = a
    end
  end

  array = Array.new()
  hash.each_value { |value| array.push(value) }

  return array
end

#puts combine_anagrams(['a', 'b', 'b', 'h', 'a','c', 'b','c'])
#puts combine_anagrams(['cars', 'For', 'potatoes', 'racs', 'four','Scar', 'creams','scream'])
