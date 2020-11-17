# remove_duplicates.rb
def remove_duplicates(nums)
    return nums.size if nums.size < 2
    last_index = nums.length - 1

    last_index.downto(1).each do |index|
        earlier_num = nums[index - 1]
        current_num = nums[index]
        if current_num == earlier_num
            nums.delete_at(index)
        end
    end
    nums.size
end

nums = [1,1,2]
nums = []
remove_duplicates(nums)
