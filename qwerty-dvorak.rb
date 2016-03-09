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

full_dictionary  = File.read('/usr/share/dict/words').split("\n")

$index = {}
full_dictionary.each { |word| $index[word] = true }

full_dictionary.each do |word|
  next unless word[/[eqwz]/i] == nil

  dv_word = word.downcase.chars.map { |c| $qwerty_to_dvorak[c] }.join
  puts "qwerty: " + word + " | dvorak: " + dv_word if $index[dv_word] != nil
end
