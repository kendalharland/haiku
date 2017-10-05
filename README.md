# Haiku
Detect and create Haikus

## Examples

#### Detecting a haiku

```dart
final poem = '''
   This is my long poem. It is too long for haiku, because it's tail is quite large.
''';

final haikuPoem = '''
    An old silent pond... A frog jumps into the pond, splash! Silence again.
''';

print(Haiku.isHaiku(poem); // False; 19 syllables
print(Haiku.isHaiku(haikuPoem); // True
```

#### Creating a Haiku

```dart
final haiku = Haiku.create(haikuPoem);
print(haiku.firstLine); // ['An', 'old', 'silent', 'pond...'];
print(haiku.thirdLine); // ['splash!', 'Silence', 'again.'];
```

#### Printing a Haiku

```dart
print(const CitationFormatter('You').format(haiku));

//  *An old silent pond...
//  A frog jumps into the pond,
//  splash! Silence again.*
//      - You
```
