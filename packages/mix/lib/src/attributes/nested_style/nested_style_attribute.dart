import '../../core/attribute.dart';
import '../../core/factory/style_mix.dart';

/// Allows to pass down Mixes as attributes for use with helpers.

class NestedStyleAttribute extends Attribute {
  Style value;

  NestedStyleAttribute(this.value);

  factory NestedStyleAttribute.fromList(List<Attribute> attributes) {
    return NestedStyleAttribute(Style.create(attributes));
  }

  @override
  NestedStyleAttribute merge(NestedStyleAttribute? other) {
    return other == null
        ? this
        : NestedStyleAttribute(value.merge(other.value));
  }

  @override
  Type get mergeKey => NestedStyleAttribute;

  @override
  List<Object?> get props => [value];
}
