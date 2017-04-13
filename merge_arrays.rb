def merge_arrays(aa, bb)
  a_subarray = aa[0...(aa.length - bb.length)]
  apointer = aa.length - 1

  a_subarray.each_with_index do |el, index|
    av = a_subarray[-1 - index]

    while (bb[bb.length - 1].to_i > av) do
      aa[apointer] = bb.pop
      apointer -= 1
    end
    
    aa[apointer] = av
    apointer -= 1
    
    aa[a_subarray.length - index - 1] = nil unless (a_subarray.length - index - 1) == 0
  end

  p aa
end

aa = [1, 3, 5, 8, 13, 27, 40, 55, nil, nil, nil, nil, nil, nil]
bb = [2, 7, 30, 56, 57, 58]

merge_arrays(aa, bb)