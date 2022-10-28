def my_uniq(arr)
    unique = Array.new
    hash_count = Hash.new(0)
    arr.each {|ele| hash_count[ele] += 1}
    arr.each do |ele|
        if !unique.include?(ele)
            unique << ele
        end
    end
    unique
end

class Array
    def two_sum
        summed = Array.new
        (0...self.length - 1).each do |i1|
            (0...self.length).each do |i2|
                if i1 < i2 && self[i1] + self[i2] == 0
                    if i1 < i2
                        summed << [i1, i2]
                    else
                        summed << [i2, i1]
                    end
                end
            end
        end
        summed
    end
end


def my_transpose(arr)
    transposed = Array.new(arr.length) {Array.new(arr.length)}
    arr.each_with_index do |row, ri|
        row.each_with_index do |ele, ci|
            transposed[ci][ri] = arr[ri][ci]
        end
    end
    transposed
end

def stock_picker(stocks)
    possible_days = Array.new
    stocks.each_with_index do |stock, day|
        stocks.each_with_index do |stock2, day2|
            if stock < stock2 && day < day2
                possible_days << [stock, stock2]
            end
        end
    end
    sorted_possible = possible_days.sort_by {|pair| (pair[0] - pair[1]).abs}
    sorted_possible[-1]

end