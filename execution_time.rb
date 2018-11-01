def my_min(arr) #o(n^2)
  min = arr.first
  arr.each do |el| #o(n)
    arr.each do |el1| #o(n)
      next if el == el1
      if min < el1
        min = el
      else
        min = el1 #1
      end
    end 
  end
  min
end


def better_min(arr) #o(0)
  min = 99999999
  arr.each do |el|
    min = el if el < min
  end
  min
end

# p better_min([2,1,5,0,6,-1])

def largest_contiguous_subsum(arr)
  subarr = []
  arr.each_index do |i|
    arr.each_index do |j|
      subarr << arr[i..j].sum
    end
  end
  # p subarr.sort_by {|subset| subset}.last
end



list = [-5, -1, -3]
# largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])



def best_sum(arr)
  # current_sum = arr.first
  # max_sum = arr.first
  # 
  # arr.each_with_index do |el,i|
  #   break if i == arr.length - 1
  #   next if i == 0
  #   if current_sum < 0
  #     current_sum = arr[i]
  #     max_sum = arr[i]
  #   else
  #     max_sum += el
  #   end
  # 
  # end
  # max_sum
  
  best_sum = 0
  curr_sum = 0
  reset = false
  arr.each_with_index do |el, idx|
    # if idx == 0
    #   best_sum = el
    #   curr_sum = el
    #   next
    # end
    # curr_sum += el
    # if curr_sum < 0
    #   curr_sum = arr[idx + 1]
    # end
    # best_sum = curr_sum if curr_sum > best_sum
    if reset
      best_sum = curr_sum
      reset = false
      next
    end
    curr_sum += el
    best_sum = curr_sum if curr_sum > best_sum
    if curr_sum < 0
      curr_sum = arr[idx + 1]
      reset = true
      next
    end
  end
  best_sum
end


# p best_sum(list)

def first_anagram(str1, str2)
end

def make_anagrams(str)
  return [[str]] if str.length <= 1
  prev_anagrams = make_anagrams(str[1..-1])
  prev_anagrams + prev_anagrams.map { |anagram| anagram + [str[0]] }
end

p make_anagrams("app")
