import 'package:meta/meta.dart';

@immutable
abstract class HaikuException implements Exception {}

/// Raised when the total syllable count of a phrase is not 17.
@immutable
class HaikuSyllableException implements HaikuException {
  final int expected;
  final int actual;
  final List<String> words;

  @literal
  const HaikuSyllableException(this.expected, this.actual, this.words);

  @override
  String toString() => 'Exected $expected syllables. Got $actual in $words';
}

/// Raised when a phrase cannot be split into the necessary parts of a haiku.
@immutable
class HaikuPartitionException implements HaikuException {
  final int expected;
  final List<String> words;

  @literal
  const HaikuPartitionException(this.expected, this.words);

  @override
  String toString() => 'Could not split $expected syllables from $words';
}
