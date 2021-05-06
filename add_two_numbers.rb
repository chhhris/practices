require 'byebug'
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
      @val = val
      @next = _next
  end
end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  output = current_node = ListNode.new
  p1, p2 = l1, l2
  carry = 0

  while p1 || p2 do
    sum = p1&.val.to_i + p2&.val.to_i + carry

    current_node.next = ListNode.new(sum % 10)
    carry = sum / 10
    current_node = current_node.next

    p1 = p1&.next
    p2 = p2&.next
  end

  if carry > 0
    current_node.next = ListNode.new(carry)
  end

  output.next
end

# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.

# Input: l1 = [0], l2 = [0]
# Output: [0]

# Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
# Output: [8,9,9,9,0,0,0,1]
# expectations = [
#   [
#     [[2,4,3], [5,6,4]],
#     [7,0,8]
#   ],
#   [
#     [[0], [0]],
#     [0]
#   ],
#   [
#     [[9,9,9,9,9,9,9], [9,9,9,9]],
#     [8,9,9,9,0,0,0,1]
#   ],
# ]
def ll(array)
  head = current = ListNode.new
  idx = 0
  while idx < array.length-1
    current.val = array[idx]
    current.next = ListNode.new
    current = current.next
    idx += 1
  end
  head
end

expectations = [
  # [
  #   [ll([2,4,3]), ll([5,6,4])],
  #   [7,0,8]
  # ],
  # [
  #   [ll([0]), ll([0])],
  #   [0]
  # ],
  [
    [ll([9,9,9,9,9,9,9]), ll([9,9,9,9])],
    [8,9,9,9,0,0,0,1]
  ],
]

# def to_ary(node)
#   output = []
#   while node.val
#     output << node.val
#     node = node.next
#   end
#   output
# end

expectations.each do |input, expected|
  puts "--------------------"
  puts "input '#{input}'"
  puts ""
  node = add_two_numbers(*input)
  actual = []
  while node&.val
    actual << node.val
    node = node.next
  end
  if actual != expected
    puts "FAIL"
    puts "      expected #{expected}"
    puts "      actual #{actual}"
  else
    puts "PASS"
  end
end