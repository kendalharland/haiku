# haiku
Detect and create Haikus

Example

```dart
final haiku = Haiku.create('''
    An old silent pond... A frog jumps into the pond, splash! Silence again.
''');
print(const CitationFormatter('You').format(haiku));
```

This will print:

```
*An old silent pond...
A frog jumps into the pond,
splash! Silence again.*
    - You
```