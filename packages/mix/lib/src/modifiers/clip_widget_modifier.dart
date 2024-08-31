// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../attributes/border/border_radius_dto.dart';
import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/modifier.dart';
import '../core/utility.dart';

part 'clip_widget_modifier.g.dart';

@MixableSpec(skipUtility: true)
final class ClipOvalModifierSpec
    extends WidgetModifierSpec<ClipOvalModifierSpec>
    with _$ClipOvalModifierSpec, Diagnosticable {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipOvalModifierSpec({this.clipper, this.clipBehavior});

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }

  @override
  Widget build(Widget child) {
    return ClipOval(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

@MixableSpec(skipUtility: true)
final class ClipRectModifierSpec
    extends WidgetModifierSpec<ClipRectModifierSpec>
    with _$ClipRectModifierSpec, Diagnosticable {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipRectModifierSpec({this.clipper, this.clipBehavior});

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }

  @override
  Widget build(Widget child) {
    return ClipRect(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      child: child,
    );
  }
}

@MixableSpec(skipUtility: true)
final class ClipRRectModifierSpec
    extends WidgetModifierSpec<ClipRRectModifierSpec>
    with _$ClipRRectModifierSpec, Diagnosticable {
  final BorderRadiusGeometry? borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  ClipRRectModifierSpec({
    this.borderRadius,
    this.clipper,
    this.clipBehavior,
  });
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }

  @override
  Widget build(Widget child) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

@MixableSpec(skipUtility: true)
final class ClipPathModifierSpec
    extends WidgetModifierSpec<ClipPathModifierSpec>
    with _$ClipPathModifierSpec, Diagnosticable {
  final CustomClipper<Path>? clipper;
  final Clip? clipBehavior;

  const ClipPathModifierSpec({this.clipper, this.clipBehavior});

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }

  @override
  Widget build(Widget child) {
    return ClipPath(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

@MixableSpec(skipUtility: true)
final class ClipTriangleModifierSpec
    extends WidgetModifierSpec<ClipTriangleModifierSpec>
    with _$ClipTriangleModifierSpec, Diagnosticable {
  final Clip? clipBehavior;

  ClipTriangleModifierSpec({this.clipBehavior});

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }

  @override
  Widget build(Widget child) {
    return ClipPath(
      clipper: TriangleClipper(),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  TriangleClipper();
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

final class ClipPathModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, ClipPathModifierSpecAttribute> {
  ClipPathModifierSpecUtility(super.builder);

  T call({CustomClipper<Path>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipPathModifierSpecAttribute(
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}

final class ClipRRectModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, ClipRRectModifierSpecAttribute> {
  ClipRRectModifierSpecUtility(super.builder);
  T call({
    BorderRadius? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
  }) {
    return builder(
      ClipRRectModifierSpecAttribute(
        borderRadius: borderRadius?.toDto(),
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}

final class ClipOvalModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, ClipOvalModifierSpecAttribute> {
  ClipOvalModifierSpecUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipOvalModifierSpecAttribute(
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}

final class ClipRectModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, ClipRectModifierSpecAttribute> {
  ClipRectModifierSpecUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipRectModifierSpecAttribute(
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}

final class ClipTriangleModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, ClipTriangleModifierSpecAttribute> {
  ClipTriangleModifierSpecUtility(super.builder);
  T call({Clip? clipBehavior}) {
    return builder(
      ClipTriangleModifierSpecAttribute(clipBehavior: clipBehavior),
    );
  }
}
