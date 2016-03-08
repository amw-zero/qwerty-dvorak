# bad chars are qwez
$qwerty_to_dvorak = {
  'a' => 'a',
  'b' => 'x',
  'c' => 'j',
  'd' => 'e',
  'f' => 'u',
  'g' => 'i',
  'h' => 'd',
  'i' => 'c',
  'j' => 'h',
  'k' => 't',
  'l' => 'n',
  'm' => 'm',
  'n' => 'b',
  'o' => 'r',
  'p' => 'l',
  'r' => 'p',
  's' => 'o',
  't' => 'y',
  'u' => 'g',
  'v' => 'k',
  'x' => 'q',
  'y' => 'f'
}

$str_buf = ""
def to_dvorak(qwerty_str)
  $str_buf = ""
  qwerty_str.each_char { |char|
    char = $qwerty_to_dvorak[char]
    return nil unless char
    $str_buf << char
  }
  $str_buf
end

full_dictionary  = File.read('/usr/share/dict/words').split(/[\r\n]/)
valid_dict = full_dictionary.reject { |word| word[/[eqwz]/i] != nil }

$index = {}
full_dictionary.each { |word| $index[word] = true }

valid_dict.each do |word|
  dv_word = to_dvorak(word)
  if dv_word
    if $index[dv_word] != nil
      puts "qwerty: " + word + " | dvorak: " + dv_word
    end
  end
end
