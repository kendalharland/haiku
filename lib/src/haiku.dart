import 'package:haiku/src/exception.dart';
import 'package:haiku/src/syllables.dart';

/// A model for a poem of seventeen syllables, consisting of three lines of
/// five, seven, and five.
class Haiku {
  /// Returns true iff [speech] can be considered an Haiku.
  static bool isHaiku(String speech) {
    try {
      create(speech);
      return true;
    } on HaikuException catch (_) {
      return false;
    }
  }

  /// Creates a new [Haiku] from [speech].
  static Haiku create(String speech) => new Haiku._(_getHaikuLines(speech));

  static List<List<String>> _getHaikuLines(String speech) {
    var words = speech
        .replaceAll('\n', '')
        .split(' ')
        .map((w) => w.trim())
        .toList()
          ..removeWhere((w) => w.isEmpty);

    int syllablesCount = countSyllablesAll(words);
    if (syllablesCount != 17) {
      throw new HaikuSyllableException(17, syllablesCount, words);
    }

    List<String> firstLine, secondLine, thirdLine;

    firstLine = new List.unmodifiable(_getSyllables(words, 5));
    words = words.sublist(firstLine.length);

    secondLine = new List.unmodifiable(_getSyllables(words, 7));
    words = words.sublist(secondLine.length);

    thirdLine = new List.unmodifiable(_getSyllables(words, 5));

    return new List.unmodifiable([firstLine, secondLine, thirdLine]);
  }

  static List<String> _getSyllables(List<String> words, int count) {
    final line = <String>[];
    final wordsIterator = words.iterator;

    while (countSyllablesAll(line) < count) {
      if (!wordsIterator.moveNext()) {
        throw new HaikuPartitionException(count, words);
      }
      line.add(wordsIterator.current);
    }

    if (countSyllablesAll(line) > count) {
      throw new HaikuPartitionException(count, words);
    }

    return line;
  }

  /// The lines of this haiku.
  final List<List<String>> _lines;

  Haiku._(this._lines);

  /// The first line of this haiku, with 5 syllables.
  List<String> get firstLine => _lines[0];

  /// The second line of this haiku, with 7 syllables.
  List<String> get secondLine => _lines[1];

  /// The third line of this haiku, with 5 syllables.
  List<String> get thirdLine => _lines[2];
}
