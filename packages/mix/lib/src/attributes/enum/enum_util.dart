// ignore_for_file: unused_element

import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/attribute.dart';
import '../../core/utility.dart';

part 'enum_util.g.dart';

/// {@macro vertical_direction_utility}
@MixableEnumUtility()
final class VerticalDirectionUtility<T extends Attribute>
    extends MixUtility<T, VerticalDirection> with _$VerticalDirectionUtility {
  VerticalDirectionUtility(super.builder);
}

/// {@macro border_style_utility}
@MixableEnumUtility()
final class BorderStyleUtility<T extends Attribute>
    extends MixUtility<T, BorderStyle> with _$BorderStyleUtility {
  BorderStyleUtility(super.builder);
}

/// {@macro clip_utility}
@MixableEnumUtility()
final class ClipUtility<T extends Attribute> extends MixUtility<T, Clip>
    with _$ClipUtility {
  ClipUtility(super.builder);
}

/// {@macro axis_utility}
@MixableEnumUtility()
final class AxisUtility<T extends Attribute> extends MixUtility<T, Axis>
    with _$AxisUtility {
  AxisUtility(super.builder);
}

/// {@macro flex_fit_utility}
@MixableEnumUtility()
final class FlexFitUtility<T extends Attribute> extends MixUtility<T, FlexFit>
    with _$FlexFitUtility {
  FlexFitUtility(super.builder);
}

/// {@macro stack_fit_utility}
@MixableEnumUtility()
final class StackFitUtility<T extends Attribute> extends MixUtility<T, StackFit>
    with _$StackFitUtility {
  StackFitUtility(super.builder);
}

/// {@macro image_repeat_utility}
@MixableEnumUtility(generateCallMethod: false)
final class ImageRepeatUtility<T extends Attribute>
    extends MixUtility<T, ImageRepeat> with _$ImageRepeatUtility {
  ImageRepeatUtility(super.builder);

  T call([ImageRepeat value = ImageRepeat.repeat]) => builder(value);
}

/// {@macro text_direction_utility}
@MixableEnumUtility()
final class TextDirectionUtility<T extends Attribute>
    extends MixUtility<T, TextDirection> with _$TextDirectionUtility {
  TextDirectionUtility(super.builder);
}

/// {@macro tile_mode_utility}
@MixableEnumUtility()
final class TileModeUtility<T extends Attribute> extends MixUtility<T, TileMode>
    with _$TileModeUtility {
  TileModeUtility(super.builder);
}

/// {@macro main_axis_alignment_utility}
@MixableEnumUtility()
final class MainAxisAlignmentUtility<T extends Attribute>
    extends MixUtility<T, MainAxisAlignment> with _$MainAxisAlignmentUtility {
  MainAxisAlignmentUtility(super.builder);
}

/// {@macro cross_axis_alignment_utility}
@MixableEnumUtility()
final class CrossAxisAlignmentUtility<T extends Attribute>
    extends MixUtility<T, CrossAxisAlignment> with _$CrossAxisAlignmentUtility {
  CrossAxisAlignmentUtility(super.builder);
}

/// {@macro main_axis_size_utility}
@MixableEnumUtility()
final class MainAxisSizeUtility<T extends Attribute>
    extends MixUtility<T, MainAxisSize> with _$MainAxisSizeUtility {
  MainAxisSizeUtility(super.builder);
}

/// {@macro box_fit_utility}
@MixableEnumUtility()
final class BoxFitUtility<T extends Attribute> extends MixUtility<T, BoxFit>
    with _$BoxFitUtility {
  BoxFitUtility(super.builder);
}

/// {@macro blend_mode_utility}
@MixableEnumUtility()
final class BlendModeUtility<T extends Attribute>
    extends MixUtility<T, BlendMode> with _$BlendModeUtility {
  BlendModeUtility(super.builder);
}

/// {@macro box_shape_utility}
@MixableEnumUtility()
final class BoxShapeUtility<T extends Attribute> extends MixUtility<T, BoxShape>
    with _$BoxShapeUtility {
  BoxShapeUtility(super.builder);
}

/// {@macro font_style_utility}
@MixableEnumUtility()
final class FontStyleUtility<T extends Attribute>
    extends MixUtility<T, FontStyle> with _$FontStyleUtility {
  FontStyleUtility(super.builder);
}

/// {@macro text_decoration_style_utility}
@MixableEnumUtility()
final class TextDecorationStyleUtility<T extends Attribute>
    extends MixUtility<T, TextDecorationStyle>
    with _$TextDecorationStyleUtility {
  TextDecorationStyleUtility(super.builder);
}

/// {@macro text_baseline_utility}
@MixableEnumUtility()
final class TextBaselineUtility<T extends Attribute>
    extends MixUtility<T, TextBaseline> with _$TextBaselineUtility {
  TextBaselineUtility(super.builder);
}

/// {@macro text_overflow_utility}
@MixableEnumUtility()
final class TextOverflowUtility<T extends Attribute>
    extends MixUtility<T, TextOverflow> with _$TextOverflowUtility {
  TextOverflowUtility(super.builder);
}

/// {@macro text_width_basis_utility}
@MixableEnumUtility()
final class TextWidthBasisUtility<T extends Attribute>
    extends MixUtility<T, TextWidthBasis> with _$TextWidthBasisUtility {
  TextWidthBasisUtility(super.builder);
}

/// {@macro text_align_utility}
@MixableEnumUtility()
final class TextAlignUtility<T extends Attribute>
    extends MixUtility<T, TextAlign> with _$TextAlignUtility {
  TextAlignUtility(super.builder);
}

/// {@macro filter_quality_utility}
@MixableEnumUtility()
final class FilterQualityUtility<T extends Attribute>
    extends MixUtility<T, FilterQuality> with _$FilterQualityUtility<T> {
  FilterQualityUtility(super.builder);
}

/// {@macro wrap_alignment_utility}
@MixableEnumUtility()
final class WrapAlignmentUtility<T extends Attribute>
    extends MixUtility<T, WrapAlignment> with _$WrapAlignmentUtility {
  WrapAlignmentUtility(super.builder);
}

@MixableEnumUtility()
class TableCellVerticalAlignmentUtility<T extends Attribute>
    extends MixUtility<T, TableCellVerticalAlignment>
    with _$TableCellVerticalAlignmentUtility<T> {
  TableCellVerticalAlignmentUtility(super.builder);
}
