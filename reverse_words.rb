

def reverse_words(str)
  reverse_characters(str, 0, str.length - 1)

  start_index = 0

  for (end_index in 0..str.length) do
    if (end_index == str.length || str[end_index].match?(/\s/))
      reverse_characters(str, start_index, end_index - 1)
      start_index = end_index + 1
    end
  end

  str
end

def reverse_characters(str, start_index, end_index)
  while (start_index < end_index) do
    str[start_index], str[end_index] = str[end_index], str[start_index]
    start_index += 1
    end_index -= 1
  end

  str
end

puts reverse_words('cake pound steal')