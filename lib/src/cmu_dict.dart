import 'dart:io';
import 'package:packages/packages.dart';

/// Words that are missing from the given dictionary.
const _missingWords = const <String, int>{
  'noncompetitively': 6,
  'hibiscus': 3,
};

/// Builds a dictionary mapping words to syllable counts from src/data/cmudict*
Map<String, int> buildCmuDict() {
  var p = new Packages();
  var dictFile = new File(p
      .resolvePackageUri(Uri.parse('package:haiku/src/data/cmudict.0.7a'))
      .uri
      .path);
  var dict = _processCmuDict(dictFile.readAsLinesSync());
  // Manually add missing words
  dict.addAll(_missingWords);
  return dict;
}

Map<String, int> _processCmuDict(List<String> dictLines) {
  final map = <String, int>{};
  final nonLetters = new RegExp(r'[^a-z]');

  for (var line in dictLines) {
    var parts = line.split('  ');
    var word = parts.first.toLowerCase();

    if (word.contains(nonLetters)) {
      continue;
    }

    var sounds = parts.last.toLowerCase();
    var syllableCount =
        sounds.split(' ').where((sound) => 'aeiouy'.contains(sound[0])).length;

    if (sounds.startsWith('y')) {
      syllableCount -= 1;
    }

    word = word.replaceAll(nonLetters, '');
    map[word] = syllableCount;
  }
  return map;
}
