import 'package:haiku/haiku.dart';
import 'package:test/test.dart';

void main() {
  const haiku1 = ''' 
  An old silent pond... A frog jumps into the pond, splash! Silence again.
  ''';

  const haiku2 = '''
  Ah, Autumn moonlight -
  a worm digs so silently
  into the chestnut.
  ''';

  const haiku3 = ''' 
  In the twilight rain
  these brilliant-hued hibiscus
  A lovely sunset.
  ''';

  const notHaiku = '''
  Autumn moonlight -
  a worm digs silently 
  into the chestnut.
  ''';

  group(Haiku, () {
    test('haiku Haiku.isHaiku should return true iff the given text is a haiku',
        () {
      expect(Haiku.isHaiku(haiku1), true);
      expect(Haiku.isHaiku(haiku2), true);
      expect(Haiku.isHaiku(haiku3), true);
      expect(Haiku.isHaiku(notHaiku), false);
    });

    test('create should create a haiku', () {
      final haiku = Haiku.create(haiku1);
      expect(haiku.firstLine, ['An', 'old', 'silent', 'pond...']);
      expect(haiku.secondLine, ['A', 'frog', 'jumps', 'into', 'the', 'pond,']);
      expect(haiku.thirdLine, ['splash!', 'Silence', 'again.']);
    });
  });

  test('$HaikuFormatter should format a $Haiku', () {
    expect(
        const HaikuFormatter().format(Haiku.create(haiku1)),
        '''An old silent pond...
A frog jumps into the pond,
splash! Silence again.''');
  });

  test('$ItalicsFormatter should format a $Haiku in italics', () {
    expect(
        const ItalicsFormatter().format(Haiku.create(haiku1)),
        '''*An old silent pond...
A frog jumps into the pond,
splash! Silence again.*''');
  });

  test('$CitationFormatter should format a $Haiku with a citation', () {
    expect(
        const CitationFormatter('Obi Wan').format(Haiku.create(haiku1)),
        '''*An old silent pond...
A frog jumps into the pond,
splash! Silence again.*
    - Obi Wan''');
  });
}
