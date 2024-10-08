part of 'spinner.dart';

class RxSpinner extends StatelessWidget {
  const RxSpinner({super.key, this.style = const Style.empty()})
      : _blank = false;

  const RxSpinner.blank({super.key, required this.style}) : _blank = true;

  final Style style;
  final bool _blank;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: _blank ? style : XSpinnerStyle.base.merge(style),
      builder: (context) {
        final SpinnerWidget = SpinnerSpec.of(context);

        return SpinnerWidget();
      },
    );
  }
}

class RxSpinnerSpecWidget extends StatefulWidget {
  const RxSpinnerSpecWidget({this.spec = const SpinnerSpec(), super.key});

  final SpinnerSpec spec;

  @override
  _RxSpinnerSpecWidgetState createState() => _RxSpinnerSpecWidgetState();
}

class _RxSpinnerSpecWidgetState extends State<RxSpinnerSpecWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.spec.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant RxSpinnerSpecWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.spec.duration != widget.spec.duration) {
      controller.duration = widget.spec.duration;
      controller.repeat();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spec = widget.spec;
    final color = spec.color;
    final strokeWidth = spec.strokeWidth ?? 1;
    final size = spec.size;
    final painter = spec.style == SpinnerStyle.dotted
        ? DottedSpinnerPainter(
            animation: controller,
            strokeWidth: strokeWidth,
            color: color,
          )
        : SolidSpinnerPainter(
            animation: controller,
            strokeWidth: strokeWidth,
            color: color,
          );

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(painter: painter, size: Size(size, size));
      },
    );
  }
}
