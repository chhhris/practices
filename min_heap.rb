class Minheap

  def storage
    @storage
  end

  def storage=(array)
    @storage = array
  end

  def swap(index1, index2)
    temp = storage[index1]
    storage[index1] = storage[index2]
    storage[index2] = temp
  end

  def size
    storage.length
  end

  def peak
    storage[0]
  end

  def insert(value)
    storage.push(value)
    storage.bubble_up(size - 1)
  end

  def bubble_up(child_index)
    parent_index = get_parent_index(child_index)

    while (child_index > 0 && storage[parent_index] > storage[child_index]) do
      swap(child_index, parent_index)
       child_index = parent_index

       parent_index = get_parent_index(child_index)
    end
  end

  def get_parent_index(child_index)
    if child_index % 2 == 0
      parent_index = (child_index - 2) / 2
    else
      parent_index = (child_index - 1) / 2
    end
    parent_index
  end

  def remove_peak
    swap(0, size - 1)
    to_return = storage.pop
    bubble_down(0)
    return to_return
  end

  def bubble_down(parent_index)
    odd_child_index = 2 * parent_index + 1
    even_child_index = 2 * parent_index + 2 # odd_child_index + 1

    if odd_child_index >= size
      return
    else
      min_child_index = get_min_child_index(odd_child_index, even_child_index)
    end

    elsif even_child_index >= size
      min_child_index = odd_child_index
    else
      if storage[odd_child_index] < storage[even_child_index]
        min_child_index = odd_child_index
      else
        min_child_index = even_child_index
      end
    end

    while (parent_index < size - 1 && storage[parent_index] > storage[min_child_index]) do
      swap(parent_index, min_child_index)

      parent_index = min_child_index
      odd_child_index = 2 * parent_index + 1
      even_child_index = 2 * parent_index + 2 # odd_child_index + 1

      if odd_child_index >= size
        return
      else
        min_child_index = get_min_child_index(odd_child_index, even_child_index)
      end
    end
  end

  def get_min_child_index(odd_child_index, even_child_index)
    min_child_index = if even_child_index >= size
      odd_child_index
    elsif storage[odd_child_index] < storage[even_child_index]
      odd_child_index
    else
      even_child_index
    end
  end

end

test = Minheap.new
test.storage = [1,2,3,4,5]
test.swap(1, 2)
p test.storage