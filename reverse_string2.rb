

def reverse_string(str)
  left_pointer, right_pointer = 0, str.length - 1

  while left_pointer < right_pointer do
    str[left_pointer], str[right_pointer] = str[right_pointer], str[left_pointer]
    left_pointer += 1
    right_pointer -= 1
  end

  str
end


require 'rspec/autorun'

describe 'reverse_string' do
  it 'reverse string' do
    expect(reverse_string('hello')).to eq('olleh')
  end
end
