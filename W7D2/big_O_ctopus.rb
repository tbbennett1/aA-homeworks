# Big O-ctopus and Biggest Fish
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.
FISH_ARR = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggy(arr)
  largest_fishy = ""
  arr.each do |ele1|
    arr.each do |ele2|
      if ele1.length > ele2.length
        largest_fishy = ele1
      else  
        largest_fishy = ele2
      end
    end
  end
  largest_fishy
end

# p sluggy(FISH_ARR)

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. 

def dominant_o(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = arr.take(mid)
  right = arr.drop(mid)

  sorted_left = dominant_o(left)
  sorted_right = dominant_o(right)

  sorted_fish = float_up(sorted_left, sorted_right)
  # sorted_fish[-1]
end

def float_up(left, right)
  merged = []

  until left.empty? || right.empty?
    if left[0].length < right[0].length
      merged << left.shift
    else  
      merged << right.shift
    end
  end

  merged + left + right
end

# p dominant_o(FISH_ARR)[-1]

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_girl(arr)
  biggest_fish = ''
  arr.each {|fish| biggest_fish = fish if fish.length > biggest_fish.length}
  biggest_fish
end

# p clever_girl(FISH_ARR)


# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

def slow_dance(direction, arr)
  arr.each_with_index {|dir, idx| return idx if direction == dir }
end

# p slow_dance("up", tiles_array)           #=> 0
# p slow_dance("right-down", tiles_array)   #> 3

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
tiles_hash = {
  up: 0,
  right_up: 1,
  right: 2,
  right_down: 3,
  down: 4,
  left_down: 5,
  left: 6,
  left_up: 7
}

def fast_dance(direction, hash)
  hash[direction]
end

p fast_dance(:up, tiles_hash)
p fast_dance(:right_down, tiles_hash)