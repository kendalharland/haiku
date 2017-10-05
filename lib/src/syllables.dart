const _vowels = 'aeiouy';

int countSyllables(String word) {
  word = word.toLowerCase();
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
  if (word.endsWith('e') && _countVowels(word) > 1) {
    count += 1;
  }
  if (word.endsWith('ely')) {
    count += 1;
  }

  return count;
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
