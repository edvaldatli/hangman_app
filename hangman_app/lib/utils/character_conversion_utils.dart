String? IcelandicToEnglish(String char) {
  Map<String, String> characters = {
    'A': 'Á',
    'E': 'É',
    'Y': 'Ý',
    'U': 'Ú',
    'I': 'Í',
    'O': 'Ó',
  };

  if (characters.containsKey(char)) {
    return characters[char];
  } else {
    return '';
  }
}
