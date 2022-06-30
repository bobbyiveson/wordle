def wordle(target_word, guess_word)
    result = ""

    # where the magic happens:

    if target_word.length != 5 || guess_word.length != 5
        return false 
    end

    target_word_arr = target_word.split("")

    guess_word.split("").each_with_index { |character, index|
        if character == target_word[index]
            target_word_arr[index] = nil
            result += "2"
        elsif (character != target_word[index]) && (target_word_arr.include? character)
            target_match_index = target_word_arr.index(character)
            target_word_arr[target_match_index] = nil
            result += "1"
        else
            result += "0"
        end
    }

    # relae
    # 211
    # ___
    # rleee
    
    result
end