const _vowels = 'aeiouy';

int countSyllables(String word) {
  word = word.toLowerCase();
  word = word.replaceAll(new RegExp(r'[^a-z ]'), '');

  int vowelSoundsCount = _countVowels(word);
  vowelSoundsCount -= _countSilentVowels(word);
  vowelSoundsCount -= _countDipthongs(word);
  return vowelSoundsCount;
}

int countSyllablesAll(List<String> words) {
  return words.fold(0, (count, word) => count + countSyllables(word));
}

int _countVowels(String word) {
  int count = 0;
  for (int i = 0; i < word.length; i++) {
    if (_vowels.contains(word[i])) {
      count++;
    }
  }
  return count;
}

int _countSilentVowels(String word) {
  int count = 0;
  int s = 0, e = 0;

  while (s < word.length) {
    if (e > word.length - 1) {
      count += _countSilentVowelsInRange(word, s, e);
      break;
    } else if (_vowels.contains(word[e])) {
      e++;
    } else {
      count += _countSilentVowelsInRange(word, s, e);
      s = e;
      while (s < word.length && !_vowels.contains(word[s])) {
        s++;
      }
      e = s;
    }
  }
  return count;
}

int _countSilentVowelsInRange(String word, int start, int end) {
  final vowelGroup = word.substring(start, end);

  if (vowelGroup == 'e') {
    if (end >= word.length && word.endsWith('the') && word != 'the') {
      return 1;
    } else if (end >= 3 &&
        !_vowels.contains(word[end - 2]) &&
        _vowels.contains(word[end - 3])) {
      // <vowel><consonant>'e'.
      if (end >= word.length || word[end] != 'n') {
        // not silent if 'n' comes after 'e'.
        return 1;
      }
    } else if (end == word.length - 2 && word[end + 1] == 'd') {
      return 1;
    } else if (end >= word.length && word != 'the') {
      return 1;
    }
  }
  return 0;
}

int _countDipthongs(String word) {
  int count = 0;
  for (int i = 1; i < word.length; i++) {
    if (_vowels.contains(word[i]) && _vowels.contains(word[i - 1])) {
      count += 1;
    }
  }
  return count;
}
