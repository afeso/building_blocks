def ceaser(word, shift)
  alphabets = 'abcdefghijklmnopqrstuvwxyz'
  alphabetic_characters = alphabets.split('')
  special_characters = [',', '.', ' ', '!']
  # reversed_characters = alphabetic_characters.reverse

  arrayed_word = word.split('')
  cipher = []

  arrayed_word.length.times do |i|
    if shift >= 0
      if special_characters.include?(arrayed_word[i])
        cipher << arrayed_word[i]
        next # skips to the next loop
      end

      word_index = alphabetic_characters.index(arrayed_word[i].downcase)
      $new_index = word_index + shift

      wrap_around($new_index)

      if arrayed_word[i] === arrayed_word[i].upcase
        cipher << alphabetic_characters[$new_index].upcase
      else
        cipher << alphabetic_characters[$new_index]
      end
    end
  end
  cipher.join
end

def wrap_around(index)
  if index >= 78
    $new_index -= 78
  elsif index >= 52
    $new_index -= 52
  elsif index >= 26
    $new_index -= 26
  end
end

puts ceaser('dEf', 25)
puts ceaser('This is, SPARTA', 13)
puts ceaser(' ', 2)
p ceaser('Looking at Pontlay', 80)
