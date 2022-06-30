require_relative '../wordle'

describe 'wordle' do
    describe 'given parameters are invalid' do
        # Arrange
        incorrect_length_string = "a"
        correct_length_string = "aaaaa"
        expected = false

        it 'target word parameter is not equal to 5 return false' do
            # Act
            result = wordle(incorrect_length_string, correct_length_string)
            
            # Assert
            expect(result).to eq(expected)
        end

        it 'guess word parameter is not equal to 5 return false' do
            # Act
            result = wordle(correct_length_string, incorrect_length_string)

            # Assert
            expect(result).to eq(expected)
        end
    end
    
    describe 'given a matching pair of parameters' do
        # Arrange
        word = "aaaaa"
        expected = "22222"

        # Act
        result = wordle(word, word)
        it 'returns "22222"' do
            expect(result).to eq(expected)
        end
    end

    describe 'correct characters are returned' do
        
        describe 'for each character of the guess word that is not in the target word then return 0 for' do
            # Arrange
            target_word = "fghij"
            guess_word = "abcde"
            expected = "0"
            
            # Act
            result = wordle(target_word, guess_word)
            
            it 'the first character' do
                # Assert
                expect(result[0]).to eq(expected)
            end

            it 'the second character' do
                # Assert
                expect(result[1]).to eq(expected)
            end

            it 'the third character' do
                # Assert
                expect(result[2]).to eq(expected)
            end
            
            it 'the fourth character' do
                # Assert
                expect(result[3]).to eq(expected)
            end

            it 'the fifth character' do
                # Assert
                expect(result[4]).to eq(expected)
            end
        end

        describe 'for each character of the guess word if that character is in the target word but not in the same position' do
            describe 'and the character matches a character in the target word that has not been matched previously then return 1 for' do
                # Arrange
                target_word = "abcde"
                guess_word = "bcdea"
                expected = "1"
                
                # Act
                result = wordle(target_word, guess_word)
                
                it 'the first character' do
                    # Assert
                    expect(result[0]).to eq(expected)
                end

                it 'the second character' do
                    # Assert
                    expect(result[1]).to eq(expected)
                end

                it 'the third character' do
                    # Assert
                    expect(result[2]).to eq(expected)
                end

                it 'the fourth character' do
                    # Assert
                    expect(result[3]).to eq(expected)
                end

                it 'the fifth character' do
                    # Assert
                    expect(result[4]).to eq(expected)
                end
            end

            describe 'and the character matches a character in the target word that has been matched previously then return 0 for' do
                # Arrange
                target_word = "abcde"
                guess_word = "aabbb"
                expected = "0"
                
                # Act
                result = wordle(target_word, guess_word)
                
                it 'the second character' do
                    # Assert
                    expect(result[1]).to eq(expected)
                end

                it 'the fourth character' do
                    # Assert
                    expect(result[3]).to eq(expected)
                end

                it 'the fifth character' do
                    # Assert
                    expect(result[4]).to eq(expected)
                end
            end
        end

        describe 'for any character of the guess word if that character is in the target word and in the same position return 2 for' do
            # Arrange
            target_word = "abcde"
            guess_word = "abdee"
            expected = "2"

            # Act
            result = wordle(target_word, guess_word)

            it 'the first character' do
                # Assert
                expect(result[0]).to eq(expected)
            end

            it 'the second character' do
                # Assert
                expect(result[1]).to eq(expected)
            end

            it 'the fith character' do
                # Assert
                expect(result[4]).to eq(expected)
            end
        end

        describe 'use test examples from the README.md wordle spec' do
            describe 'No matching characters' do
                # Arrange
                target_word = "ropes"
                guess_word  = "child"
                expected = "00000"           
                
                # Act
                result = wordle(target_word, guess_word)

                it 'should return 00000' do
                    # Assert
                    expect(result).to eq(expected)
                end
            end

            describe 'Characters match in correct positions' do
                # Arrange
                target_word = "alert"
                guess_word  = "alarm"
                expected = "22020"           
                
                # Act
                result = wordle(target_word, guess_word)

                it 'should return 22020' do
                    # Assert
                    expect(result).to eq(expected)
                end
            end

            describe 'Character in wrong position' do
                # Arrange
                target_word = "stair"
                guess_word  = "chore"
                expected = "00010"           
                
                # Act
                result = wordle(target_word, guess_word)

                it 'should return 00010' do
                    # Assert
                    expect(result).to eq(expected)
                end
            end

            describe 'Mix of match and wrong position' do
                # Arrange
                target_word = "hairy"
                guess_word  = "charm"
                expected = "01120"           
                
                # Act
                result = wordle(target_word, guess_word)

                it 'should return 01120' do
                    # Assert
                    expect(result).to eq(expected)
                end
            end

            describe 'Multiple characters in wrong positions' do
                # Arrange
                target_word = "reads"
                guess_word  = "elect"
                expected = "10000"           
                
                # Act
                result = wordle(target_word, guess_word)

                it 'should return 10000' do
                    # Assert
                    expect(result).to eq(expected)
                end
            end
        end
    end
end