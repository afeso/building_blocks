@dictionary = %w[below down go going horn how howdy it i low
                 own part partner sit]
@strings_found = {}

def substrings(phrase, dictionary = @dictionary)
  phrase.downcase!
  phrase = phrase.split(' ')

  phrase.each do |word|
    find_match(word, dictionary)
  end

  @strings_found
end

def find_match(word, dictionary)
  dictionary.each do |match|
    if word.include?(match)
      if @strings_found.key?(match)
        @strings_found[match] += 1
      else
        @strings_found[match] = 1
      end
    end
  end
end

p substrings('below', @dictionary)
p substrings('Howdy partner, sit down! How\'s it going?', @dictionary)
