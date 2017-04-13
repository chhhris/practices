
# reverse_vowels
#
# Write a function which accepts a word in character array format and returns
# that word with all of its vowels reversed.
#

def reverse_vowels(word)    
    puts "original: #{word}"
    left_pointer = 0
    right_pointer = (word.length - 1)

    vowels = {
        'a' => 1,
        'e' => 1,
        'i' => 1,
        'o' => 1,
        'u' => 1
    }

    while(left_pointer != right_pointer) do
        if vowels[word[left_pointer]] == 1
            until(vowels[word[right_pointer]] == 1) do
                right_pointer -= 1
            end

            original_left_vowel = word[left_pointer]
            word[left_pointer] = word[right_pointer]
            word[right_pointer] = original_left_vowel
        end
        left_pointer += 1
        right_pointer -= 1
    end

    puts "reversed: #{word}"
end


reverse_vowels(['d','a','v','i','d','o','p','e','d'])
## ['d','e','v','o','d','i','p','a']