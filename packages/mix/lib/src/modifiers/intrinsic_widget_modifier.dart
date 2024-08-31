// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/modifier.dart';
import '../core/utility.dart';

part 'intrinsic_widget_modifier.g.dart';

@MixableSpec(skipUtility: true)
final class IntrinsicHeightModifierSpec
    extends WidgetModifierSpec<IntrinsicHeightModifierSpec>
    with _$IntrinsicHeightModifierSpec, Diagnosticable {
  const IntrinsicHeightModifierSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }

  @override
  Widget build(Widget child) {
    return IntrinsicHeight(child: child);
  }
}

@MixableSpec(skipUtility: true)
final class IntrinsicWidthModifierSpec
    extends WidgetModifierSpec<IntrinsicWidthModifierSpec>
    with _$IntrinsicWidthModifierSpec, Diagnosticable {
  const IntrinsicWidthModifierSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }

  @override
  Widget build(Widget child) {
    return IntrinsicWidth(child: child);
  }
}

final class IntrinsicHeightModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, IntrinsicHeightModifierSpecAttribute> {
  IntrinsicHeightModifierSpecUtility(super.builder);
  T call() => builder(const IntrinsicHeightModifierSpecAttribute());
}

final class IntrinsicWidthModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, IntrinsicWidthModifierSpecAttribute> {
  IntrinsicWidthModifierSpecUtility(super.builder);
  T call() => builder(const IntrinsicWidthModifierSpecAttribute());
}
