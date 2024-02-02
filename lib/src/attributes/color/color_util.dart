// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/color_ext.dart';
import '../../theme/tokens/color_token.dart';
import '../scalars/scalar_util.dart';
import 'color_directives.dart';
import 'color_dto.dart';

@immutable
class ColorUtility<T extends StyleAttribute>
    extends DtoUtility<T, ColorDto, Color> {
  const ColorUtility(super.builder) : super(valueToDto: ColorDto.new);

  T _buildColor(Color color) => builder(valueToDto(color));

  T _directive(ColorDirective directive) =>
      builder(ColorDto.directive(directive));

  MaterialColorUtility<T> get red => MaterialColorUtility(builder, Colors.red);
  MaterialColorUtility<T> get pink =>
      MaterialColorUtility(builder, Colors.pink);
  MaterialColorUtility<T> get purple =>
      MaterialColorUtility(builder, Colors.purple);
  MaterialColorUtility<T> get deepPurple =>
      MaterialColorUtility(builder, Colors.deepPurple);
  MaterialColorUtility<T> get indigo =>
      MaterialColorUtility(builder, Colors.indigo);
  MaterialColorUtility<T> get blue =>
      MaterialColorUtility(builder, Colors.blue);
  MaterialColorUtility<T> get lightBlue =>
      MaterialColorUtility(builder, Colors.lightBlue);
  MaterialColorUtility<T> get cyan =>
      MaterialColorUtility(builder, Colors.cyan);
  MaterialColorUtility<T> get teal =>
      MaterialColorUtility(builder, Colors.teal);
  MaterialColorUtility<T> get green =>
      MaterialColorUtility(builder, Colors.green);
  MaterialColorUtility<T> get lightGreen =>
      MaterialColorUtility(builder, Colors.lightGreen);
  MaterialColorUtility<T> get lime =>
      MaterialColorUtility(builder, Colors.lime);
  MaterialColorUtility<T> get yellow =>
      MaterialColorUtility(builder, Colors.yellow);
  MaterialColorUtility<T> get amber =>
      MaterialColorUtility(builder, Colors.amber);
  MaterialColorUtility<T> get orange =>
      MaterialColorUtility(builder, Colors.orange);
  MaterialColorUtility<T> get deepOrange =>
      MaterialColorUtility(builder, Colors.deepOrange);
  MaterialColorUtility<T> get brown =>
      MaterialColorUtility(builder, Colors.brown);
  MaterialColorUtility<T> get grey =>
      MaterialColorUtility(builder, Colors.grey);
  MaterialColorUtility<T> get blueGrey =>
      MaterialColorUtility(builder, Colors.blueGrey);
  MaterialAccentColorUtility<T> get redAccent =>
      MaterialAccentColorUtility(builder, Colors.redAccent);
  MaterialAccentColorUtility<T> get pinkAccent =>
      MaterialAccentColorUtility(builder, Colors.pinkAccent);
  MaterialAccentColorUtility<T> get purpleAccent =>
      MaterialAccentColorUtility(builder, Colors.purpleAccent);
  MaterialAccentColorUtility<T> get deepPurpleAccent =>
      MaterialAccentColorUtility(builder, Colors.deepPurpleAccent);
  MaterialAccentColorUtility<T> get indigoAccent =>
      MaterialAccentColorUtility(builder, Colors.indigoAccent);
  MaterialAccentColorUtility<T> get blueAccent =>
      MaterialAccentColorUtility(builder, Colors.blueAccent);
  MaterialAccentColorUtility<T> get lightBlueAccent =>
      MaterialAccentColorUtility(builder, Colors.lightBlueAccent);
  MaterialAccentColorUtility<T> get cyanAccent =>
      MaterialAccentColorUtility(builder, Colors.cyanAccent);
  MaterialAccentColorUtility<T> get tealAccent =>
      MaterialAccentColorUtility(builder, Colors.tealAccent);
  MaterialAccentColorUtility<T> get greenAccent =>
      MaterialAccentColorUtility(builder, Colors.greenAccent);
  MaterialAccentColorUtility<T> get lightGreenAccent =>
      MaterialAccentColorUtility(builder, Colors.lightGreenAccent);
  MaterialAccentColorUtility<T> get limeAccent =>
      MaterialAccentColorUtility(builder, Colors.limeAccent);
  MaterialAccentColorUtility<T> get yellowAccent =>
      MaterialAccentColorUtility(builder, Colors.yellowAccent);
  MaterialAccentColorUtility<T> get amberAccent =>
      MaterialAccentColorUtility(builder, Colors.amberAccent);
  MaterialAccentColorUtility<T> get orangeAccent =>
      MaterialAccentColorUtility(builder, Colors.orangeAccent);
  MaterialAccentColorUtility<T> get deepOrangeAccent =>
      MaterialAccentColorUtility(builder, Colors.deepOrangeAccent);
  T withOpacity(double opacity) => _directive(OpacityColorDirective(opacity));
  T withAlpha(int alpha) => _directive(AlphaColorDirective(alpha));
  T darken(int percentage) => _directive(DarkenColorDirective(percentage));
  T lighten(int percentage) => _directive(LightenColorDirective(percentage));
  T saturate(int percentage) => _directive(SaturateColorDirective(percentage));
  T desaturate(int percentage) =>
      _directive(DesaturateColorDirective(percentage));
  T tint(int percentage) => _directive(TintColorDirective(percentage));
  T shade(int percentage) => _directive(ShadeColorDirective(percentage));
  T brighten(int percentage) => _directive(BrightenColorDirective(percentage));

  T of(ColorToken ref) => _buildColor(ref());

  T transparent() => _buildColor(Colors.transparent);
  T black() => _buildColor(const Color(0xFF000000));
  T black87() => _buildColor(const Color(0xDD000000));
  T black54() => _buildColor(const Color(0x8A000000));
  T black45() => _buildColor(const Color(0x73000000));
  T black38() => _buildColor(const Color(0x61000000));
  T black26() => _buildColor(const Color(0x42000000));
  T black12() => _buildColor(const Color(0x1F000000));
  T white() => _buildColor(const Color(0xFFFFFFFF));
  T white70() => _buildColor(const Color(0xB3FFFFFF));
  T white60() => _buildColor(const Color(0x99FFFFFF));
  T white54() => _buildColor(const Color(0x8AFFFFFF));
  T white38() => _buildColor(const Color(0x62FFFFFF));
  T white30() => _buildColor(const Color(0x4DFFFFFF));
  T white24() => _buildColor(const Color(0x3DFFFFFF));
  T white12() => _buildColor(const Color(0x1FFFFFFF));
  T white10() => _buildColor(const Color(0x1AFFFFFF));

  T call(Color color) => _buildColor(color);
}

abstract class ColorSwatchUtility<T extends StyleAttribute>
    extends MixUtility<T, ColorDto> {
  final ColorSwatch<int> color;
  const ColorSwatchUtility(super.builder, this.color);
  T _buildColor(Color color) => builder(ColorDto(color));
}

@immutable
class MaterialColorUtility<T extends StyleAttribute>
    extends ColorSwatchUtility<T> {
  const MaterialColorUtility(super.builder, super.color);

  T shade50() => _buildColor(color[50]!);
  T shade100() => _buildColor(color[100]!);
  T shade200() => _buildColor(color[200]!);
  T shade300() => _buildColor(color[300]!);
  T shade400() => _buildColor(color[400]!);
  T shade500() => _buildColor(color[500]!);
  T shade600() => _buildColor(color[600]!);
  T shade700() => _buildColor(color[700]!);
  T shade800() => _buildColor(color[800]!);
  T shade900() => _buildColor(color[900]!);

  T call() => _buildColor(color[500]!);
}

@immutable
class MaterialAccentColorUtility<T extends StyleAttribute>
    extends ColorSwatchUtility<T> {
  const MaterialAccentColorUtility(super.builder, super.color);

  T shade100() => _buildColor(color[100]!);
  T shade200() => _buildColor(color[200]!);
  T shade400() => _buildColor(color[400]!);
  T shade700() => _buildColor(color[700]!);

  T call() => _buildColor(color[400]!);
}

typedef ColorModifier = Color Function(Color);

@immutable
class OpacityColorDirective extends ColorDirective {
  final double opacity;
  const OpacityColorDirective(this.opacity);

  @override
  Color modify(Color color) => color.withOpacity(opacity);

  @override
  get props => [opacity];
}

@immutable
class AlphaColorDirective extends ColorDirective {
  final int alpha;
  const AlphaColorDirective(this.alpha);

  @override
  Color modify(Color color) => color.withAlpha(alpha);

  @override
  get props => [alpha];
}

@immutable
class DarkenColorDirective extends ColorDirective {
  final int percentage;
  const DarkenColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.darken(percentage);

  @override
  get props => [percentage];
}

@immutable
class LightenColorDirective extends ColorDirective {
  final int percentage;
  const LightenColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.lighten(percentage);

  @override
  get props => [percentage];
}

@immutable
class SaturateColorDirective extends ColorDirective {
  final int percentage;
  const SaturateColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.saturate(percentage);

  @override
  get props => [percentage];
}

@immutable
class DesaturateColorDirective extends ColorDirective {
  final int percentage;
  const DesaturateColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.desaturate(percentage);

  @override
  get props => [percentage];
}

@immutable
class TintColorDirective extends ColorDirective {
  final int percentage;
  const TintColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.tint(percentage);

  @override
  get props => [percentage];
}

@immutable
class ShadeColorDirective extends ColorDirective {
  final int percentage;
  const ShadeColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.shade(percentage);

  @override
  get props => [percentage];
}

@immutable
class BrightenColorDirective extends ColorDirective {
  final int percentage;
  const BrightenColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.brighten(percentage);

  @override
  get props => [percentage];
}
