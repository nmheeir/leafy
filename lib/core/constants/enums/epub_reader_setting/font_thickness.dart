import 'dart:ui';

enum FontThickness {
  thin(FontWeight.w100),
  extraLight(FontWeight.w200),
  light(FontWeight.w300),
  normal(FontWeight.w400),
  medium(FontWeight.w500);

  final FontWeight weight;
  const FontThickness(this.weight);
}
