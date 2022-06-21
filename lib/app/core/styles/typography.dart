import 'package:flutter/widgets.dart';

import 'themes.dart';

class AppTypography {
  static final _fontFamily =
      AppTheme.appTheme().textTheme.bodyText1?.fontFamily ?? '';

  static final _baseTextStyle = TextStyle(fontFamily: _fontFamily);

  static final hxx = _baseTextStyle.copyWith(
    fontSize: 52,
    fontWeight: FontWeight.w400,
  );

  static final hx = _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w400,
  );

  static final h1 = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  static final h2 = _baseTextStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final h3 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final body = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final bodyEmphasis = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final button = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final buttonEmphasis = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static final caption = _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final captionEmphasis = _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
}
