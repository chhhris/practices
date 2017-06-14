class MinHeap
  attr_writer :storage

  def storage
    @storage ||= []
  end

  def swap(index1, index2)
    storage[index1], storage[index2] = storage[index2], storage[index1]
  end

  def peak
    storage[0]
  end

  def size
    storage.length
  end

  def insert(val)
    storage.push(val)
    bubble_up(size - 1)
  end

  def bubble_up(child_index)
    parent_index = get_parent_index(child_index)

    while(child_index > 0 && storage[parent_index] > storage[child_index])
      swap(child_index, parent_index)

      child_index = parent_index
      parent_index = get_parent_index(child_index)
    end
  end

  def remove_peak
    swap(0, size - 1)
    removed_element = storage.pop
    bubble_down(0)
    return removed_element
  end

  def bubble_down(parent_index)
    child_index = get_child_index(parent_index)

    while (parent_index < (size - 1) && storage[parent_index] > storage[child_index])
      swap(child_index, parent_index)
      parent_index = child_index
      child_index = get_child_index(parent_index)
    end
  end

  private

  def get_parent_index(child_index)
    if child_index % 2 == 0
      (child_index - 2) / 2
    else
      (child_index - 1) / 2
    end
  end

  def get_child_index(parent_index)
    first_child_index = (parent_index * 2) + 1
    second_child_index = first_child_index + 1

    if first_child_index >= size || second_child_index >= size
      first_child_index
    elsif storage[first_child_index] < storage[second_child_index]
      first_child_index
    else
      second_child_index
    end
  end

end

test = MinHeap.new
# test.storage = [1, 2, 3, 4, 5]
# test.swap(0, 1)

puts "\n"
# test.insert(10)
# test.insert(8)
# test.insert(5)
# test.insert(1)
# test.insert(7)
# test.insert(3)
# test.insert(6)

test.storage = [1, 5, 3, 10, 8, 7, 6]
p test.remove_peak
p test.storage
# p test
puts "\n"