import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/utility.dart';
import '../../theme/tokens/color_token.dart';
import 'color_directives.dart';
import 'color_dto.dart';
import 'material_colors_util.dart';

abstract base class BaseColorUtility<T extends Attribute>
    extends MixUtility<T, ColorDto> {
  BaseColorUtility(super.builder);

  T _buildColor(Color color) => builder(ColorDto(color));
}

base class FoundationColorUtility<T extends Attribute, C extends Color>
    extends BaseColorUtility<T> with ColorDirectiveMixin<T> {
  final C color;
  FoundationColorUtility(super.builder, this.color);

  T call() => _buildColor(color);
  @override
  T directive(ColorDirective directive) =>
      builder(ColorDto.raw(value: color, directives: [directive]));
}

/// A utility class for building [Attribute] instances from a list of [ColorDto] objects.
///
/// This class extends [MixUtility] and provides a convenient way to create [Attribute]
/// instances by transforming a list of [Color] objects into a list of [ColorDto] objects.
final class ColorListUtility<T extends Attribute>
    extends MixUtility<T, List<ColorDto>> {
  ColorListUtility(super.builder);

  /// Creates an [Attribute] instance from a list of [Color] objects.
  ///
  /// This method maps each [Color] object to a [ColorDto] object and passes the
  /// resulting list to the [builder] function to create the [Attribute] instance.
  T call(List<Color> colors) {
    return builder(colors.map((e) => e.toDto()).toList());
  }
}

final class ColorUtility<T extends Attribute> extends BaseColorUtility<T>
    with ColorDirectiveMixin<T>, MaterialColorsMixin<T>, BasicColorsMixin<T> {
  ColorUtility(super.builder);

  T ref(ColorToken ref) => _buildColor(ref());

  T call(Color color) => _buildColor(color);
}

typedef ColorModifier = Color Function(Color);

base mixin BasicColorsMixin<T extends Attribute> on BaseColorUtility<T> {
  late final transparent = FoundationColorUtility(builder, Colors.transparent);

  late final black = FoundationColorUtility(builder, Colors.black);

  late final black87 = FoundationColorUtility(builder, Colors.black87);

  late final black54 = FoundationColorUtility(builder, Colors.black54);

  late final black45 = FoundationColorUtility(builder, Colors.black45);

  late final black38 = FoundationColorUtility(builder, Colors.black38);

  late final black26 = FoundationColorUtility(builder, Colors.black26);

  late final black12 = FoundationColorUtility(builder, Colors.black12);

  late final white = FoundationColorUtility(builder, Colors.white);

  late final white70 = FoundationColorUtility(builder, Colors.white70);

  late final white60 = FoundationColorUtility(builder, Colors.white60);

  late final white54 = FoundationColorUtility(builder, Colors.white54);

  late final white38 = FoundationColorUtility(builder, Colors.white38);

  late final white30 = FoundationColorUtility(builder, Colors.white30);

  late final white24 = FoundationColorUtility(builder, Colors.white24);

  late final white12 = FoundationColorUtility(builder, Colors.white12);

  late final white10 = FoundationColorUtility(builder, Colors.white10);
}

base mixin ColorDirectiveMixin<T extends Attribute> on BaseColorUtility<T> {
  T directive(ColorDirective directive) =>
      builder(ColorDto.directive(directive));
  T withOpacity(double opacity) => directive(OpacityColorDirective(opacity));
  T withAlpha(int alpha) => directive(AlphaColorDirective(alpha));
  T darken(int percentage) => directive(DarkenColorDirective(percentage));
  T lighten(int percentage) => directive(LightenColorDirective(percentage));
  T saturate(int percentage) => directive(SaturateColorDirective(percentage));
  T desaturate(int percentage) =>
      directive(DesaturateColorDirective(percentage));
  T tint(int percentage) => directive(TintColorDirective(percentage));
  T shade(int percentage) => directive(ShadeColorDirective(percentage));
  T brighten(int percentage) => directive(BrightenColorDirective(percentage));
}

class OpacityColorDirective extends ColorDirective {
  final double opacity;
  const OpacityColorDirective(this.opacity);

  @override
  Color modify(Color color) => color.withOpacity(opacity);

  @override
  get props => [opacity];
}

class AlphaColorDirective extends ColorDirective {
  final int alpha;
  const AlphaColorDirective(this.alpha);

  @override
  Color modify(Color color) => color.withAlpha(alpha);

  @override
  get props => [alpha];
}

class DarkenColorDirective extends ColorDirective {
  final int percentage;
  const DarkenColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.darken(percentage);

  @override
  get props => [percentage];
}

class LightenColorDirective extends ColorDirective {
  final int percentage;
  const LightenColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.lighten(percentage);

  @override
  get props => [percentage];
}

class SaturateColorDirective extends ColorDirective {
  final int percentage;
  const SaturateColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.saturate(percentage);

  @override
  get props => [percentage];
}

class DesaturateColorDirective extends ColorDirective {
  final int percentage;
  const DesaturateColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.desaturate(percentage);

  @override
  get props => [percentage];
}

class TintColorDirective extends ColorDirective {
  final int percentage;
  const TintColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.tint(percentage);

  @override
  get props => [percentage];
}

class ShadeColorDirective extends ColorDirective {
  final int percentage;
  const ShadeColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.shade(percentage);

  @override
  get props => [percentage];
}

class BrightenColorDirective extends ColorDirective {
  final int percentage;
  const BrightenColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.brighten(percentage);

  @override
  get props => [percentage];
}

extension ColorExtUtilities on Color {
  Color mix(Color toColor, [int amount = 50]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;

    return Color.fromARGB(
      ((toColor.alpha - alpha) * p + alpha).round(),
      ((toColor.red - red) * p + red).round(),
      ((toColor.green - green) * p + green).round(),
      ((toColor.blue - blue) * p + blue).round(),
    );
  }

  Color lighten([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final lightness = _clamp(hsl.lightness + p);

    return hsl.withLightness(lightness).toColor();
  }

  Color brighten([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;

    return Color.fromARGB(
      alpha,
      math.max(0, math.min(255, red - (255 * -p).round())),
      math.max(0, math.min(255, green - (255 * -p).round())),
      math.max(0, math.min(255, blue - (255 * -p).round())),
    );
  }

  Color contrast([int amount = 100]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;

    final luminance = computeLuminance();

    return luminance > 0.5 ? darken((p).round()) : brighten((p).round());
  }

  Color darken([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final lightness = _clamp(hsl.lightness - p);

    return hsl.withLightness(lightness).toColor();
  }

  Color tint([int amount = 10]) => mix(
        const Color.fromRGBO(255, 255, 255, 1.0),
        amount,
      );

  Color shade([int amount = 10]) => mix(
        const Color.fromRGBO(0, 0, 0, 1.0),
        amount,
      );

  Color desaturate([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final saturation = _clamp(hsl.saturation - p);

    return hsl.withSaturation(saturation).toColor();
  }

  Color saturate([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final saturation = _clamp(hsl.saturation + p);

    return hsl.withSaturation(saturation).toColor();
  }

  Color greyscale() => desaturate(100);

  Color complement() {
    final hsl = HSLColor.fromColor(this);
    final hue = (hsl.hue + 180) % 360;

    return hsl.withHue(hue).toColor();
  }
}

double _clamp(double val) => math.min(1.0, math.max(0.0, val));
