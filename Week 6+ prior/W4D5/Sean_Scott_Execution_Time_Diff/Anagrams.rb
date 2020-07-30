def first_anagram?(string, string2)
  chars = string.split("")
    permutations = chars.permutation.to_a
      permutations.each do |sub|
        if sub.join("") == string2
            return true
        end
    end
false 
end


# a.permutation.to_a    #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

# p first_anagram?('word', 'rxod')


#when is somthign log n or n log n or 2^n 


def second_anagram?(string1, string2)

    string1.each_char.with_index do |char, idx|
        if string2.include?(char)
            string2.delete_at(char)

            
            b
# Array#find_index