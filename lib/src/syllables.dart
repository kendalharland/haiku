import 'package:haiku/src/allowed_chars.dart';
import 'package:haiku/src/cmu_dict.dart';

const _vowels = 'aeiouy';
final dict = buildCmuDict();

int countSyllables(String word) {
  word = word.toLowerCase().replaceAll(unallowedChars, ' ').trim();

  if (word.contains(' ')) {
    var words = word.split(' ')..removeWhere((w) => w.trim().isEmpty);
    return countSyllablesAll(words.toList());
  } else {
    return dict[word] ?? 0;
  }
}

int countSyllablesAll(List<String> words) {
  return words.fold(0, (count, word) => count + countSyllables(word));
}
