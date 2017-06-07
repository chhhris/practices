str = 'christopher steven love lake'

def reverse_string(str)
  length = str.length
  mid = length / 2

  0.upto(mid - 1) do |index|
    fchar = index
    bchar = length - 1 - index
    str[fchar], str[bchar] = str[bchar], str[fchar]
  end

  str
end

p str
p reverse_string(str)
