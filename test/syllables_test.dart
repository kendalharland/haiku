import 'package:haiku/src/syllables.dart';
import 'package:test/test.dart';

void main() {
  group('countSyllables', () {
    test('should return the number of syllables in a word', () {
      expect(countSyllables('Autumn'), 2);
      expect(countSyllables('moonlight'), 2);
      expect(countSyllables('a'), 1);
      expect(countSyllables('worm'), 1);
      expect(countSyllables('digs'), 1);
      expect(countSyllables('silently'), 3);
      expect(countSyllables('into'), 2);
      expect(countSyllables('the'), 1);
      expect(countSyllables('chestnut'), 2);
      expect(countSyllables('noncompetitively'), 6);
    });
  });
}
