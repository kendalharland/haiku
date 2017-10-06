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
  my brilliant hibiscus
  So lovely, it is.
  ''';

  const haiku4 = '''
  Robbie made poems.  Why did the bot not quote him? I wish it was so
  ''';

  const haiku5 = '''
  Such a tiny bug
Yet this small flaw was fatal 
Has grant cleaned his ass?
  ''';

  const tooShortForHaiku = '''
  Autumn moonlight -
  a worm digs silently 
  into the chestnut.
  ''';

  const tooLongForHaiku = '''
  This is my long poem.
  It is too long for haiku,
  because it's tail is quite large.
  ''';

  group(Haiku, () {
    test('haiku Haiku.isHaiku should return true iff the given text is a haiku',
        () {
      expect(Haiku.isHaiku(haiku1), true);
      expect(Haiku.isHaiku(haiku2), true);
      expect(Haiku.isHaiku(haiku3), true);
      expect(Haiku.isHaiku(haiku4), true);
      expect(Haiku.isHaiku(haiku5), true);
      expect(Haiku.isHaiku(tooShortForHaiku), false);
      expect(Haiku.isHaiku(tooLongForHaiku), false);
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

  test('$CitationFormatter should format a $Haiku with a citation', () {
    expect(
        new CitationFormatter('Obi Wan', new TestFormatter())
            .format(Haiku.create(haiku1)),
        '''An old silent pond...
A frog jumps into the pond,
splash! Silence again.
    - Obi Wan''');
  });
}

class TestFormatter extends HaikuFormatter {}
