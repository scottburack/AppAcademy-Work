fish_arr =
['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
  'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  def compare_On2(arr)
    longest_fish = ""

    arr.each do |fish|
        if fish.length > longest_fish.length
          longest_fish = fish
        end
    end
    longest_fish
  end

  compare_On2(fish_arr)

class Array

  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x <=> y}

    return self if length <= 1

    mid_idx = length / 2
    left = self.take(mid_idx).merge_sort(&prc)
    right = self.drop(mid_idx).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    results = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        results << left.shift
      when 0, 1
        results << right.shift
      end
    end

    results.concat(left)
    results.concat(right)
    results
  end


  def nlogn_biggest_fish(fishes)
    #sort the array longest to shortest
    prc = Proc.new {|x,y| y.length <=> x.length}
    fishes.merge_sort(&prc)[0]
  end

end

fish_arr.merge_sort
