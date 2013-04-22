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

full_dictionary  = `cat /usr/share/dict/words`.split(/[\r\n]/)
valid_dict = full_dictionary.reject { |word| word[/[eqwz]/i] != nil }

valid_dict.each { |word|
  dv_word = to_dvorak(word)
  if dv_word
    match_index  = full_dictionary.index(dv_word)
    if match_index
      puts "qwerty: " + word + " | dvorak: " + dv_word
    end
  end
}



