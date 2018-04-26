module DominantOctopus
  def merge_sort(arr)
    return arr if arr.length < 2
    mid = arr.length / 2
    left,right = arr.take(mid), arr.drop(mid)
    left, right = merge_sort(left), merge_sort(right)
    merge(left,right)
  end

  def merge(left,right)
    merged = []
    until left.empty? || right.empty?
      if left.first > right.first
        merged << right.shift
      else
        merged << left.shift
      end
    end
    merged + left + right
  end

end

class BigOctopus
  include DominantOctopus

  FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  @tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
  @tiles_hash = {
    up: 1,
    right_up: 2,
    right: 3,
    right_down: 4,
    down: 5,
    left_down: 6,
    left: 7,
    left_up: 8
  }

  attr_reader :name
  def initialize
    @name = "Quadraticus Timicus (QT)"
  end

  def sluggish_search
    biggest_fish  = ''
    FISH.each_with_index do |f,id1|
      FISH.each_with_index do |f2,id2|
        biggest_fish = f.length > f2.length ? f : f2 if id1 != id2 && biggest_fish.length < f.length && biggest_fish.length < f2.length
      end
    end
    biggest_fish
  end

  def dominant_octopus
    arr = FISH.dup
    length = merge_sort(arr.map(&:length)).last
    FISH.select {|f| f.length == length}.first
  end

  def clever_octopus
    biggest_fish = ''
    FISH.each do |f|
      biggest_fish = f if f.length > biggest_fish.length
    end
    biggest_fish
  end

  def slow_dance(move,array)
    array = @tiles_array
    array.each_with_index do |tile_move,idx|
      return idx if move == tile_move
    end
  end

  def fast_dance(move, hash)
    hash = @tiles_hash
    hash[move]
  end

end
