import 'package:haiku/haiku.dart';

class HaikuFormatter {
  String format(Haiku haiku) => [
        haiku.firstLine,
        haiku.secondLine,
        haiku.thirdLine
      ].map((line) => line.join(' ')).join('\n');

  const HaikuFormatter();
}

/// An 'Italics' formatter depending on where the haiku is rendered.
class ItalicsFormatter extends HaikuFormatter {
  @override
  String format(Haiku haiku) => '*${super.format(haiku)}*';

  const ItalicsFormatter();
}

/// Formats a [Haiku], citing the [speaker].
class CitationFormatter extends ItalicsFormatter {
  final String speaker;

  @override
  String format(Haiku haiku) => '${super.format(haiku)}\n    - $speaker';

  const CitationFormatter(this.speaker);
}
