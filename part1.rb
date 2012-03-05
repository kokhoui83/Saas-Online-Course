def palindrome?(string)
  # perform regex to remove non alphabets
  result = string.gsub(/[^a-zA-Z]/, "").to_s.downcase
  # check if reverse match non-reverse and print result
  return (result == result.reverse)
end

palindrome?("A man, a plan, a canal -- Panama")
palindrome?("Madam, I'm Adam!")
palindrome?("Abracadabra")

def count_words(string)
  # get unique keys
  keys = string.downcase.split(/\W+/).uniq
  # create empty hash
  hash = Hash.new { }
  # populate hash
  keys.each{ |key| hash[key] = string.downcase.split(/\W+/).count(key) }
  # return result
  return hash
end

#count_words("A man, a plan, a canal -- Panama")
#count_words("Doo bee doo bee doo")
