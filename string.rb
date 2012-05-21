class String
  def unique_chars?
    hash_count = {}
    self.each_char do |char|
      hash_count[char] ||= -1 
      hash_count[char] += 1
      return false if hash_count[char] > 0
    end
    true
  end

  def remove_duplicates
    memoization = {}
    string_with_no_duplicates = ""
    self.each_char do |char|
      if memoization[char].nil? 
        memoization[char] = true
        string_with_no_duplicates += char
      end
    end
    string_with_no_duplicates
  end

  def anagram?(string)
    sanatize_self = self.gsub(" ","").downcase
    sanatize_string = string.gsub(" ","").downcase
    sanatize_self.bytes.reduce(&:+) == sanatize_string.bytes.reduce(&:+)
  end

end

def reverse_c_string(string)
  string_to_reverse = string.slice(0, string.length - 1)
  reversed_string = ""
  string_to_reverse.each_char do |char|
   reversed_string = char + reversed_string 
  end
  reversed_string += "\0"
end

