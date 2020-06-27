require 'byebug'
def my_min(array)

    smallest = array.first

    (0...array.length - 1).each do |index1|
        ((index1 + 1)...array.length).each do |index2|
            if array[index1] > array[index2] && array[index2] < smallest
                smallest = array[index2]
            end
        end
    end
    smallest
end

def my_min(array)

    array.inject do |acc, el|
        if acc < el
            acc
        else
            el
        end
    end
end

# def largest_contiguous_subsum(array)

#     sub_arrays = []
#     sub_sums = []

#     (0...array.length - 1).each do |idx1|
#         ((idx1 + 1)...array.length).each do |idx2|
#             sub_arrays << array[idx1..idx2]
#         end
#     end

#     sub_arrays.each do |sub_array|
#         sub_sums << sub_array.sum
#     end
    
#     sub_sums.max
# end

def largest_contiguous_subsum2(array)

    sums = [array[0..1]]

    array.inject do |acc, el|
        acc = acc + el
        sums << acc
        if acc < 0
            acc = 0
        else
            acc
        end
    end
    sums.flatten.max

end



#p largest_contiguous_subsum([2, 3, -6, 7, -6, 7])

p largest_contiguous_subsum2([-5, -1, -3])

