
# [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10], [10, 11] ]

# check if end time of current mtg is >= start and < end for another meeting
# if so, check if end time is later than end date of the other meeting
#   if it is, then block other meeting's start time up to current mtg's end time

# check if start time of current mtg is equal to end time of another meeting
# if so, then block other meeting's start time up to current mtg's end time

def merge_ranges(arry_of_mtgs)
  array_of_mtgs.sort

  merged_meetings = [arry_of_mtgs[0]]

  array_of_mtgs.each do |mtg_ary|
    # check for overlap btwn 
  end
end


# def merge_ranges(arry_of_mtgs)
#   condensed_range = []
#   arry_of_mtgs.each_with_index do |mtg, index|
#     current_start_time, current_end_time = mtg.first, mtg.last

#     array_of_mtgs[index+1...-1].each do |other_mtg|
#       start_time = other_mtg.first
#       end_time = other_mtg.last
      
#       if current_end_time > start_time && current_end_time <= end_time
#         mtg_block = [current_start_time, end_time]
#       end
#     end

#     condensed_range << mtg_block
#   end
# end