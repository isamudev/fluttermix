import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: BlockAnimation())),
    );
  }
}

enum AnimationPhases {
  initial,
  compress,
  expanded;

  double get scale => switch (this) {
    initial => 1,
    compress => 0.75,
    expanded => 1.25,
  };

  CurveAnimationConfig get config => switch (this) {
    initial => CurveAnimationConfig.decelerate(200.ms),
    compress => CurveAnimationConfig.decelerate(100.ms),
    expanded => CurveAnimationConfig.bounceOut(600.ms),
  };
}

class BlockAnimation extends StatefulWidget {
  const BlockAnimation({super.key});

  @override
  State<BlockAnimation> createState() => _BlockAnimationState();
}

class _BlockAnimationState extends State<BlockAnimation> {
  final trigger = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final style = Style.box()
        .color(Colors.deepPurpleAccent)
        .height(100)
        .width(100)
        .borderRadius(BorderRadiusMix.all(Radius.circular(30)))
        .transformAlignment(Alignment.center)
        .phaseAnimation(
          trigger: trigger,
          phases: AnimationPhases.values,
          styleBuilder: (phase, style) => style.scale(phase.scale),
          configBuilder: (phase) => phase.config,
        );

    return GestureDetector(
      onTap: () {
        trigger.value = !trigger.value;
      },
      child: Box(style: style),
    );
  }
}
