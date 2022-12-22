def lps(pattern)
  result = [-1]

  j = -1;
  0.upto(pattern.length - 1) do |i|
    while(j != -1 && pattern[j] != pattern[i]) do
      j = result[j];
    end
    j = j + 1
    result[i + 1] = j;
  end

  return result
end

def kmp(text, pattern)
  lps_arr = lps(pattern)
  found = false

  k = 0
  0.upto(text.length-1) do |j|
    while (k != -1 && pattern[k] != text[j]) do
      k = lps_arr[k];
    end
    k = k + 1
    if (k == pattern.length)
      found = true
      puts " \"#{pattern}\" бачимо в рядку \"#{text}\" в #{j-pattern.length+1}"
      k = 0
    end
  end

  unless found
    puts "\"#{pattern}\" не знайдено в рядку \"#{text}\""
  end
end

text = "AAAAAABAA"
pattern = "AAAс"
kmp(text, pattern)

text = "abcabc"
pattern = "bca"
kmp(text, pattern)


