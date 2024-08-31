import '../attributes/nested_style/nested_style_attribute.dart';
import 'attribute.dart';
import 'factory/style_mix.dart';

abstract class MixUtility<T extends Attribute, V> extends NestedStyleAttribute {
  final T Function(V) attributeBuilder;

  MixUtility(this.attributeBuilder) : super(Style());

  T builder(V v) {
    final attribute = attributeBuilder(v);
    value = value.add(attribute);

    return build();
  }

  T build() {
    return value.styles.attributeOfType<T>() as T;
  }

  static T selfBuilder<T>(T value) => value;
}

abstract class ScalarUtility<T extends Attribute, V> extends MixUtility<T, V> {
  ScalarUtility(super.builder);

  T call(V value) => builder(value);
}

base class ListUtility<T extends Attribute, V> extends MixUtility<T, List<V>> {
  ListUtility(super.builder);

  T call(List<V> values) => builder(values);
}

final class StringUtility<T extends Attribute>
    extends ScalarUtility<T, String> {
  StringUtility(super.builder);
}

/// A utility class for creating [Attribute] instances from [double] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [double] values or custom [double] values.
final class DoubleUtility<T extends Attribute>
    extends ScalarUtility<T, double> {
  DoubleUtility(super.builder);

  /// Creates an [Attribute] instance with a value of 0.
  T zero() => builder(0);

  /// Creates an [Attribute] instance with a value of [double.infinity].
  T infinity() => builder(double.infinity);
}

/// A utility class for creating [Attribute] instances from [int] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [int] values or custom [int] values.
final class IntUtility<T extends Attribute> extends ScalarUtility<T, int> {
  IntUtility(super.builder);

  /// Creates an [Attribute] instance with a value of 0.
  T zero() => builder(0);

  /// Creates an [Attribute] instance from a custom [int] value.
  @override
  T call(int value) => builder(value);
}

/// A utility class for creating [Attribute] instances from [bool] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [bool] values or custom [bool] values.
final class BoolUtility<T extends Attribute> extends ScalarUtility<T, bool> {
  BoolUtility(super.builder);

  /// Creates an [Attribute] instance with a value of `true`.
  T on() => builder(true);

  /// Creates an [Attribute] instance with a value of `false`.
  T off() => builder(false);
}

/// An abstract utility class for creating [Attribute] instances from [double] values representing sizes.
///
/// This class extends [DoubleUtility] and serves as a base for more specific sizing utilities.
abstract base class SizingUtility<T extends Attribute>
    extends ScalarUtility<T, double> {
  SizingUtility(super.builder);
}
