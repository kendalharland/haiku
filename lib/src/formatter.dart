import 'package:haiku/haiku.dart';

/// Converts a [Haiku] to a string.
class HaikuFormatter {
  String format(Haiku haiku) => [
        haiku.firstLine,
        haiku.secondLine,
        haiku.thirdLine
      ].map((line) => line.join(' ')).join('\n');

  const HaikuFormatter();
}

/// Delegates to some other [HaikuFormatter].
class DelegatingFormatter implements HaikuFormatter {
  final HaikuFormatter _delegate;

  @override
  String format(Haiku haiku) => _delegate.format(haiku);

  const DelegatingFormatter(this._delegate);
}

/// Formats a [Haiku], citing the [speaker].
class CitationFormatter extends DelegatingFormatter {
  final String speaker;

  @override
  String format(Haiku haiku) => '${super.format(haiku)}\n    - $speaker';

  const CitationFormatter(this.speaker, HaikuFormatter delegate)
      : super(delegate);
}
