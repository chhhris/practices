# [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10], [10, 11] ]

def merge_ranges(array_of_mtgs)
  if array_of_mtgs.length < 2
    return array_of_mtgs
  end

  sorted_mtgs = array_of_mtgs.sort
  merged_meetings = [sorted_mtgs[0]]

  sorted_mtgs.each do |current_mtg_start, current_mtg_end|
    last_merged_mtg_start, last_merged_mtg_end = merged_meetings.last

    if last_merged_mtg_end >= current_mtg_end
      next
    elsif last_merged_mtg_end >= current_mtg_start
      merged_meetings.last.replace([merged_meetings.last.first, current_mtg_end])
    else
      merged_meetings << [current_mtg_start, current_mtg_end]
    end
  end

  p merged_meetings
end

# array_of_mtgs = [ [1, 2], [2, 3] ]
array_of_mtgs = [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
# array_of_mtgs = [ [1, 10], [2, 6], [3, 5], [7, 9] ]

merge_ranges(array_of_mtgs)
